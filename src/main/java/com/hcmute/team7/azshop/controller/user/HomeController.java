package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;
import com.hcmute.team7.azshop.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("account");
//
//        if (user != null) {
//            Cart cart = user.getCart();
//            Set<CartItem> cartItems = user.getCart().getCartItems();
//
//            session.setAttribute("totalItemInCart", cart.getTotalItem());
//            request.setAttribute("cartItems", cartItems);
//        } else {
//            session.setAttribute("totalItemInCart", 0);
//        }

        request.getRequestDispatcher("/views/user/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}