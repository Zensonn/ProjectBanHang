package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.CartDAO;
import com.hcmute.team7.azshop.DAO.CartItemDAO;
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

    @Override
    public void addToCart(Product product, int quantity, User user) {
        Cart cart = user.getCart();
        Set<CartItem> cartItems = cart.getCartItems();

        // Tạo danh sách sản phẩm nếu chưa có
        if (cartItems == null) {
            cartItems = new HashSet<>();
            cart.setCartItems(cartItems);
        }

        CartItem cartItem = findCartItem(cartItems, product.getId());

        // Kiểm tra sản phẩm có trong danh sách chưa
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(quantity);
            cartItem.setTotalPrice(calculateTotalPrice(product, quantity));
            cartItem.setCart(cart);
            cartItems.add(cartItem);

            // Tạo mới cartItem vì nó chưa tồn tại trong cơ sở dữ liệu
            cartItemDAO.create(cartItem);
        } else {
            // Cập nhật số lượng và giá tổng cho cartItem
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            cartItem.setTotalPrice(cartItem.getTotalPrice() + calculateTotalPrice(product, quantity));
            cartItemDAO.update(cartItem);
        }

        // Tính toán tổng số lượng và tổng tiền một lần cuối cùng
        cart.setTotalItem(totalItem(cartItems));
        cart.setTotalMoney(totalMoney(cartItems));

        // Cập nhật hoặc tạo mới cart tùy thuộc vào trạng thái của nó
        if (cart.getId() == null) {
            cartDAO.create(cart);
        } else {
            cartDAO.update(cart);
        }
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

        for (CartItem item : cartItems) {
            if (item.getProduct().getId().equals(productId)) {
                return item; // Thoát khỏi vòng lặp ngay khi tìm thấy sản phẩm phù hợp
            }
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm trong giỏ hàng
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
                money += cartItem.getProduct().getPrice() * cartItem.getQuantity();
            } else {
                money += cartItem.getProduct().getPromotionalPrice() * cartItem.getQuantity();
            }
        }

        return money;
    }

    private int calculateTotalPrice(Product product, int quantity) {
        // Kiểm tra sản phẩm có giảm giá không và tính giá
        if (product.getPercentDiscount() == 0) {
            return quantity * product.getPrice();
        } else {
            return quantity * product.getPromotionalPrice();
        }
    }
}