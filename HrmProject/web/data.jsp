<%--
  Created by IntelliJ IDEA.
  User: dGen
  Date: 2022/9/22
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-form-item" style="background: rgba(204,204,204,0.6)">
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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getData">获取当前页数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">是否全选</button>
        <button class="layui-btn layui-btn-sm layui-bg-blue" id="reloadTest">
            重载测试
            <i class="layui-icon layui-icon-down layui-font-12"></i>
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="multi-row">
            多行
        </button>
        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="default-row">
            单行
        </button>
        <button class="layui-btn layui-btn-sm" id="moreTest">
            更多测试
            <i class="layui-icon layui-icon-down layui-font-12"></i>
        </button>
    </div>
</script>

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
            , height: 'full-200' // 最大高度减去其他容器已占有的高度差
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
                , {field: 'username', title: '姓名', width: 120, totalRow: '{{= parseInt(d.TOTAL_NUMS) }} '}
                , {fixed: 'right', title: '操作', width: 125, minWidth: 125, toolbar: '#barDemo'}
            ]]
            , done: function () {
                var id = this.id;

                // 重载测试
                dropdown.render({
                    elem: '#reloadTest' //可绑定在任意元素中，此处以上述按钮为例
                    , data: [{
                        id: 'reload',
                        title: '重载'
                    }, {
                        id: 'reload-deep',
                        title: '重载 - 参数叠加'
                    }, {
                        id: 'reloadData',
                        title: '仅重载数据'
                    }, {
                        id: 'reloadData-deep',
                        title: '仅重载数据 - 参数叠加'
                    }]
                    // 菜单被点击的事件
                    , click: function (obj) {
                        switch (obj.id) {
                            case 'reload':
                                // 重载 - 默认（参数重置）
                                table.reload('test', {
                                    where: {
                                        abc: '123456'
                                        //,test: '新的 test2'
                                        //,token: '新的 token2'
                                    }
                                    /*
                                    ,cols: [[ // 重置表头
                                      {type: 'checkbox', fixed: 'left'}
                                      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计：'}
                                      ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
                                      ,{field:'experience', title:'积分', width:80, sort: true, totalRow: true, templet: '<div>{{ d.experience }} 分</div>'}
                                      ,{field:'logins', title:'登入次数', width:100, sort: true, totalRow: true}
                                      ,{field:'joinTime', title:'加入时间', width:120}
                                    ]]
                                    */
                                });
                                break;
                            case 'reload-deep':
                                // 重载 - 深度（参数叠加）
                                table.reload('test', {
                                    where: {
                                        abc: 123
                                        , test: '新的 test1'
                                    }
                                    //,defaultToolbar: ['print'] // 重载头部工具栏右侧图标
                                    //,cols: ins1.config.cols
                                }, true);
                                break;
                            case 'reloadData':
                                // 数据重载 - 参数重置
                                table.reloadData('test', {
                                    where: {
                                        abc: '123456'
                                        //,test: '新的 test2'
                                        //,token: '新的 token2'
                                    }
                                    , scrollPos: 'fixed'  // 保持滚动条位置不变 - v2.7.3 新增
                                    , height: 2000 // 测试无效参数（即与数据无关的参数设置无效，此处以 height 设置无效为例）
                                    //,url: '404'
                                    //,page: {curr: 1, limit: 30} // 重新指向分页
                                });
                                break;
                            case 'reloadData-deep':
                                // 数据重载 - 参数叠加
                                table.reloadData('test', {
                                    where: {
                                        abc: 123
                                        , test: '新的 test1'
                                    }
                                }, true);
                                break;
                        }
                        layer.msg('可观察 Network 请求参数的变化');
                    }
                });

                // 更多测试
                dropdown.render({
                    elem: '#moreTest' //可绑定在任意元素中，此处以上述按钮为例
                    , data: [{
                        id: 'add',
                        title: '添加'
                    }, {
                        id: 'update',
                        title: '编辑'
                    }, {
                        id: 'delete',
                        title: '删除'
                    }]
                    //菜单被点击的事件
                    , click: function (obj) {
                        var checkStatus = table.checkStatus(id)
                        var data = checkStatus.data; // 获取选中的数据
                        switch (obj.id) {
                            case 'add':
                                layer.open({
                                    title: '添加',
                                    type: 1,
                                    area: ['80%', '80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'update':
                                if (data.length !== 1) return layer.msg('请选择一行');
                                layer.open({
                                    title: '编辑',
                                    type: 1,
                                    area: ['80%', '80%'],
                                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                                });
                                break;
                            case 'delete':
                                if (data.length === 0) {
                                    return layer.msg('请选择一行');
                                }
                                layer.msg('delete event');
                                break;
                        }
                    }
                });
            }
            , error: function (res, msg) {
                console.log(res, msg)
            }
        });

        // 工具栏事件
        table.on('toolbar(test)', function (obj) {
            var id = obj.config.id;
            var checkStatus = table.checkStatus(id);
            var othis = lay(this);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(layui.util.escape(JSON.stringify(data)));
                    break;
                case 'getData':
                    var getData = table.getData(id);
                    console.log(getData);
                    layer.alert(layui.util.escape(JSON.stringify(getData)));
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选')
                    break;
                case 'multi-row':
                    table.reload('test', {
                        // 设置行样式，此处以设置多行高度为例。若为单行，则没必要设置改参数 - 注：v2.7.0 新增
                        lineStyle: 'height: 95px;'
                    });
                    layer.msg('即通过设置 lineStyle 参数可开启多行');
                    break;
                case 'default-row':
                    table.reload('test', {
                        lineStyle: null // 恢复单行
                    });
                    layer.msg('已设为单行');
                    break;
                case 'LAYTABLE_TIPS':
                    layer.alert('Table for layui-v' + layui.v);
                    break;
            }
            ;
        });

        //触发单元格工具事件
        table.on('tool(test)', function (obj) { // 双击 toolDouble
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    title: '编辑',
                    type: 1,
                    area: ['80%', '80%'],
                    content: '<div style="padding: 16px;">自定义表单元素</div>'
                });
            }
        });

        //触发表格复选框选择
        table.on('checkbox(test)', function (obj) {
            console.log(obj)
        });

        //触发表格单选框选择
        table.on('radio(test)', function (obj) {
            console.log(obj)
        });

        // 行单击事件
        table.on('row(test)', function (obj) {
            //console.log(obj);
            //layer.closeAll('tips');
        });
        // 行双击事件
        table.on('rowDouble(test)', function (obj) {
            console.log(obj);
        });

        // 单元格编辑事件
        table.on('edit(test)', function (obj) {
            var field = obj.field //得到字段
                , value = obj.value //得到修改后的值
                , data = obj.data; //得到所在行所有键值

            var update = {};
            update[field] = value;
            obj.update(update);
        });
    });
</script>
</body>
</html>
