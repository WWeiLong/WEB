package com.wwl.web;

import com.wwl.pojo.User;
import com.wwl.service.UserService;
import com.wwl.service.UserServiceImpl;
import com.wwl.util.BeanUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
    private UserService us = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //第一步要判断是什么操作
        String uri = request.getRequestURI();
        if (uri.endsWith("login.do")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            System.out.println("用户名:" + username + ",密码:" + password);
            User user = us.login(username, password);
            System.out.println(user);
            if (user != null) {
                if (user.getStatus() == 0) {
                    request.setAttribute("checkInfo", "帐号还未审核,请耐心等待~");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                    return;
                }
                System.out.println("登陆成功");
                request.getSession().setAttribute("user", user);
                response.sendRedirect("main.jsp");
            } else {
                System.out.println("登陆失败");
                request.setAttribute("checkInfo", "登陆失败,请检查!");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else if (uri.endsWith("register.do")) {
            //获得前端传来的注册信息
//            String loginname = request.getParameter("loginname");
//            String password = request.getParameter("password");
//            String nickname = request.getParameter("nickname");
//            System.out.println(loginname + "," + password + "," + nickname);
//            //添加身份码 status和 注册时间 createdate
//            Date date = new Date();
//            String createdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
//            String flag = us.register(loginname, password, 1, createdate, nickname);
//            if (flag.equals("")) {
//                System.out.println("注册失败");
//                request.setAttribute("checkInfo", "注册失败,请检查!");
//            } else {
//                System.out.println("注册成功");
//                //转发到登陆界面
//                request.setAttribute("checkInfo", "注册成功!");
//                response.getWriter().write("success");
////                request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//            }
            User user = BeanUtil.getBean(User.class, request, response);
            System.out.println("注册信息:" + user);
            int i = us.insertUser(user);
            request.setAttribute("regInfo", i + "");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else if (uri.endsWith("checkLoginName.do")) {
            //检查用户是否被注册
            String loginname = request.getParameter("loginname");
            System.out.println("loginname:" + loginname);
            //去service完成验证
            int i = us.checkLoginName(loginname);

            response.getWriter().write(i + "");
        } else if (uri.endsWith("logout.do")) {
            //退出功能
            request.getSession().removeAttribute("user");
            response.sendRedirect(request.getServletContext().getContextPath() + "/index");
        }
    }
}
