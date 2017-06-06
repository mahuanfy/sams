<%--
  Created by IntelliJ IDEA.
  User: 马欢欢
  Date: 2017/6/6
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/table.css" />
    <script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $.post("${pageContext.request.contextPath}/StudentServlet?method=score ",
            function (data,status) {
                $("#Student_currise").html("");
                for(var i =0;i<data.length;i++){
                    $("#Student_currise").append(" <tr ><td><input type='checkbox'></td>"+
                    "<th>"+ (i + 1) +"</th>"+
                    "<th>"+data[i]['sc_studentid']+"</th>"+
                    "<th>"+data[i]['sc_name']+"</th>"+
                    "<th>"+data[i]['sc_class1']+"</th>"+
                    "<th>"+data[i]['sc_class2']+"</th>"+
                    "<th>"+data[i]['sc_class3']+"</th>"+
                    "<th>"+data[i]['sc_class4']+"</th>"+
                    "<th>"+data[i]['sc_class5']+"</th>"+
                    "<th>"+data[i]['sc_class6']+"</th>"+
                    "<th>"+data[i]['sc_class7']+"</th>"+
                    "<th>"+data[i]['sc_class8']+"</th>"+
                    "<th>"+data[i]['sc_class9']+"</th>"+
                    "<th>"+data[i]['sc_class10']+"</th>"+
                    "<td>"+
                    "<a href='/manage/article_edit_1' class='layui-btn layui-btn-mini'>编辑</a>&nbsp;&nbsp;"+
                    "<a href='javascript:;' data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>删除</a> </td></tr>");
                }
            },
            "json"
        );
    });
</script>
<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <a href="javascript:;" class="layui-btn layui-btn-small" id="add">
            <i class="layui-icon">&#xe608;</i> 修改学生成绩
        </a>
        <%--<a href="#" class="layui-btn layui-btn-small" id="import">--%>
            <%--<i class="layui-icon">&#xe608;</i> 导入信息--%>
        <%--</a>--%>
        <%--<a href="#" class="layui-btn layui-btn-small">--%>
            <%--<i class="fa fa-shopping-cart" aria-hidden="true"></i> 导出信息--%>
        <%--</a>--%>
        <%--<a href="javascript:;" class="layui-btn layui-btn-small" id="search">--%>
            <%--<i class="layui-icon">&#xe615;</i> 搜索--%>
        <%--</a>--%>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>学生成绩列表</legend>
        <div class="layui-field-box">
            <table class="site-table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selected-all"></th>
                    <th>编号</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>web技术开发(java)</th>
                    <th>计算机组成原理</th>
                    <th>软件工程</th>
                    <th>大学英语</th>
                    <th>网站设计</th>
                    <th>工科数学</th>
                    <th>C语言程序设计</th>
                    <th>php程序设计</th>
                    <th>orcal数据库</th>
                    <th>html5入门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="Student_currise">

                    <%--<td><input type="checkbox"></td>--%>
                    <%--<th>编号</th>--%>
                    <%--<th>学号</th>--%>
                    <%--<th>姓名</th>--%>
                    <%--<th>web技术开发(java)</th>--%>
                    <%--<th>计算机组成原理</th>--%>
                    <%--<th>软件工程</th>--%>
                    <%--<th>大学英语</th>--%>
                    <%--<th>网站设计</th>--%>
                    <%--<th>工科数学</th>--%>
                    <%--<th>C语言程序设计</th>--%>
                    <%--<th>php程序设计</th>--%>
                    <%--<th>orcal数据库</th>--%>
                    <%--<th>html5入门</th>--%>
                    <%--<td>--%>
                        <%--<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>--%>
                        <%--<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a>--%>
                        <%--<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>--%>
                    <%--</td>--%>

                </tbody>
            </table>

        </div>
    </fieldset>
    <div class="admin-table-page" style="padding-bottom: 20px; padding-left: 20px;">
        <div id="page" class="page">
        </div>
    </div>
</div>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: 'plugins/layui/modules/'
    });

    layui.use(['icheck', 'laypage','layer'], function() {
        var $ = layui.jquery,
            laypage = layui.laypage,
            layer = parent.layer === undefined ? layui.layer : parent.layer;
        $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
        });

        //page
        laypage({
            cont: 'page',
            pages: 25 //总页数
            ,
            groups: 5 //连续显示分页数
            ,
            jump: function(obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if(!first) {
                    //layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });






//        $('.site-table tbody tr').on('click', function(event) {
//            var $this = $(this);
//            var $input = $this.children('td').eq(0).find('input');
//            $input.on('ifChecked', function(e) {
//                $this.css('background-color', '#EEEEEE');
//            });
//            $input.on('ifUnchecked', function(e) {
//                $this.removeAttr('style');
//            });
//            $input.iCheck('toggle');
//        }).find('input').each(function() {
//            var $this = $(this);
//            $this.on('ifChecked', function(e) {
//                $this.parents('tr').css('background-color', '#EEEEEE');
//            });
//            $this.on('ifUnchecked', function(e) {
//                $this.parents('tr').removeAttr('style');
//            });
//        });
//        $('.site-table tbody tr').on('click', function(event) {
//            var $this = $(this);
//            var $input = $this.children('td').eq(0).find('input');
//            $input.on('ifChecked', function(e) {
//                $this.css('background-color', '#EEEEEE');
//            });
//            $input.on('ifUnchecked', function(e) {
//                $this.removeAttr('style');
//            });
//            $input.iCheck('toggle');
//        }).find('input').each(function() {
//            var $this = $(this);
//            $this.on('ifChecked', function(e) {
//                $this.parents('tr').css('background-color', '#EEEEEE');
//            });
//            $this.on('ifUnchecked', function(e) {
//                $this.parents('tr').removeAttr('style');
//            });
//        });
//        $('#selected-all').on('ifChanged', function(event) {
//            var $input = $('.site-table tbody tr td').find('input');
//            $input.iCheck(event.currentTarget.checked ? 'check' : 'uncheck');
//        });
    });
</script>
</body>

</html>
