package com.hcmute.team7.azshop.controller;

import com.hcmute.team7.azshop.utils.Constant;
import org.apache.commons.io.IOUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/image")
public class DownloadImageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String fileName = request.getParameter("fileName");
        File file = new File(Constant.DIR + "/" + fileName);

        response.setContentType("image/jpeg");
        if (file.exists()) {
            IOUtils.copy(new FileInputStream(file), response.getOutputStream());
        }
    }
}
