package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IUserService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/check-out"})
public class OrderController extends HttpServlet {

    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        }

        String email = user.getEmail();

        User customer = userService.findByEmail(email);

        // Kiểm tra xem có thông tin cần thiết chưa ?
        if (customer.getAddresses().trim().isEmpty() || customer.getPhone().trim().isEmpty()) {
            response.sendRedirect("/my-account");
        } else {
            // to be continue

            request.getRequestDispatcher("/views/user/checkout.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}