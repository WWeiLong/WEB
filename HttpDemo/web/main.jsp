<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/17
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.4.1-dist/js/jquery-3.6.1.min.js"></script>
    <script src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
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
    <!--轮播图-->
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="pics1/img/1.jpg" style="width: 100%" alt="...">
                </div>
                <div class="item">
                    <img src="pics1/img/2.jpg" style="width: 100%" alt="...">
                </div>
                <div class="item">
                    <img src="pics1/img/3.jpg" style="width: 100%" alt="...">
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!--热门商品-->
    <div class="row">
        <br>
        <span style="font-size: 30px">热门商品</span>
        <img src="pics1/img/title2.jpg" alt="" style="margin-left: 15px">
    </div>
    <br>
    <div class="row">
        <div class="col-lg-2 col-xs-12">
            <div class="row">
                <img src="pics1/products/hao/big01.jpg" alt="" style="width: 100%">
            </div>
        </div>
        <div class="col-lg-5 col-xs-12">
            <div class="row">
                <img src="pics1/products/hao/middle01.jpg" alt="" style="width: 90%;height: 90%">
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
        </div>
        <div class="col-lg-5 col-xs-12">
            <div class="row" style="margin-top: 63px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
            <div class="row" style="margin-top: 63px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <img src="pics1/products/hao/ad.jpg" alt="" width="100%">
    </div>
    <!--热门商品-->
    <div class="row">
        <br>
        <span style="font-size: 30px">热门商品</span>
        <img src="pics1/img/title2.jpg" alt="" style="margin-left: 15px">
    </div>
    <br>
    <div class="row">
        <div class="col-lg-2 col-xs-12">
            <div class="row">
                <img src="pics1/products/hao/big01.jpg" alt="" style="width: 100%">
            </div>
        </div>
        <div class="col-lg-5 col-xs-12">
            <div class="row">
                <img src="pics1/products/hao/middle01.jpg" alt="" style="width: 90%;height: 90%">
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
        </div>
        <div class="col-lg-5 col-xs-12">
            <div class="row" style="margin-top: 63px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
            <div class="row" style="margin-top: 63px">
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small03.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small04.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
                <div class="col-lg-4" style="text-align: center">
                    <img src="pics1/products/hao/small05.jpg" alt="" style="width: 100%;height: 100%">
                    <br>
                    <span style="color: red">冬瓜</span>
                    <br>
                    <span style="color: red">￥299.00</span>
                </div>
            </div>
        </div>
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
