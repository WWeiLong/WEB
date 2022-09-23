package com.wwl.web;

import com.alibaba.fastjson.JSON;
import com.wwl.pojo.User;
import com.wwl.service.AdminService;
import com.wwl.service.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Admin/*")
public class AdminController extends HttpServlet {
    private AdminService as = new AdminServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String uri = request.getRequestURI();
        String substring = uri.substring(uri.lastIndexOf("/") + 1);
        System.out.println("substring" + substring);

        switch (substring) {

        }
        if (uri.endsWith("UserData.do")) {
            UserData(request, response);
        }
    }

    private void UserData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        if (page == null || limit == null) {
            page = "0";
            limit = "10";
        }
        page = String.valueOf((Integer.parseInt(page) - 1) * (Integer.parseInt(limit)));
        String data = as.getUserData(page, limit);
        List<User> list = JSON.parseArray(data, User.class);
        System.out.println(data);
        data = "{\"count\": " + list.size() + "," + " \"msg\": \"\"," + " \"code\": 0,"
                + "  \"data\": " + data + "}";
        response.getWriter().write(data);
    }

}
