package com.hcmute.team7.azshop.controller.admin;

import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Style;
import com.hcmute.team7.azshop.entity.StyleValue;
import com.hcmute.team7.azshop.service.ICategoryService;
import com.hcmute.team7.azshop.service.IStyleService;
import com.hcmute.team7.azshop.service.IStyleValueService;
import com.hcmute.team7.azshop.utils.Constant;
import org.apache.commons.beanutils.BeanUtils;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/style-value", "/admin/style-value/new", "/admin/style-value/create",
        "/admin/style-value/update", "/admin/style-value/edit", "/admin/style-value/delete"})
public class StyleValueController extends HttpServlet {

    @Inject
    private IStyleValueService styleValueService;
    @Inject
    private ICategoryService categoryService;
    @Inject
    private IStyleService styleService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        StyleValue styleValue;

        if (url.contains("new")) {
            showNewForm(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
            styleValue = new StyleValue();
            request.setAttribute("styleValue", styleValue);
        } else if (url.contains("edit")) {
            edit(request, response);
        } else {
            findAll(request, response);
        }
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
        } else {
            findAll(request, response);
        }
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) {
        try {
            int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
            String keyword = request.getParameter("keyword");

            Long styleValueCount = styleValueService.count();

            int totalPage = (int) (styleValueCount / pageSize);
            if (styleValueCount % pageSize != 0) {
                totalPage++;
            }

            if (page > totalPage) {
                page = totalPage;
            }

            List<StyleValue> styleValues = styleValueService.findAll(keyword, page, pageSize);

            request.setAttribute("styleValues", styleValues);
            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPage", totalPage);

            request.getRequestDispatcher(Constant.Path.STYLE_VALUE_LIST).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        List<Style> styles = styleService.findAll();

        request.setAttribute("categories", categories);
        request.setAttribute("styles", styles);
        RequestDispatcher dispatcher = request.getRequestDispatcher(Constant.Path.STYLE_VALUE_FORM);
        dispatcher.forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Long styleId = Long.parseLong(request.getParameter("style.id"));

            StyleValue styleValue = new StyleValue();
            BeanUtils.populate(styleValue, request.getParameterMap());

            Style style = styleService.findById(styleId);
            styleValue.setStyle(style);

            styleValueService.update(styleValue);
            response.sendRedirect("/admin/style-value");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response) {
        try {
            Long styleValueId = Long.parseLong(request.getParameter("id"));

            StyleValue styleValue = styleValueService.findById(styleValueId);

            // Lấy Style của styleValue
            List<Style> styles = styleService.findAll();

            // Lấy Category của styleValue
            List<Category> categories = categoryService.findAll();

            request.setAttribute("categories", categories);
            request.setAttribute("styleValue", styleValue);
            request.setAttribute("styles", styles);
            request.getRequestDispatcher(Constant.Path.STYLE_VALUE_FORM).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding(Constant.ENCODING);
            response.setCharacterEncoding(Constant.ENCODING);

            Long styleId = Long.parseLong(request.getParameter("style.id"));

            StyleValue styleValueUpdate = new StyleValue();
            BeanUtils.populate(styleValueUpdate, request.getParameterMap());

            Style style = styleService.findById(styleId);
            styleValueUpdate.setStyle(style);

            styleValueService.update(styleValueUpdate);
            response.sendRedirect("/admin/style-value");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            Long styleValueId = Long.parseLong(request.getParameter("id"));

            styleValueService.softDelete(styleValueId);
            response.sendRedirect("/admin/style-value");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}