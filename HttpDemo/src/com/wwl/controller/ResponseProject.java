package com.wwl.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResponseProject extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.write("支付成功,<span id='sp'>5</span>后自动跳转到首页,<a href='main.jsp' >直接跳转</a> " +
                "<script>\n" +
                "    let clo = setInterval(function () {\n" +
                "        let id = document.getElementById(\"sp\");\n" +
                "        if (id.innerText > 0) {\n" +
                "            id.innerText = id.innerText - 1;\n" +
                "            console.log(id.innerText)\n" +
                "        }\n" +
                "        if (id == 0) {\n" +
                "            clearInterval(clo);\n" +
                "        }\n" +
                "    }, 1000);\n" +
                "</script>");

        resp.setStatus(302);
        resp.setHeader("refresh", "5;url=main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
