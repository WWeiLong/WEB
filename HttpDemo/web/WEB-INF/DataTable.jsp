<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/20
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .table1 {
        margin: 0 auto;
        padding: 0;
        border-collapse: collapse;
        width: 80%;
    }

    td {
        border: 1px lightgrey solid;
    }

    .div1 {
        margin: 0 auto;
        padding: 0;
        display: flex;
        justify-content: center;
    }

    a {
        text-decoration: none;
    }
</style>

<body>
<table class="table1">
    <tbody>
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>性别</td>
        <td>生产日期</td>
        <td>数学</td>
        <td>语文</td>
        <td>英语</td>
        <td>总计</td>
    </tr>
    <c:forEach var="i" items="${data}">
        <tr>
            <td>${i.number}</td>
            <td>${i.name}</td>
            <td>${i.password}</td>
            <td>${i.sex}</td>
            <td>${i.birthday}</td>
            <td>${i.math}</td>
            <td>${i.chinese}</td>
            <td>${i.english}</td>
            <td>${i.total}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="div1">
    <a href="GetData?status=head">[首页]</a>
    <a href="GetData?status=previous">[上一页]</a>
    <c:if test="${pageServer.totalPage>10}">
        <c:forEach var="i" begin="${pageServer.totalPage-10}" end="${pageServer.totalPage}">
            <a href="http://localhost:8080/HttpDemo/GetData?page=${i}">&nbsp;${i}&nbsp;&nbsp;</a>
        </c:forEach>
    </c:if>
    <c:if test="${pageServer.totalPage<=10}">
        <c:forEach var="i" begin="1" end="${pageServer.totalPage}">
            <a href="http://localhost:8080/HttpDemo/GetData?page=${i}">&nbsp;${i}&nbsp;&nbsp;</a>
        </c:forEach>
    </c:if>
    <a href="GetData?status=next">[下一页]</a>
    <a href="GetData?status=lastPage">[末页]</a>
    总条数:
    ${pageServer.totalData}
</div>

</body>
</html>
