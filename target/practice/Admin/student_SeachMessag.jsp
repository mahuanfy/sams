<%@ page import="java.util.List" %>
<%@ page import="com.eu.sams.entity.StudentBean" %><%--
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
    <link rel="stylesheet" href="plugins/layui/css/layui.css"  media="all">
    <script src="plugins/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function () {

        $.post("${pageContext.request.contextPath}/EvaluateServlet?method=find_teacherMessage",
            function (data,status) {
                $("#zz").html("");
                for (var i=0;i<data.length;i++){
                    $("#zz").append("<div class='layui-elem-quote'>工号："+ data[i]['e_teacherid']+"<br> <b>"+ data[i]['e_teachername']+"<%--<%=studentBean.getS_username()%>--%>: </b>"+data[i]['e_message_t']+" <div>"+data[i]['e_time']+"</div></div>");
                }
            },
            "json"
        );

    });
</script>
<body>
<%--<%
    List list= (List) session.getAttribute("info");
    StudentBean studentBean = (StudentBean) list.get(0);
%>--%>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>公告栏</legend>

    <div id="zz">

    </div>





</fieldset>

</body>
</html>
