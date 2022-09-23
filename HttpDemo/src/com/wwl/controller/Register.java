package com.wwl.controller;

import com.wwl.pojo.Person;
import com.wwl.service.MyService;
import com.wwl.service.MyServiceImpl;
import com.wwl.util.BeanUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Register extends HttpServlet {
    private MyService ms = new MyServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        Person person = BeanUtil.getBean(Person.class, req, resp);
        System.out.println(person.getUsername());
        System.out.println(person);
        String p1 = ms.register(person);
        if ("1".equals(p1)) {
            req.setAttribute("person", p1);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
//        String p = ms.register(username, password, phone);
//        if (p.equals("-1")) {
//            resp.getWriter().append("该手机号已注册");
//        } else if (p.equals("1")) {
//            resp.getWriter().append("注册成功");
//        } else if (p.equals("")) {
//            resp.getWriter().append("注册失败,请联系工作人员");
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
