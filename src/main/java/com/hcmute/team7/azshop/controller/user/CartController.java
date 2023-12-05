package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.ICartService;
import com.hcmute.team7.azshop.service.IProductService;
import com.hcmute.team7.azshop.service.IUserService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Set;

@WebServlet(urlPatterns = {"/add-to-cart", "/view-cart", "/cart-action"})
public class CartController extends HttpServlet {

    @Inject
    private IProductService productService;
    @Inject
    private ICartService cartService;
    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("view-cart")) {
            viewCart(request, response);
        } else if (url.contains("add-to-cart")) {
            addToCart(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            updateItemInCart(request, response);
        } else if ("delete".equals(action)) {
            deleteItemFromCart(request, response);
        } else {
            viewCart(request, response);
        }
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long productId = Long.parseLong(request.getParameter("id"));
        Product product = productService.findById(productId);

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            cartService.addToCart(product, 1, user);
            response.sendRedirect("/view-cart");
        }
    }

    protected void viewCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        String info = "";
        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            if (user.getCart() == null) {
                info = "Mua hàng đi bạn ơi !!!";
                request.setAttribute("info", info);
            }
            Cart cart = user.getCart();
            Set<CartItem> cartItems = user.getCart().getCartItems();

            session.setAttribute("totalItemInCart", cart.getTotalItem());
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("subTotal", cart.getTotalMoney());

            request.getRequestDispatcher("/views/user/cart.jsp").forward(request, response);
        }
    }

    protected void updateItemInCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Long productId = Long.parseLong(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = productService.findById(productId);

        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            cartService.updateItemInCart(product, quantity, user);
            response.sendRedirect("/view-cart");
        }
    }

    protected void deleteItemFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Long productId = Long.parseLong(request.getParameter("id"));

        Product product = productService.findById(productId);

        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            cartService.deleteItemFromCart(product, user);
            // Update the user in the session
            session.setAttribute("account", userService.findByEmail(user.getEmail()));
            response.sendRedirect("/view-cart");
        }
    }
}