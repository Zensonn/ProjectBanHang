package com.hcmute.team7.azshop.controller.vendor;

import com.hcmute.team7.azshop.entity.Orders;
import com.hcmute.team7.azshop.service.IOrdersService;
import com.hcmute.team7.azshop.utils.Constant;
import com.hcmute.team7.azshop.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = {"/vendor/order", "/vendor/order/new", "/vendor/order/create",
        "/vendor/order/update", "/vendor/order/edit", "/vendor/order/delete"})

public class OrdersController extends HttpServlet {
    @Inject
    private IOrdersService ordersService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        Orders orders;

        if (url.contains("new")) {
            request.getRequestDispatcher(Constant.Path.ORDER_FORM).forward(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
            orders = new Orders();
            request.setAttribute("orders", orders);
        } else if (url.contains("edit")) {
            edit(request, response);
        } else {
            findAll(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String url = request.getRequestURL().toString();

        if (url.contains("create")) {
            create(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else {
            findAll(request, response);
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
            String keyword = request.getParameter("keyword");

            Long ordersCount = ordersService.count();

            int totalPage = (int) (ordersCount / pageSize);
            if (ordersCount % pageSize != 0) {
                totalPage++;
            }

            List<Orders> order = ordersService.findAll(keyword, page, pageSize);

            request.setAttribute("ordersCount", ordersCount);
            request.setAttribute("order", order);

            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPage", totalPage);

            request.getRequestDispatcher(Constant.Path.ORDER_LIST).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Orders orders = new Orders();
            BeanUtils.populate(orders, request.getParameterMap());

            /*if (request.getPart("image").getSize() != 0) {
                String fileName = " " + System.currentTimeMillis();
                product.setImage(UploadUtils.processUpload("image", request, Constant.DIR + "\\product\\", fileName));
            }*/

            ordersService.update(orders);
            response.sendRedirect(Constant.Url.VENDOR_ORDER);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            long ordersID = Long.parseLong(request.getParameter("id"));

            Orders existingOrders = ordersService.findById(ordersID);

            request.setAttribute("orders", existingOrders);
            request.getRequestDispatcher(Constant.Path.ORDER_FORM).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Orders updateOrders = new Orders();
            BeanUtils.populate(updateOrders, request.getParameterMap());

            Orders oldOrders = ordersService.findById(updateOrders.getId());

            /*// Xử lý hình ảnh
            if (request.getPart("image").getSize() == 0) {
                updateProduct.setImage(oldProduct.getImage());
            } else {
                if (oldProduct.getImage() != null) {
                    // Xóa ảnh cũ đi
                    String fileName = oldProduct.getImage();
                    File file = new File(Constant.DIR + "\\product\\" + fileName);
                    if (file.delete()) {
                        System.out.println("Đã xóa thành công");
                    } else {
                        System.out.println(Constant.DIR + "\\product\\" + fileName);
                    }
                }
                String fileName = " " + System.currentTimeMillis();
                updateProduct.setImage(UploadUtils.processUpload("image", request, Constant.DIR + "\\product\\", fileName));
            }*/

            ordersService.update(updateOrders);
            response.sendRedirect(Constant.Url.VENDOR_ORDER);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            long ordersID = Long.parseLong(request.getParameter("id"));
            ordersService.softDelete(ordersID);
            response.sendRedirect(Constant.Url.VENDOR_ORDER);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
