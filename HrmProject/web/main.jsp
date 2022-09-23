<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/21
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">HR人事管理系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs">
                <a href="" style="display: ${user.status==2?"block":"none"}">
                    <i class="layui-icon layui-icon-rmb" style="font-size: 16px; color: #cccccc;"></i>
                    &nbsp;待审核<span class="layui-badge">9</span></a>
                </a>
            </li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide-xs">
                <a href="">
                    <i class="layui-icon layui-icon-time" style="font-size: 16px; color: #cccccc;"></i>
                    &nbsp;
                    <span id="sp"></span>
                </a>
            </li>
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/images/10.jpg" class="layui-nav-img">
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href=""><i class="layui-icon layui-icon-user" style="font-size: 16px; color: #cccccc;"></i>
                        个人信息</a></dd>
                    <dd><a href=""><i class="layui-icon layui-icon-set-sm" style="font-size: 16px; color: #cccccc;"></i>
                        设置</a></dd>
                </dl>

            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="${pageContext.request.contextPath}/user/logout.do">
                    <i class="layui-icon layui-icon-logout" style="font-size: 16px; color: #cccccc;"></i>
                    &nbsp;退出登录
                </a>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <div style="margin: 10px 0px 10px 0;">
                <center>
                    <a href="javascript:;" style="padding-right: 10px">
                        <img src="${pageContext.request.contextPath}/images/10.jpg" class="layui-nav-img"
                             style="height: 100px;width: 100px;">
                    </a>
                    <p style="color: #cccccc;padding-right: 15px;padding-top: 12px">欢迎!${user.username}</p>
                </center>
                <hr>
            </div>

            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        <i class="layui-icon layui-icon-home"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"
                               data-url="findUser.jsp"
                               data-id="findUser"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;用户查询"
                               class="site-demo-active"
                               data-type="tabAdd"
                               style="padding-left: 50px;">用户查询</a></dd>
                        <dd><a
                                data-url="addUser.jsp"
                                data-id="addUser"
                                data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;添加用户"
                                class="site-demo-active"
                                data-type="tabAdd"
                                href="javascript:;" style="padding-left: 50px;">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-list"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="padding-left: 50px;">部门查询</a></dd>
                        <dd><a href="javascript:;" style="padding-left: 50px;">添加部门</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        <i class="layui-icon layui-icon-picture"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        职位管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="padding-left: 50px;">职位查询</a></dd>
                        <dd><a href="javascript:;" style="padding-left: 50px;">添加职位</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        <i class="layui-icon layui-icon-more-vertical"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="padding-left: 50px;">员工查询</a></dd>
                        <dd><a href="javascript:;" style="padding-left: 50px;">添加员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        <i class="layui-icon layui-icon-more-vertical"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="padding-left: 50px;">员工查询</a></dd>
                        <dd><a href="javascript:;" style="padding-left: 50px;">添加员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        <i class="layui-icon layui-icon-more-vertical"
                           style="font-size: 16px; color: #cccccc;">
                        </i>
                        下载管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" style="padding-left: 50px;">文档查询</a></dd>
                        <dd><a href="javascript:;" style="padding-left: 50px;">上传文档</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <div class="layui-tab layui-tab-card layui-tab-brief" lay-filter="demo" lay-allowclose="true">
                <ul class="layui-tab-title">
                    <li class="layui-this"><i class="layui-icon layui-icon-home"
                                              style="font-size: 16px; color: #cccccc;">
                    </i>首页
                    </li>
                </ul>
                <div class="layui-tab-content" style="width: 100%;height: 90%;">
                    <div class="layui-tab-item layui-show">
                        <div>
                            <iframe frameborder="0" style="width: 100%;height: 100%" src="main-body.jsp"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--        <div id="jsppage" style="padding: 15px;">--%>
        <%--            <iframe name="ifram" id="ifram" width="100%" height="100%"></iframe>--%>
        <%--            &lt;%&ndash;            <jsp:include page="WEB-INF/jsp/data.jsp"></jsp:include>&ndash;%&gt;--%>
        <%--        </div>--%>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
</body>
<script>
    var nTime = document.getElementById("sp");


    setInterval(function () {
        //修改标签的值
        nTime.innerHTML = nowTime();
    }, 1000);

    function nowTime() {
        var date = "";
        var time = new Date();
        var year = time.getFullYear();
        var month = (time.getMonth() + 1) >= 10 ? time.getMonth() + 1 : ("0" + (time.getMonth() + 1));
        var day = time.getDate() >= 10 ? time.getDate() : ("0" + time.getDate());
        var hours = time.getHours() >= 10 ? time.getHours() : ("0" + time.getHours());
        var minute = time.getMinutes() >= 10 ? time.getMinutes() : ("0" + time.getMinutes());
        var seconds = time.getSeconds() >= 10 ? time.getSeconds() : ("0" + time.getSeconds());
        var s = ["日", "一", "二", "三", "四", "五", "六"];
        var day1 = time.getDay();
        date = year + "年" + month + "月" + day + "日 " + hours + ":" + minute + ":" + seconds + ":" + " 星期" + s[day1];
        return date;
    };

    var path = [""];
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        var do1 = $(".do1");
        do1.each(function (i) {
            do1.eq(i).click(function () {

            })
        })

        var ifram = $("#ifram");
        // ifram.attr("src", "/data.jsp");

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });
        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:100%;height: 730px"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');

            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };
        $('#txpic').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });
    });
</script>
</html>
