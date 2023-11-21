package com.hcmute.team7.azshop.controller.vendor;

import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.service.ICategoryService;
import com.hcmute.team7.azshop.service.IProductService;
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
@WebServlet(urlPatterns = {"/vendor/product", "/vendor/product/new", "/vendor/product/create",
        "/vendor/product/update", "/vendor/product/edit", "/vendor/product/delete"})

public class ProductController extends HttpServlet {
    @Inject
    private IProductService productService;
    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        Product product;

        if (url.contains("new")) {
            showNewForm(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
            product = new Product();
            request.setAttribute("product", product);
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

            Long productCount = productService.count();

            int totalPage = (int) (productCount / pageSize);
            if (productCount % pageSize != 0) {
                totalPage++;
            }

            List<Product> products = productService.findAll(keyword, page, pageSize);

            List<Category> categories = categoryService.findAll();
            request.setAttribute("categories", categories);

            request.setAttribute("productCount", productCount);
            request.setAttribute("products", products);

            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPage", totalPage);

            request.getRequestDispatcher(Constant.Path.PRODUCT_LIST).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Product product = new Product();
            BeanUtils.populate(product, request.getParameterMap());

            if (request.getPart("image").getSize() != 0) {
                String fileName = " " + System.currentTimeMillis();
                product.setImage(UploadUtils.processUpload("image", request, Constant.DIR + "\\product\\", fileName));
            }
            Long categoryID = Long.valueOf(request.getParameter("category.id"));
            Category category = categoryService.findById(categoryID);
            product.setCategory(category);

            productService.update(product);
            response.sendRedirect(Constant.Url.VENDOR_PRODUCT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            long productId = Long.parseLong(request.getParameter("id"));

            Product existingProduct = productService.findById(productId);

            request.setAttribute("product", existingProduct);
            request.getRequestDispatcher(Constant.Path.PRODUCT_FORM).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Product updateProduct = new Product();
            BeanUtils.populate(updateProduct, request.getParameterMap());

            Product oldProduct = productService.findById(updateProduct.getId());

            // Xử lý hình ảnh
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
            }

            productService.update(updateProduct);
            response.sendRedirect(Constant.Url.VENDOR_PRODUCT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            long productId = Long.parseLong(request.getParameter("id"));
            productService.softDelete(productId);
            response.sendRedirect(Constant.Url.VENDOR_PRODUCT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();

        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher(Constant.Path.PRODUCT_FORM);
        dispatcher.forward(request, response);
    }
}
