<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/21
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<style>
    * {
        margin: 0 auto;
        padding: 0;
    }

    .box {
        /*border: 1px lightgrey solid;*/
        background: rgba(255, 255, 255, 0.6);
        width: 500px;
        height: 150px;
        border-radius: 8px;
        position: relative;
        left: 20%;
        margin-top: 30px;
    }

    .box2 {
        text-align: center;
        width: 400px;
        height: 150px;
        margin-top: 10px;
    }

    p {
        font-size: 30px;
        font-weight: bold;
    }
</style>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg4">&nbsp;</div>
        <div class="layui-col-lg4 box">
            <div class="box2">
                <p>HRM人事管理系统</p>
                <hr>
                <div style="text-align: center;">
                    <form class="layui-form" action="${pageContext.request.contextPath}/CheckCode" method="post"
                          style="text-align: center">
                        <input type="hidden" name="info" value="register">
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                账号</label>
                            <div class="layui-input-inline">
                                <input type="text" id="loginname" name="loginname" lay-verify="required|checkLoginName"
                                       placeholder="请输入用户名"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                密码</label>
                            <div class="layui-input-inline">
                                <input type="password" id="password" name="password" lay-verify="required|pwd"
                                       placeholder="请输入密码"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" lay-verify="required|pwd|confirmPass"
                                       placeholder="确认密码"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                昵称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="nickname" name="username" lay-verify="required"
                                       placeholder="请输入昵称"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                验证码</i>
                            </label>
                            <div class="layui-input-inline">
                                <input type="text" name="vercode" maxlength="4" lay-verify="required"
                                       placeholder="请输入验证码"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                            <a href="#"><img style="border: 1px lightgrey solid" id="img1"
                                             src="${pageContext.request.contextPath}/checkcode"
                                             alt=""></a>
                        </div>
                        <div class="layui-form-item">
                            <button id="reg" name="flag" class="layui-btn layui-btn-checked"
                                    lay-filter="demo1" lay-submit="">
                                立即注册
                            </button>
                        </div>
                    </form>
                </div>
                <span>下笔如有神！键来！！！</span>
            </div>
        </div>
        <div class="layui-col-lg4">&nbsp;</div>
    </div>
</div>
</body>
<script>
    layui.use(['form', 'jquery'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        $("#img1").click(function () {
            $("#img1").attr("src", "${pageContext.request.contextPath}/checkcode?time=" + new Date().getTime())
        })

        //验证码是否成功
        var checkInfo = '${checkInfo}';
        if (checkInfo != "") {
            layer.msg("验证码错误!", {icon: 5});
        }
        //检查用户是否注册成功
        var regInfo = '${regInfo}';
        if (regInfo == "0") {
            layer.msg("注册失败,请检查!", {icon: 5});
        }
        if (regInfo == "1") {
            layer.msg("注册成功,等待审核通过!", {icon: 1});
        }

        // 校验两次密码是否一致
        form.verify({
            pwd: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ],
            confirmPass: function (value) {
                if ($('input[name=password]').val() !== value)
                    return '提示：两次输入密码不一致！';
            },
            checkLoginName: function (value) {
                var json = {'loginname': value};
                var flag = true;
                $.ajaxSettings.async = false;
                $.post("${pageContext.request.contextPath}/user/checkLoginName.do", json, function (data) {
                    console.log(data);
                    if (data == "1") {
                        flag = false;
                    }
                })
                $.ajaxSettings.async = true;

                if (flag == false) {
                    return "用户已被注册";
                }
            }
        });
        form.on('submit(demo1)', function (data) {
            // alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return true;
        });
        <%--$("#reg").click(function () {--%>
        <%--    var flag = false;--%>
        <%--    $.ajax({--%>
        <%--        async: false,--%>
        <%--        url: "${pageContext.request.contextPath}/CheckCode",--%>
        <%--        type: 'post',--%>
        <%--        dataType: 'json',--%>
        <%--        data: {--%>
        <%--            'loginname': $("#loginname").val(),--%>
        <%--            'password': $("#password").val(),--%>
        <%--            'username': $("#nickname").val(),--%>
        <%--        },--%>
        <%--        success: function (data) {--%>
        <%--            console.log(data);--%>
        <%--            if (data == "success") {--%>
        <%--                flag = true;--%>
        <%--            }--%>
        <%--        }--%>
        <%--    })--%>
        // console.log(flag);
        // if (flag) {
        //     var index = parent.layer.getFrameIndex(window.name);//先得到当前iframe层的索引
        //     parent.layer.close(index);
        // }
        // })
    })
</script>
</html>
