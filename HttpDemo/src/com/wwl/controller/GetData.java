package com.wwl.controller;

import com.wwl.dao.PageDao;
import com.wwl.pojo.Page;
import com.wwl.pojo.Student;
import com.wwl.service.DataServer;
import com.wwl.service.DataServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/GetData")
public class GetData extends HttpServlet {
    private DataServer ds = new DataServerImpl();
    PageDao pd = new PageDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page1 = request.getParameter("page");
        String status = request.getParameter("status");
        System.out.println(page1 + "---page1");
        if (page1 == null) {
            page1 = "0";
        } else {
            page1 = String.valueOf(Integer.parseInt(page1) - 1);
        }


        //总条数
        int totalData = pd.getTotal();
        System.out.println(totalData);
        //上一页
        int previous = 0;
        //下一页
        int next = 0;
        //总页数
        int totalPage = totalData / 10 + 1;
        //当前页条数
        int total = 10;
        //最后一页
        int lastPage = 0;

        if (status != null) {
            switch (status) {
                case "head":
                    page1 = "0";
                    break;
                case "previous":
                    if (Integer.parseInt(page1) >= 1) {
                        page1 = String.valueOf(Integer.parseInt(page1) - 1);
                    } else {
                        page1 = "0";
                    }
                    break;
                case "next":
                    page1 = String.valueOf(Integer.parseInt(page1) + 1);
                    break;
                case "lastPage":
                    page1 = String.valueOf(totalPage);
                    break;
            }
        }
        page1 = String.valueOf(Integer.parseInt(page1) * 10);
        Page page = new Page(previous + "", next + "", total + "", totalPage + "", totalData + "", lastPage + "");

        ArrayList<Student> list = ds.getData(page1, total + "");
//        System.out.println(list);
        request.setAttribute("pageServer", page);
        request.setAttribute("data", list);
        request.getRequestDispatcher("/WEB-INF/DataTable.jsp").forward(request, response);
    }
}
