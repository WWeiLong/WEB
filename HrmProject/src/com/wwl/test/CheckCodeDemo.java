package com.wwl.test;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/CheckCodeDemo")
public class CheckCodeDemo extends HttpServlet {
    private Random random = new Random();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //在servlet中画一张图BufferedInage
        int width = 100;
        int height = 40;

        //1.创建一个图片对象,在内存中(验证码图片对象)
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //2.美化画布
//        得到一支画笔
        Graphics g = image.getGraphics();
        g.setColor(Color.white);
        //画一个矩形
        g.fillRect(0, 0, width, height);
        //画边框
        g.setColor(Color.black);
        g.drawRect(0, 0, width - 1, height - 1);

        //往画布中放数据
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        //定义一个string用来保存产生的随机数
        String code = "";

        //生成指定的随机数
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(str.length());
            //获取指定下标下面的值
            char c = str.charAt(index);
            code += c;
            //设置字体的颜色
            g.setColor(reandomColor());
            //设置字体
            g.setFont(randomFont());
            //将字写到画布中
            g.drawString(c + "", width / 5 * i, height / 2 + 10);
        }

        //画干扰线
        for (int i = 0; i < 5; i++) {
            //设置线的颜色
            g.setColor(reandomColor());
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int y2 = random.nextInt(height);
            g.drawLine(x1, x2, y1, y2);
        }
        //画干扰点
        for (int i = 0; i < 10; i++) {
            //设置线的颜色
            g.setColor(reandomColor());
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);

            g.drawOval(x1, x2, 2, 2);
        }
        //图片的形式输出到浏览器
        ImageIO.write(image, "jpg", response.getOutputStream());
        System.out.println("产生的随机数是:" + code);
        //将产生的随机数保存都session中
        HttpSession session = request.getSession();
        session.setAttribute("code", code);
    }

    //设计一个方法,用来返回一个颜色,这个颜色是随机的
    public Color reandomColor() {
        int r = random.nextInt(255);
        int g = random.nextInt(255);
        int b = random.nextInt(255);
        return new Color(r, g, b);
    }

    //设计一个字体的方法,返回随机字体
    public Font randomFont() {
        String[] fonts = {"宋体", "微软雅黑", "黑体", "华文楷体"};
        int index = random.nextInt(fonts.length);
        return new Font(fonts[index], random.nextInt(4), random.nextInt(5) + 24);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
