<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.4.1-dist/js/jquery-3.6.1.min.js"></script>
    <script src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <style>
        .li1 {
            list-style: none;
            margin-left: 20%;
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
            width: 50%;
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
            <img src="pics1/img/logo2.png" alt="">
        </div>
        <div class="col-lg-4 col-md-4 col-xs-12">
            <img src="pics1/img/header.jpg" alt="">
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
    <!--注册-->
    <div class="row" style="background: url('pics1/image/regist_bg.jpg')repeat;height: 613px;width: 100%">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div style="width: 100%;height: 550px;background: white;border: 5px #CCCCCC solid;margin-top: 30px">
                <span style="display:inline-block;font-size: 20px;margin-top: 3%;margin-left: 10%">会员注册</span>
                <span style="display: inline-block;margin-left: 1%">USER REGISTER</span>
                <form action="Register" style="margin-top: 20px">
                    <li class="li1">
                        <span class="sp1">用户名</span>
                        <input class="inp1" type="text" name="username" value="" placeholder="请输入用户名">
                    </li>
                    <li class="li1">
                        <span class="sp1">密码</span>
                        <input class="inp1" type="text" name="password" value="" placeholder="请输入密码">
                    </li>
                    <li class="li1">
                        <span class="sp1">确认密码</span>
                        <input class="inp1" type="text" name="equalTo" value="" placeholder="请输入确认密码">
                    </li>
                    <li class="li1">
                        <span class="sp1">Email</span>
                        <input class="inp1" type="text" name="email" value="" placeholder="Email">
                    </li>
                    <li class="li1">
                        <span class="sp1">姓名</span>
                        <input class="inp1" type="text" name="realname" placeholder="请输入姓名">
                    </li>
                    <li class="li1">
                        <span class="sp1">性别</span>
                        <input style="margin-left: 25px;margin-top:10px" type="radio" name="sex" value="男">男
                        <input style="margin-left: 25px;margin-top:10px" type="radio" name="sex" value="女">女
                    </li>
                    <li class="li1">
                        <span class="sp1">出生日期</span>
                        <input class="inp1" type="date" name="birthday" value="年/月/日">
                    </li>
                    <li class="li1"><span class="sp1">验证码</span>
                        <input class="inp1" type="text" style="width: 100px" name="" value="" placeholder="请输入验证码">
                    </li>
                    <li class="li1">
                        <span class="sp1" style="width: 20%;">
                           <input type="submit" value="注册">
                        </span>
                    </li>

                </form>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>
    <!--footer-->
    <div class="row">
        <img src="pics1/img/footer.jpg" alt="" width="100%">
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