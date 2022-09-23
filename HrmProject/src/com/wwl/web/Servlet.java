package com.wwl.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

//@WebServlet("/")
public class Servlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        if (uri.endsWith("jsp")) {
            req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
        } else {
            System.out.println(uri);
            String[] split = uri.split("/");
            String admin = split[2];
            System.out.println("Hello:" + admin);
            String adminMethod = split[3];
            System.out.println("aaa:" + adminMethod);
            try {
                Class<?> cl = Class.forName("com.wwl.web." + admin + "Controller");
                System.out.println("类名: " + cl.getSimpleName());
                Method md = cl.getDeclaredMethod(adminMethod, HttpServletRequest.class, HttpServletResponse.class);
                System.out.println("md" + md);
                md.invoke(cl.getDeclaredConstructor().newInstance(), req, resp);
            } catch (ClassNotFoundException | NoSuchMethodException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }
        }

    }
}
