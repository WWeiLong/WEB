package com.wwl.util;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkcode")
public class HuToolCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(80, 40, 4, 50);
        lineCaptcha.write(response.getOutputStream());
        //将产生的验证码保存到session中
        String code = lineCaptcha.getCode();
        request.getSession().setAttribute("code", code);
        System.out.println("服务器验证码" + code);
    }
}
