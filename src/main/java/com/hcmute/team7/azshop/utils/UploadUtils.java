package com.hcmute.team7.azshop.utils;

import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.*;

public class UploadUtils {
    public static String processUpload(String fileName, HttpServletRequest request, String storeFolder, String storeFileName)
            throws ServletException, IOException {
        Part filePart = request.getPart(fileName);
        if (filePart == null || filePart.getSize() == 0) {
            return "";
        }
        if (storeFolder == null) {
            storeFolder = Constant.DIR;
        }
        if (storeFileName == null) {
            storeFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        } else {
            storeFileName += "." + FilenameUtils.getExtension(Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        }
        Path uploadPath = Paths.get(storeFolder);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        filePart.write(Paths.get(uploadPath.toString(), storeFileName).toString());
        return storeFileName;
    }

//    public static String processUploadFolderWeb (String fileName, HttpServletRequest request, String storeFolder, String storeFileName)
//            throws ServletException, IOException {
//        Part filePart = request.getPart(fileName);
//        if (filePart == null || filePart.getSize() == 0) {
//            return "";
//        }
//        if (storeFolder == null) {
//            storeFolder = Constant.DIR;
//        }
//        if (storeFileName == null) {
//            storeFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//        } else {
//            storeFileName += "." + FilenameUtils.getExtension(Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
//        }
//        String uploadFolder = request.getServletContext().getRealPath(storeFolder);
//        Path uploadPath = Paths.get(uploadFolder);
//        if (!Files.exists(uploadPath)) {
//            Files.createDirectories(uploadPath);
//        }
//        filePart.write(Paths.get(uploadPath.toString(), storeFileName).toString());
//        return storeFileName;
//    }
}
