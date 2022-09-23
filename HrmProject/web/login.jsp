<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/21
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/logincss/css/supersized.css">
    <script src="${pageContext.request.contextPath}/logincss/js/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/logincss/js/supersized.3.2.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/logincss/js/supersized-init.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<style>
    * {
        margin: 0 auto;
        padding: 0;
    }

    .box {
        background: rgba(255, 255, 255, 0.6);
        width: 500px;
        height: 350px;
        border-radius: 8px;
        display: flex;
        justify-content: center;
        margin-top: 200px;
    }

    .box2 {
        text-align: center;
        width: 400px;
        height: 300px;
        margin-top: 10px;
    }

    p {
        font-size: 30px;
        font-weight: bold;
    }
</style>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-lg4">&nbsp;</div>
        <div class="layui-col-lg4">
            <div class="layui-row">
                <div class="layui-col-lg3">&nbsp;</div>
                <div class="layui-col-lg6 box">
                    <div class="box2">
                        <p>HRM人事管理系统</p>
                        <hr>
                        <form class="layui-form" action="${pageContext.request.contextPath}/CheckCode" method="post"
                              style="text-align: center">
                            <input type="hidden" name="info" value="login">
                            <div class="layui-form-item">
                                <label class="layui-form-label">
                                    <i class="layui-icon layui-icon-username"
                                       style="font-size: 30px; color: #1E9FFF;">&nbsp;</i></label>
                                <div class="layui-input-inline">
                                    <input type="text" name="username" lay-verify="required" placeholder="请输入用户名"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">
                                    <i class="layui-icon layui-icon-password"
                                       style="font-size: 30px; color: #1E9FFF;">&nbsp;</i></label>
                                <div class="layui-input-inline">
                                    <input type="password" name="password" lay-verify="required" placeholder="请输入密码"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">
                                    <i class="layui-icon layui-icon-vercode"
                                       style="font-size: 30px; color: #1E9FFF;">&nbsp;</i>
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
                                <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1">登录</button>
                                <button id="register" data-method="notice" type="button"
                                        class="layui-btn">注册
                                </button>
                            </div>
                        </form>
                        <span>下笔如有神！键来！！！</span>
                    </div>
                </div>
                <div class="layui-col-lg3">&nbsp;</div>
            </div>
        </div>
        <div class="layui-col-lg4">&nbsp;</div>
    </div>
</div>
</div>
</body>
<script>
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;

        //验证码刷新
        $("#img1").click(function () {
            $("#img1").attr("src", "${pageContext.request.contextPath}/checkcode?time=" + new Date().getTime())
        })
        //登录结果显示
        var checkInfo = '${checkInfo}';
        if (checkInfo != "") {
            layer.msg(checkInfo, {icon: 5});
        }

        var active = {
            notice: function () {
                //示范一个公告层
                layer.open({
                    type: 2
                    ,
                    title: '用户注册' //不显示标题栏
                    ,
                    closeBtn: 1
                    ,
                    maxmin: true
                    ,
                    area: ['600px', '600px']
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btnAlign: 'c'
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: ['${pageContext.request.contextPath}/register.jsp', 'no']
                    ,
                    success: function (layero) {
                    }
                });
            }
        };

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
        });
        //提交事件
        form.on('submit(demo1)', function (data) {
            // alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            return true;
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function () {
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

        $('#register').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
</script>
</html>
