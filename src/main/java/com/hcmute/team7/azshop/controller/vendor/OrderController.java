package com.hcmute.team7.azshop.controller.vendor;

import com.hcmute.team7.azshop.entity.Orders;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.enums.Role;
import com.hcmute.team7.azshop.service.IOrderService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/vendor/orders", "/vendor/accept-order", "/vendor/cancel-order", "/vendor/view-order"})
public class OrderController extends HttpServlet {
    @Inject
    private IOrderService orderService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("orders")) {
            orders(request, response);
        } else if (url.contains("accept-order")) {
            acceptOrder(request, response);
        } else {
            cancelOrder(request, response);
        }
    }

    protected void orders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user != null && user.getRole() == Role.VENDOR) {

            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;

            List<Orders> ordersList = orderService.findAllOrdersByStore(page, pageSize, user.getStore().getId());

            request.setAttribute("ordersList", ordersList);
            request.getRequestDispatcher("/views/vendor/order/order-list.jsp").forward(request, response);
        } else {
            response.sendRedirect("/user/login");
        }
    }

    protected void acceptOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        Long orderId = Long.parseLong(request.getParameter("id"));

        if (user != null && user.getRole() == Role.VENDOR) {
            orderService.acceptOrder(orderId);
            response.sendRedirect("/vendor/orders");
        } else {
            response.sendRedirect("/user/login");
        }
    }

    protected void cancelOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        Long orderId = Long.parseLong(request.getParameter("id"));

        if (user != null && user.getRole() == Role.VENDOR) {
            orderService.cancelOrder(orderId);
            response.sendRedirect("/vendor/orders");
        } else {
            response.sendRedirect("/user/login");
        }
    }
}