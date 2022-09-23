<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/19
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
</head>
<%
    String[] list = (String[]) request.getAttribute("filename");
    for (int i = 0; i < list.length; i++) {
        out.write("<li style='list-style: none;'>");
        out.write("<a href='Download?filelist=" + list[i] + "'>");
        out.write(list[i]);
        out.write("</a>");
        out.write("<a class='btn btn-danger' href='Remove?btn=" + list[i] + "'>");
        out.write("删除此文件</a>");
        out.write("</li>");
    }
%>
<body>
<form action="">
    <input type="file">
    <button class="btn">上传</button>
</form>
</body>
</html>
