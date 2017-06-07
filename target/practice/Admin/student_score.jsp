<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2017/6/6
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
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
<body>
<script type="text/javascript">
    $(function () {
        $.post("${pageContext.request.contextPath}/StudentServlet?method=idscore",
            function (data,status) {
                $("#Studentid_currise").html("");
                for(var i=0;i<data.length;i++){
                    $("#Studentid_currise").append(" <tr> <th><input type='checkbox' ></th>"+
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
                        "</tr>")
                }
            },
            "json"
        );
    });
</script>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
            <i class="layui-icon">&#xe615;</i> 成绩查看
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
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
                </tr>
                </thead>
                <tbody id="Studentid_currise">
                <%--                <tr>
                                    <th><input type="checkbox" ></th>
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
                                </tr>--%>
                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
