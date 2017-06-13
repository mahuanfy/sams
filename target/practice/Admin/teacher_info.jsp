<%@ page import="com.eu.sams.entity.StudentBean" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 杨璐鹏
  Date: 2017/6/8
  Time: 11:14
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
    <link rel="stylesheet" href="./plugins/layui/css/layui.css" media="all">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="./js/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<script type="text/javascript">
    $(document).ready(function () {
        $.post("${pageContext.request.contextPath}/TeacherServlet?method=teacherInfo",
            function (data, status) {
                $("input[name='t_teacherid']").val(data[0]['t_teacherid']);
                $("input[name='t_username']").val(data[0]['t_username']);
                $("input[name='t_sex']").val(data[0]['t_sex']);
                $("input[name='t_tipsay']").val(data[0]['t_tipsay']);
            },
            "json"
        );
    });
</script>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>个人信息</legend>
</fieldset>
<div style="margin-left: 560px;">


    <div class="site-demo-upload">
        <img id="LAY_demo_upload" src="./images/ba.jpg">
        <%--<div class="site-demo-upbar">--%>
        <%--<input type="file" name="file" class="layui-upload-file" id="test">--%>
        <%--</div>--%>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>头像</legend>
    </fieldset>
</div>
<div style="margin-left: 500px;">
    <form class="layui-form layui-form-pane" action="">

        <div class="layui-form-item">
            <label class="layui-form-label">学号:</label>
            <div class="layui-input-inline">
                <input readonly="readonly" type="text" name="t_teacherid" lay-verify="required"
                        autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input readonly="readonly" type="text" name="t_username" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-inline">
                <input type="text" name="t_sex" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级：</label>
            <div class="layui-input-inline">
                <input type="text" name="t_tipsay" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input" readonly="readonly">
            </div>
        </div>

    </form>
</div>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<%--<script>--%>
<%--layui.use(['form', 'layedit', 'laydate'], function(){--%>
<%--var form = layui.form()--%>
<%--,layer = layui.layer--%>
<%--,layedit = layui.layedit--%>
<%--,laydate = layui.laydate;--%>

<%--//创建一个编辑器--%>
<%--var editIndex = layedit.build('LAY_demo_editor');--%>

<%--//自定义验证规则--%>
<%--form.verify({--%>
<%--title: function(value){--%>
<%--if(value.length < 5){--%>
<%--return '标题至少得5个字符啊';--%>
<%--}--%>
<%--}--%>
<%--,pass: [/(.+){6,12}$/, '密码必须6到12位']--%>
<%--,content: function(value){--%>
<%--layedit.sync(editIndex);--%>
<%--}--%>
<%--});--%>

<%--//监听指定开关--%>
<%--form.on('switch(switchTest)', function(data){--%>
<%--layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {--%>
<%--offset: '6px'--%>
<%--});--%>
<%--layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)--%>
<%--});--%>

<%--//监听提交--%>
<%--form.on('submit(demo1)', function(data){--%>
<%--layer.alert(JSON.stringify(data.field), {--%>
<%--title: '最终的提交信息'--%>
<%--})--%>
<%--return false;--%>
<%--});--%>


<%--});--%>

<%--layui.use('upload', function(){--%>
<%--layui.upload({--%>
<%--url: '' //上传接口--%>
<%--,success: function(res){ //上传成功后的回调--%>
<%--console.log(res)--%>
<%--}--%>
<%--});--%>

<%--layui.upload({--%>
<%--url: '/test/upload.json'--%>
<%--,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"--%>
<%--,method: 'get' //上传接口的http类型--%>
<%--,success: function(res){--%>
<%--LAY_demo_upload.src = res.url;--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--</script>--%>

</body>
</html>