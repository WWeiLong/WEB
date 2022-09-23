<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/23
  Time: 19:06
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

    .big {
        width: 100%;
        height: 100%;
        position: relative;
    }

    .top-left {
        background: #cccccc;
        width: 70%;
        height: 70%;
        position: absolute;
    }

    .right {
        background: aquamarine;
        width: 30%;
        height: 100%;
        position: absolute;
        left: 70%;
    }

    .under {
        height: 30%;
        width: 70%;
        position: absolute;
        top: 70%;
        background: yellow;
    }
</style>
<body>
<div class="big">
    <div class="top-left">
        <div class="layui-carousel" id="test1" lay-filter="test1">
            <div carousel-item="">
                <div><img width="100%" height="100%" src="${pageContext.request.contextPath}/images/17.jpg" alt="">
                </div>
                <div><img width="100%" height="100%" src="${pageContext.request.contextPath}/images/17.jpg" alt="">
                </div>
                <div><img width="100%" height="100%" src="${pageContext.request.contextPath}/images/17.jpg" alt="">
                </div>
                <div><img width="100%" height="100%" src="${pageContext.request.contextPath}/images/17.jpg" alt="">
                </div>
                <div><img width="100%" height="100%" src="${pageContext.request.contextPath}/images/17.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="right"></div>
    <div class="under"></div>
</div>
</body>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;
        //常规轮播
        var ins3 = carousel.render({
            elem: '#test1'
            , interval: 1800
            , height: '100%'
            , width: '100%'
        });
        //开关事件
        form.on('switch(autoplay)', function () {
            ins3.reload({
                autoplay: this.checked
            });
        });
        // 自动播放控制
        form.on('select(autoplay)', function (obj) {
            // debugger;
            var autoplayValue = parseInt(obj.value);
            ins3.reload({
                autoplay: isNaN(autoplayValue) ? obj.value : autoplayValue
            });
        })

        $('.demoSet').on('keyup', function () {
            var value = this.value
                , options = {};
            if (!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });
    })
</script>
</html>
