package com.hcmute.team7.azshop.controller.admin;

import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Style;
import com.hcmute.team7.azshop.service.ICategoryService;
import com.hcmute.team7.azshop.service.IStyleService;
import com.hcmute.team7.azshop.utils.Constant;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/style", "/admin/style/new", "/admin/style/create",
        "/admin/style/update", "/admin/style/edit", "/admin/style/delete"})
public class StyleController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;
    @Inject
    private IStyleService styleService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        Style style;

        if (url.contains("new")) {
            showNewForm(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
            style = new Style();
            request.setAttribute("style", style);
        } else if (url.contains("edit")) {
            edit(request, response);
        }
        findAll(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();

        if (url.contains("create")) {
            create(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        }
        findAll(request, response);
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
            String keyword = request.getParameter("keyword");

            Long styleCount = styleService.count();

            int totalPage = (int) (styleCount / pageSize);
            if (styleCount % pageSize != 0) {
                totalPage++;
            }

            if (page > totalPage) {
                page = totalPage;
            }

            List<Style> styles = styleService.findAll(keyword, page, pageSize);

            request.setAttribute("styles", styles);
            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPage", totalPage);

            request.getRequestDispatcher(Constant.Path.STYLE_LIST).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();

        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher(Constant.Path.STYLE_FORM);
        dispatcher.forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Long categoryId = Long.parseLong(request.getParameter("category.id"));

            Style style = new Style();
            BeanUtils.populate(style, request.getParameterMap());

            Category category = categoryService.findById(categoryId);
            style.setCategory(category);

            styleService.update(style);
            response.sendRedirect("/admin/style");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            Long styleId = Long.parseLong(request.getParameter("id"));

            Style style = styleService.findById(styleId);
            List<Category> categories = categoryService.findAll();

            request.setAttribute("style", style);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher(Constant.Path.STYLE_FORM).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Long categoryId = Long.parseLong(request.getParameter("category.id"));

            Style styleUpdate = new Style();
            BeanUtils.populate(styleUpdate, request.getParameterMap());

            Category category = categoryService.findById(categoryId);
            styleUpdate.setCategory(category);

            styleService.update(styleUpdate);
            response.sendRedirect("/admin/style");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            Long styleId = Long.parseLong(request.getParameter("id"));

            styleService.softDelete(styleId);
            response.sendRedirect("/admin/style");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}