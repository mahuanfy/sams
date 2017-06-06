<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2017/6/6
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/table.css" />
</head>
<body>
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
                <tbody>
                <tr>
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
                </tr>
                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
