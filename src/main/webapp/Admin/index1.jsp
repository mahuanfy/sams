<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.util.*" %>
<%@ page import="com.eu.sams.entity.StudentBean" %>
<%@ page import="com.eu.sams.entity.TeacherBean" %>
<%@ page import="com.eu.sams.entity.AdminBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>欧亚决策支持系统后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="plugins/layui/layui.js"></script>


</head>

<body>
<%
    List list = (List) session.getAttribute("info");

    if (list == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else {


%>
<script type="text/javascript">
    //        权限设置
    var rank = 0;
    <%--aa = <%studentBean.getS_rank();%>--%>

    <%--alert(aa);--%>
    <%--$.post("${pageContext.request.contextPath}/UserAction?method=rank",--%>
    <%--function (data, status) {--%>
    <%--rank = data;--%>
    <%--}--%>
    <%--)--%>
    //        //自带
    //        layui.use('layer', function () {
    //            var $ = layui.jquery,
    //                layer = layui.layer;
    //
    //            $('#video1').on('click', function () {
    //                layer.open({
    //                    title: 'YouTube',
    //                    maxmin: true,
    //                    type: 2,
    //                    content: 'video.html',
    //                    area: ['800px', '500px']
    //                });
    //            });
    //        });

</script>
<script type="text/javascript" src="datas/nav.js"></script>
<script src="js/index.js"></script>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="http://beginner.zhengjinfan.cn/demo/beginner_admin/">
                    <span style="font-size: 22px;">学生成绩管理系统</span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav admin-header-item">
                <!--<li class="layui-nav-item">-->
                <!--<a href="javascript:;">清除缓存</a>-->
                <!--</li>-->
                <!--<li class="layui-nav-item">-->
                <!--<a href="javascript:;">浏览网站</a>-->
                <!--</li>-->
                <!--<li class="layui-nav-item" id="video1">-->
                <!--<a href="javascript:;">视频</a>-->
                <!--</li>-->
                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="images/0.jpg"/>
                        <%
                            if (session.getAttribute("identity") == "student") {
                                StudentBean studentBean = (StudentBean) list.get(0);
                        %>
                        <span><%=studentBean.getS_username()%></span>

                        <%
                        } else if (session.getAttribute("identity") == "teacher") {
                            TeacherBean teacherBean = (TeacherBean) list.get(0);
                        %>
                        <span><%=teacherBean.getT_username()%></span>

                        <%
                        } else if (session.getAttribute("identity") == "admin") {
                            AdminBean adminBean=(AdminBean) list.get(0);
                        %>
                        <span><%=adminBean.getA_username() %></span>
                        <%
                            }
                        %>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true"
                                   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="../index.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="../index.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-television" aria-hidden="true"></i>
                    <cite>简介</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe src="main.html"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2017 &copy;
                <a href="http://www.mycodes.net/" target="_blank">欧亚决策支持系统后台</a> Eurasia Decision Support System
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="images/0.jpg"/>
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd"/>
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->


</div>
</body>

</html>
<%
    }
%>