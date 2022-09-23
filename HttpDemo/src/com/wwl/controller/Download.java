package com.wwl.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/Download")
public class Download extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String list = req.getParameter("filelist");

        String realPath = getServletContext().getRealPath("/download/");
        FileInputStream fs = new FileInputStream(realPath + "/" + list);
        list = new String(list.getBytes(), "iso8859-1");
        resp.setHeader("content-disposition", "attachment;filename=" + list);
        OutputStream out = resp.getOutputStream();
        byte[] by = new byte[1024];
        int len = 0;
        while ((len = fs.read(by)) != -1) {
            out.write(by, 0, len);
        }
        out.close();
        fs.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public static void main(String[] args) {
        File file = new File("C:\\Users\\dGen\\Desktop\\download");
//        File[] files = file.listFiles();
//        for (int i = 0; i < files.length; i++) {
//            String path = files[i].getAbsolutePath();
//            String[] split = path.split("\\\\");
//            String s = split[split.length - 1];
//            System.out.println(s);
//        }
        String[] list = file.list();
        for (int i = 0; i < list.length; i++) {
            System.out.println(list[i]);
        }

    }
}
