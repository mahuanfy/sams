<%--
  Created by IntelliJ IDEA.
  User: 马欢欢
  Date: 2017/6/9
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all">
    <script src="plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>学生的留言信息</legend>
    <%--<blockquote  class="layui-elem-quote">--%>
        <div id ="teacher_Evaluate">
        </div>
    <%--</blockquote>--%>
</fieldset>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $.post(
            "${pageContext.request.contextPath}/EvaluateServlet?method=findStudentToTeacherEvaluate",
            function (data, status) {
                var name =null;
                $("#teacher_Evaluate").html("");
                for(var i =0;i<data.length;i++) {

                    $("#teacher_Evaluate").append("<div class='layui-elem-quote'><b>编号："+(i+1)+"</b><br><b> 学号：" + data[i]['e_studentid'] + "</b><br><b >" + data[i]['e_studentname'] + ":</b>" + data[i]['e_sudent_t'] + " <div>" + data[i]['e_time'] + " </div></div>");
                }
            },
            "json"
        );
    });
</script>
</html>
