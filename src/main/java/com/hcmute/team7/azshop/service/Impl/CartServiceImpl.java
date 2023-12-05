package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.CartDAO;
import com.hcmute.team7.azshop.DAO.CartItemDAO;
import com.hcmute.team7.azshop.DAO.UserDAO;
import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.ICartService;

import javax.inject.Inject;
import java.util.HashSet;
import java.util.Set;

public class CartServiceImpl implements ICartService {
    @Inject
    private CartDAO cartDAO;
    @Inject
    private CartItemDAO cartItemDAO;
    @Inject
    private UserDAO userDAO;

    @Override
    public void addToCart(Product product, int quantity, User user) {
        Cart cart = user.getCart();

        if (cart == null) {
            cart = new Cart();
            user.setCart(cart);
            userDAO.update(user);
        }

        Set<CartItem> cartItems = cart.getCartItems();

        // Tạo danh sách sản phẩm
        if (cartItems == null) {
            cartItems = new HashSet<>();
            cart.setCartItems(cartItems);
        }

        CartItem cartItem = findCartItem(cartItems, product.getId());

        // Kiểm tra sản phẩm có trong danh sách chưa
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setProduct(product);

            // Kiểm tra sản phẩm có giảm giá không ?
            if (product.getPercentDiscount() == 0) {
                cartItem.setTotalPrice(quantity * product.getPrice());
            } else {
                cartItem.setTotalPrice(quantity * product.getPromotionalPrice());
            }

            cartItem.setQuantity(quantity);
            cartItem.setCart(cart);
            cartItems.add(cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + quantity);

            // Kiểm tra sản phẩm có giảm giá không ?
            if (product.getPercentDiscount() == 0) {
                cartItem.setTotalPrice(cartItem.getTotalPrice() + (quantity * product.getPrice()));
            } else {
                cartItem.setTotalPrice(cartItem.getTotalPrice() + (quantity * product.getPromotionalPrice()));
            }
        }

        cartItemDAO.update(cartItem);

        int totalItem = totalItem(cart.getCartItems());
        int money = totalMoney(cart.getCartItems());

        cart.setCartItems(cartItems);
        cart.setUser(user);
        cart.setTotalItem(totalItem);
        cart.setTotalMoney(money);

        cartDAO.update(cart);
    }

    @Override
    public void updateItemInCart(Product product, int quantity, User user) {
        Cart cart = user.getCart();

        Set<CartItem> cartItems = cart.getCartItems();

        CartItem item = findCartItem(cartItems, product.getId());

        item.setQuantity(quantity);
        if (product.getPercentDiscount() == 0) {
            item.setTotalPrice(quantity * product.getPrice());
        } else {
            item.setTotalPrice(quantity * product.getPromotionalPrice());
        }

        cartItemDAO.update(item);

        int totalItem = totalItem(cartItems);
        int totalMoney = totalMoney(cartItems) * quantity;

        cart.setTotalItem(totalItem);
        cart.setTotalMoney(totalMoney);

        cartDAO.update(cart);
    }

    @Override
    public void deleteItemFromCart(Product product, User user) {
        Cart cart = user.getCart();

        Set<CartItem> cartItems = cart.getCartItems();

        CartItem item = findCartItem(cartItems, product.getId());

        if (item != null) {
            cartItems.remove(item);
            cartItemDAO.delete(item.getId());
        }

        int totalItem = totalItem(cartItems);
        int totalMoney = totalMoney(cartItems);

        cart.setCartItems(cartItems);
        cart.setTotalItem(totalItem);
        cart.setTotalMoney(totalMoney);

        cartDAO.update(cart);
    }

    private CartItem findCartItem(Set<CartItem> cartItems, Long productId) {
        if (cartItems == null) {
            return null;
        }

        CartItem cartItem = null;

        for (CartItem item : cartItems) {
            if (item.getProduct().getId().equals(productId)) {
                cartItem = item;
            }
        }
        return cartItem;
    }

    private int totalItem(Set<CartItem> cartItems) {
        int t = 0;
        for (CartItem cartItem : cartItems)
            t += cartItem.getQuantity();

        return t;
    }

    public int totalMoney(Set<CartItem> cartItems) {
        int money = 0;

        for (CartItem cartItem : cartItems) {
            if (cartItem.getProduct().getPercentDiscount() == 0) {
                money += cartItem.getProduct().getPrice();
            } else {
                money += cartItem.getProduct().getPromotionalPrice();
            }
        }

        return money;
    }
}
