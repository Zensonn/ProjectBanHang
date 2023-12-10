package com.hcmute.team7.azshop.controller.user;

import com.hcmute.team7.azshop.config.VNPayConfig;
import com.hcmute.team7.azshop.entity.*;
import com.hcmute.team7.azshop.enums.Role;
import com.hcmute.team7.azshop.service.IOrderService;
import com.hcmute.team7.azshop.service.IUserService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(urlPatterns = {"/check-out", "/save-order", "/completed-order", "/submitOrder-vnpay"})
public class OrderController extends HttpServlet {

    @Inject
    private IUserService userService;
    @Inject
    private IOrderService orderService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("check-out")) {
            checkout(request, response);
        } else if (url.contains("completed-order")) {
            completeOrder(request, response);
        } else if (url.contains("/submitOrder-vnpay")) {
            getPay(request, response);
        }  else {
            saveOrder(request, response);
        }
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if(user != null) {
            String email = user.getEmail();
            User customer = userService.findByEmail(email);

            // Kiểm tra xem có thông tin cần thiết chưa ?
            if (customer.getAddresses() == null || customer.getPhone() == null) {
                // Đặt một danh sách orders rỗng
                List<Orders> emptyOrdersList = new ArrayList<>();
                request.setAttribute("orders", emptyOrdersList);
                // Chuyển hướng đến my-account
                response.sendRedirect("/my-account");
            } else {
                Cart cart = customer.getCart();
                // Đặt các thuộc tính cần thiết
                request.setAttribute("customer", customer);
                request.setAttribute("cart", cart);
                // Chuyển tiếp đến trang checkout
                request.getRequestDispatcher("/views/user/checkout.jsp").forward(request, response);
            }
        } else {
            // Chuyển hướng đến trang đăng nhập nếu không có thông tin người dùng
            response.sendRedirect("/user/login");
        }
    }

    protected void saveOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if(user == null) {
            response.sendRedirect("/user/login");
        } else {
            String email = user.getEmail();
            User customer = userService.findByEmail(email);
            Cart cart = customer.getCart();

            orderService.create(cart, 1L);
            response.sendRedirect("/my-account");
        }
    }

    protected void completeOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        Long orderId = Long.parseLong(request.getParameter("id"));

        if (user != null && user.getRole() == Role.USER) {
            orderService.completeOrder(orderId);
            response.sendRedirect("/my-account");
        } else {
            response.sendRedirect("/user/login");
        }
    }

    protected void getPay(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int orderTotal = Integer.parseInt(request.getParameter("orderTotal"));

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = orderTotal* 100L;
        String bankCode = "NCB";

        String vnp_TxnRef = VNPayConfig.getRandomNumber(8);
        String vnp_IpAddr = "127.0.0.1";

        String vnp_TmnCode = VNPayConfig.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        vnp_Params.put("vnp_BankCode", bankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", VNPayConfig.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;

        response.sendRedirect(paymentUrl);
    }
}