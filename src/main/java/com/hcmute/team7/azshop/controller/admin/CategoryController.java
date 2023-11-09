package com.hcmute.team7.azshop.controller.admin;

import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.service.ICategoryService;
import com.hcmute.team7.azshop.utils.Constant;
import com.hcmute.team7.azshop.utils.UploadUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.util.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = {"/admin/category", "/admin/category/new", "/admin/category/create",
        "/admin/category/update", "/admin/category/edit", "/admin/category/delete"})
public class CategoryController extends HttpServlet {
    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        Category category;

        if (url.contains("new")) {
            request.getRequestDispatcher(Constant.Path.CATEGORY_FORM).forward(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
            category = new Category();
            request.setAttribute("category", category);
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

            Long categoryCount = categoryService.count();

            int totalPage = (int) (categoryCount / pageSize);
            if (categoryCount % pageSize != 0) {
                totalPage++;
            }

            if (page > totalPage) {
                page = totalPage;
            }

            List<Category> categories = categoryService.findAll(keyword, page, pageSize);

            request.setAttribute("categoryCount", categoryCount);
            request.setAttribute("categories", categories);

            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPage", totalPage);

            request.getRequestDispatcher(Constant.Path.CATEGORY_LIST).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Category category = new Category();
            BeanUtils.populate(category, request.getParameterMap());

            if (request.getPart("image").getSize() != 0) {
                String fileName = " " + System.currentTimeMillis();
                category.setImage(UploadUtils.processUpload("image", request, Constant.DIR + "\\category\\", fileName));
            }

            categoryService.update(category);
            response.sendRedirect(Constant.Url.ADMIN_CATEGORY);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            long categoryId = Long.parseLong(request.getParameter("id"));

            Category existingCategory = categoryService.findById(categoryId);

            request.setAttribute("category", existingCategory);
            request.getRequestDispatcher(Constant.Path.CATEGORY_FORM).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Category updateCategory = new Category();
            BeanUtils.populate(updateCategory, request.getParameterMap());

            Category oldCategory = categoryService.findById(updateCategory.getId());

            // Xử lý hình ảnh
            if (request.getPart("image").getSize() == 0) {
                updateCategory.setImage(oldCategory.getImage());
            } else {
                if (oldCategory.getImage() != null) {
                    // Xóa ảnh cũ đi
                    String fileName = oldCategory.getImage();
                    File file = new File(Constant.DIR + "\\category\\" + fileName);
                    if (file.delete()) {
                        System.out.println("Đã xóa thành công");
                    } else {
                        System.out.println(Constant.DIR + "\\category\\" + fileName);
                    }
                }
                String fileName = " " + System.currentTimeMillis();
                updateCategory.setImage(UploadUtils.processUpload("image", request, Constant.DIR + "\\category\\", fileName));
            }

            categoryService.update(updateCategory);
            response.sendRedirect(Constant.Url.ADMIN_CATEGORY);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            long categoryId = Long.parseLong(request.getParameter("id"));
            categoryService.softDelete(categoryId);
            response.sendRedirect(Constant.Url.ADMIN_CATEGORY);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}