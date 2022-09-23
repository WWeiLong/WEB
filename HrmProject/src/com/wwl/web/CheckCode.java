package com.wwl.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckCode")
public class CheckCode extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String vercode = request.getParameter("vercode");

        System.out.println("CheckCode:" + vercode);
        //判断是登录还是注册
        String info = request.getParameter("info");

        System.out.println("info:" + info);
        String code = (String) request.getSession().getAttribute("code");


        if (vercode != null) {
            if (vercode.equalsIgnoreCase(code)) {
                //验证成功
                System.out.println("验证成功");
                if (info.equals("login")) {
                    //转发到登录功能
                    request.getRequestDispatcher("/user/login.do").forward(request, response);
                } else {
                    request.getRequestDispatcher("/user/register.do").forward(request, response);
                }
            } else {
                //验证失败
                request.setAttribute("checkInfo", "验证码错误");
                System.out.println("验证码错误");
                if (info.equals("login")) {
                    //回到登陆界面
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                }
            }
        }
    }
}
