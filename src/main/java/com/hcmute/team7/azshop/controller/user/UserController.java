package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IUserService;
import com.hcmute.team7.azshop.utils.Constant;
import com.hcmute.team7.azshop.utils.UploadUtils;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = {"/my-account", "/update-account"})
public class UserController extends HttpServlet {

    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding(Constant.ENCODING);
        response.setCharacterEncoding(Constant.ENCODING);

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            String email = user.getEmail();

            User customer = userService.findByEmail(email);

            request.setAttribute("customer", customer);
            request.getRequestDispatcher("/views/user/my-account.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding(Constant.ENCODING);
        response.setCharacterEncoding(Constant.ENCODING);

        HttpSession session = request.getSession();

        String phone = request.getParameter("phone");
        String addresses = request.getParameter("addresses");
        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            String email = user.getEmail();

            User customer = userService.findByEmail(email);

            User oldCustomer = userService.findByEmail(email);

            customer.setAddresses(addresses);
            customer.setPhone(phone);

            // Xử lý phần ảnh đại diện
            if (request.getPart("avatar").getSize() == 0) {
                customer.setAvatar(oldCustomer.getAvatar());
            } else {
                if (customer.getAvatar() != null) {
                    // Xóa ảnh cũ đi
                    String fileName = oldCustomer.getAvatar();
                    File file = new File(String.format("%s\\category\\%s", Constant.DIR, fileName));
                    if (file.delete()) {
                        System.out.println("Đã xóa thành công");
                    } else {
                        System.out.println(Constant.DIR + "\\category\\" + fileName);
                    }
                }
                String fileName = " " + System.currentTimeMillis();
                customer.setAvatar(UploadUtils.processUpload("avatar", request, Constant.DIR + "\\category\\", fileName));
            }

            userService.update(customer);

            response.sendRedirect("/my-account");
        }
    }
}