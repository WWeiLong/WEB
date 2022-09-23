<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/17
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.4.1-dist/js/jquery-3.6.1.min.js"></script>
    <script src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <style>
        .li1 {
            list-style: none;
            margin-left: 20px;
        }

        .sp1 {
            display: inline-block;
            width: 60px;
            height: 35px;
            text-align: right;
            font-weight: bold;
        }

        .inp1 {
            margin-top: 5px;
            margin-left: 20px;
            height: 35px;
            border: 1px lightgrey solid;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="margin-right: 20px;margin-left: 20px">
    <!--头-->
    <div class="row">
        <div class="col-lg-4 col-md-4 col-xs-12">
            <img src="pics/img/logo2.png" alt="">
        </div>
        <div class="col-lg-4 col-md-4 col-xs-12">
            <img src="pics/img/header.jpg" alt="">
        </div>
        <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6" style="margin-top: 20px">
                    <a style="margin-left: 10px" href="login.html">登录</a>
                    <a style="margin-left: 10px" href="register.html">注册</a>
                    <a style="margin-left: 10px" href="myOrder.html">购物车</a>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </div>
    </div>
    <!--导航条-->
    <div class="row">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">首页</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">手机数码 <span class="sr-only">(current)</span></a></li>
                        <li><a href="fruitsList.html">蔬菜商城</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true"
                               aria-expanded="false">电脑办公<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                        <li><a href="introduction.html">公司介绍<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <!--背景-->
    <div style="height: 475px;width: 100%;background: #FF2C4C;">
        <div class="row"
             style="background: url('HuiDuoDuo/pics/images/loginbg.jpg')no-repeat;height: 475px;width: 100%">
            <div style="width: 400px;height: 350px;background: white;position: relative;left:65%;top:12%;border-radius: 10px">
                <span style="display:inline-block;font-size: 20px;margin-top: 15px;margin-left: 20px">会员登录</span> <span
                    style="display: inline-block;margin-left: 5px">USER LOGIN</span>
                <form action="MyServlet" style="margin-top: 20px">
                    <li class="li1">
                        <span class="sp1">用户名</span>
                        <input class="inp1" type="text" name="username" value="" placeholder="请输入用户名"></li>
                    <li class="li1">
                        <span class="sp1">密码</span>
                        <input class="inp1" type="text" name="password" value="" placeholder="请输入密码"></li>
                    <li class="li1"><span class="sp1">验证码</span>
                        <input class="inp1" type="text" style="width: 100px" name="" value="" placeholder="请输入验证码">
                    </li>
                    <div style="padding-left: 100px;margin-top: 15px">
                        <input type="radio"> 自动登录
                        <input type="radio" name="" id=""> 记住用户名
                    </div>
                    <input type="submit" value="提交">
                </form>
            </div>

        </div>
    </div>
    <!--footer-->
    <div class="row">
        <img src="pics/img/footer.jpg" alt="" width="100%">
    </div>
    <!--关于版权-->
    <div class="row" style="margin-top: 5px">
        <div class="col-lg-4 col-md-4"></div>
        <div class="col-lg-4 col-md-4">
            <a style="margin-left: 20px" href="">关于我们</a>
            <a style="margin-left: 20px" href="">联系我们</a>
            <a style="margin-left: 20px" href="">招纳贤士</a>
            <a style="margin-left: 20px" href="">法律声明</a>
            <a style="margin-left: 20px" href="">友情链接</a>
            <a style="margin-left: 20px" href="">支付方式</a>
            <a style="margin-left: 20px" href="">配送方式</a>
            <a style="margin-left: 20px" href="">服务声明</a>
            <a style="margin-left: 20px" href="">广告声明</a>
        </div>
        <div class="col-lg-4 col-md-4"></div>
    </div>
    <div class="row" style="text-align: center;margin-top: 10px">
        Copyright &copy; 2005-2016 惠多多商城 版权所有
    </div>
</div>

</body>
</html>
