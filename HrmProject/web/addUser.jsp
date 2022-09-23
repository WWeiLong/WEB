<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/22
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<body>
<div class="layui-form-item" style="background: rgba(204,204,204,0.6);">
    <form class="layui-form" action="${pageContext.request.contextPath}/Server">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="loginname" lay-verify="required" placeholder="请输入用户名"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <label class="layui-form-label">用户状态</label>
        <div class="layui-input-inline">
            <input type="text" name="status" lay-verify="required" placeholder="请输入用户状态"
                   autocomplete="off"
                   class="layui-input">
        </div>
        <input name="flag" type="submit" class="layui-btn layui-btn-checked" lay-submit="" lay-filter="demo1"
               value="查找"></input>
        <input name="flag" type="submit" class="layui-btn layui-btn-danger" lay-submit="" lay-filter="demo1"
               value="删除"></input>
    </form>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>
</body>
<script>
    layui.use(['table', 'dropdown'], function () {
        var table = layui.table;
        var dropdown = layui.dropdown;
        // layer.msg('本示例演示的数据为静态模拟数据，<br>实际使用时换成您的真实接口即可。', {
        //     closeBtn: 1,
        //     icon: 6,
        //     time: 21 * 1000,
        //     offset: '21px'
        // });

        // 创建渲染实例
        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/AdminData'
            , toolbar: '#toolbarDemo'
            , defaultToolbar: ['filter', 'exports', 'print', {
                title: '帮助'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , height: 'full' // 最大高度减去其他容器已占有的高度差
            , cellMinWidth: 80
            , totalRow: true // 开启合计行
            , page: true
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', fixed: 'left', width: 80, title: 'ID', sort: true, totalRowText: '合计：'}
                , {field: 'loginname', title: '用户名', edit: 'textarea', minWidth: 260, style: '-moz-box-align: start;'}
                , {field: 'password', width: 100, title: '密码', sort: true, totalRow: '{{= d.TOTAL_NUMS }} '}
                , {field: 'status', title: '状态', width: 100, sort: true}
                , {field: 'dateString', title: '注册时间', width: 120}
                , {field: 'username', title: '姓名', width: 120}
                , {fixed: 'right', title: '操作', width: 125, minWidth: 125, toolbar: '#barDemo'}
            ]]
        })
    })
</script>
</html>
