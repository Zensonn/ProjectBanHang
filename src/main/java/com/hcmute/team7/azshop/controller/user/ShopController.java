package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IProductService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet(urlPatterns = {"/shop", "/product-detail"})
public class ShopController extends HttpServlet {
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("/product-detail")) {
            productDetail(request, response);
        } else {
            shop(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void shop(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        // Lấy số lượng sản phẩm trong giỏ hàng
        if (user != null) {
            Cart cart = user.getCart();
            Set<CartItem> cartItems = user.getCart().getCartItems();

            session.setAttribute("totalItemInCart", cart.getTotalItem());
            request.setAttribute("cartItems", cartItems);
        } else {
            session.setAttribute("totalItemInCart", 0);
        }

        // Load tất cả sản phẩm lên
        List<Product> products = productService.findAll();

        request.setAttribute("products", products);
        request.getRequestDispatcher("/views/user/shop.jsp").forward(request, response);
    }

    protected void productDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
}