package com.hcmute.team7.azshop.controller.admin;


import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IUserService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/user", "/admin/ban-user", "/admin/unban-user"})
public class UserController extends HttpServlet {
    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("/ban-user")) {
            ban(request, response);
        } else if (url.contains("/unban-user")) {
            unban(request, response);
        } else {
            findAll(request, response);
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
        String keyword = request.getParameter("keyword");

        Long countUser = userService.count();

        int totalPage = (int) (countUser / pageSize);
        if (countUser % pageSize != 0) {
            totalPage++;
        }

        if (page > totalPage) {
            page = totalPage;
        }

        List<User> users = userService.findAll(keyword, page, pageSize);

        request.setAttribute("users", users);
        request.setAttribute("currentPage", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPage", totalPage);

        request.getRequestDispatcher("/views/admin/user/user-list.jsp").forward(request, response);
    }

    protected void ban(HttpServletRequest request, HttpServletResponse response) {
        try {
            String email = request.getParameter("email");
            userService.ban(email);
            response.sendRedirect("/admin/user");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void unban(HttpServletRequest request, HttpServletResponse response) {
        try {
            String email = request.getParameter("email");
            userService.updateEmailActive(email);
            response.sendRedirect("/admin/user");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}