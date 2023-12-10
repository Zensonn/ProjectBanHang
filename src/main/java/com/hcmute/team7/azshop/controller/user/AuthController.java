package com.hcmute.team7.azshop.controller.user;


import com.hcmute.team7.azshop.enums.Role;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IUserService;
import com.hcmute.team7.azshop.utils.Constant;
import com.hcmute.team7.azshop.utils.Email;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = {"/user/login", "/buyer/register", "/user/forgot",
        "/user/waiting", "/user/verifyCode", "/user/logout", "/vendor/register"})
public class AuthController extends HttpServlet {

    @Inject
    private IUserService userService;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String url = request.getRequestURL().toString();

        if (url.contains("register")) {
            request.getRequestDispatcher("/views/web/register.jsp").forward(request, response);
        } else if (url.contains("login")) {
            getLogin(request, response);
        } else if (url.contains("forgot")) {
            request.getRequestDispatcher("/views/web/forgot-password.jsp").forward(request, response);
        } else if (url.contains("waiting")) {
            getWaiting(request, response);
        } else if (url.contains("verifyCode")) {
            request.getRequestDispatcher("/views/web/verify.jsp").forward(request, response);
        } else {
            getLogout(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("register")) {
            postRegister(request, response);
        } else if (url.contains("login")) {
            postLogin(request, response);
        } else if (url.contains("forgot")) {
            postForgotPassword(request, response);
        } else {
            postVerifyCode(request, response);
        }
    }

    protected void getWaiting(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Kiểm tra session
        HttpSession session = request.getSession();
        if(session != null && session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");
            request.setAttribute("email", user.getEmail());
            if(user.getRole() == Role.USER) {
                response.sendRedirect("/home");
            } else if (user.getRole() == Role.ADMIN) {
                response.sendRedirect("/admin");
            } else {
                response.sendRedirect("/vendor/product");
            }
        } else {
            response.sendRedirect("/user/login");
        }
    }

    protected void postRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding(Constant.ENCODING);
        response.setCharacterEncoding(Constant.ENCODING);

        String url = request.getRequestURI();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");

        String alertMsg = "";
        if (userService.checkExistEmail(email)) {
            alertMsg = "Email đã tồn tại";
            request.setAttribute("error", alertMsg);
            request.getRequestDispatcher("/views/web/register.jsp").forward(request, response);
        } else if (userService.checkExistUserName(userName)) {
            alertMsg = "Tên tài khoản đã tồn tại";
            request.setAttribute("error", alertMsg);
            request.getRequestDispatcher("/views/web/register.jsp").forward(request, response);
        } else {
            Email sm = new Email();

            // Tạo ra một số ngẫu nhiên 6 số
            String code = sm.getRandom();

            // Tạo user
            User user = new User(userName, fullName, email, code);

            boolean test = sm.sendEmail(user);

            // Kiểm tra mail có gửi được không ?
            if (test) {
                // Tạo session
                HttpSession session = request.getSession();
                session.setAttribute("account", user);

                // Kiểm tra có đăng kí được không ?
                boolean isSuccess = false;
                if(url.equals("/buyer/register")) {
                    isSuccess = userService.Register(userName, fullName, email, code, password);
                } else if(url.equals("/vendor/register")) {
                    isSuccess = userService.registerForVendor(userName, fullName, email, code, password);
                }

                if(isSuccess) {
                    response.sendRedirect("/user/verifyCode");
                } else {
                    alertMsg = "Lỗi hệ thống";
                    request.setAttribute("error", alertMsg);
                    request.getRequestDispatcher("/views/web/register.jsp").forward(request, response);
                }
            } else {
                PrintWriter out = response.getWriter();
                out.println("Lỗi gửi mail !!!!");
            }
        }
    }

    protected void getLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm trả session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect("/user/waiting");
            return;
        }

        // Kiểm tra cookie
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    session = request.getSession(true);
                    session.setAttribute("email", cookie.getValue());
                    response.sendRedirect("/user/waiting");
                    return;
                }
            }
        }

        request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
    }

    protected void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean  isRememberMe = false;
        String remember = request.getParameter("remember");

        if ("on".equals(remember)) {
            isRememberMe = true;
        }

        String alertMsg = "";

        if (email.isEmpty() || password.isEmpty()) {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng !";
            request.setAttribute("error", alertMsg);
            request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
        }

        User user = userService.login(email, password);

        if (user != null) {
            if(user.getEmailActive()) {
                // Tạo session
                HttpSession session = request.getSession();
                session.setAttribute("account", user);

                if (isRememberMe) {
                    saveRememberMe(response, email);
                }

                response.sendRedirect("/user/waiting");
            } else {
                alertMsg = "Tài khoản đã bị khóa, vui lòng liên hệ admin để được xử lý";
                request.setAttribute("error", alertMsg);
                request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
            }
        } else {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng !";
            request.setAttribute("error", alertMsg);
            request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
        }
    }

    protected void postForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        User user = userService.findByEmail(email);

        if(user == null) {
            request.setAttribute("error", "Email không tồn tại !");
            request.getRequestDispatcher("/views/web/forgot-password.jsp").forward(request, response);
        } else {
            Email sm = new Email();

            boolean test = sm.emailSend(user);
            if (test) {
                request.setAttribute("message", "Vui lòng kiểm tra mail để nhận lại mật khẩu");
            } else {
                request.setAttribute("error", "Hệ thống gặp lỗi");
            }
        }
        request.getRequestDispatcher("/views/web/forgot-password.jsp").forward(request, response);
    }

    protected void postVerifyCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String alertMsg = "";
        // Truy cập session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        String code = request.getParameter("authCode");

        if(code != null && code.equals(user.getCode())) {
            userService.updateEmailActive(user.getEmail());

            alertMsg = "Đăng ký thành công !";
            request.setAttribute("message", alertMsg);
            request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
        } else {
            alertMsg = "Sai mã kích hoạt vui lòng kiểm tra lại !";
            request.setAttribute("error", alertMsg);
        }
    }

    protected void saveRememberMe(HttpServletResponse response, String email)  {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, email);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }

    protected void getLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        session.removeAttribute("account");

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (Constant.COOKIE_REMEMBER.equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
                }
            }
        }
        response.sendRedirect("/user/login");
    }



    // Các phương thức dành cho người bán


}