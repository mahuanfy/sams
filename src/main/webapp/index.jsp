<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生成绩管理系统</title>
    <link rel="stylesheet" href="Admin/css/site.css" id="siteStyle">
    <link rel="stylesheet" href="Admin/css/login.css">
    <link rel="stylesheet" href="Admin/css/web-icons.css">
    <script type="text/javascript" src="Admin/js/jquery.min.js"></script>
</head>
<body class="page-login  layout-full page-dark  " id="page_background">
<div class="page  height-full">
    <div class="page-content height-full">
        <div class="page-brand-info vertical-align animation-slide-left hidden-xs">
            <div class="page-brand vertical-align-middle">
                <div class="brand">
                    <img class="brand-img" src="Admin/images/logo.png" height="50" alt="学生成绩管理系统">
                    <span class="logo">SAMS</span>
                </div>
                <h3>学生成绩管理系统</h3>
                <ul class="list-icons">
                    <li>学生信息管理系统，提供一个信息更新快捷、管理方便、功能设置合理的学生信息管理</li>
                </ul>
                <%--<div>--%>
                    <%--<a href="http://39.108.72.222:8080/eu/" class="btn btn-primary btn-outline">--%>
                        <%--返回前端页面</a>--%>
                    <%--<a href="#" class="btn btn-primary btn-outline margin-left-5">联系我们</a>--%>
                <%--</div>--%>
            </div>
        </div>
        <div id="login" class="page-login-main animation-fade">

            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h1 class="hidden-xs">学生登录页面</h1>
                    <p class="hidden-xs">学生成绩管理后台系统</p>
                    <form action="${pageContext.request.contextPath}/UserServlet?method=slogin"
                          class="login-form fv-form fv-form-bootstrap" method="post" id="loginForm"
                          novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <%
                            String err= (String) request.getAttribute("err");
                          if(err !=null){
                        %>
                        <span style="color: red"><%=err%></span>
                        <%
                            }
                        %>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入密码" data-fv-field="password">
                            <i class="form-control-feedback" data-fv-icon-for="password" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                            <small class="help-block" data-fv-validator="stringLength" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于30个字符
                            </small>
                        </div>
                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10">登 录</button>
                        </div>
                        <div class="col-sm-5">
                            <button id="register" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                老师登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>
        <%--老师页面--%>
        <div style="display: none" id="register_login" class="page-login-main animation-fade">
            <div class="vertical-align">
                <div class="vertical-align-middle">
                    <h1 class="hidden-xs">老师登录页面</h1>
                    <p class="hidden-xs">学生成绩管理后台系统</p>
                    <form action="${pageContext.request.contextPath}/UserAction?method=tlogin"
                          class="login-form fv-form fv-form-bootstrap" method="post" id="loginForm1"
                          novalidate="novalidate">
                        <button type="submit" class="fv-hidden-submit"
                                style="display: none; width: 0px; height: 0px;"></button>

                        <div class="form-group has-feedback">
                            <label class="sr-only" for="username">用户名</label>
                            <input type="text" class="form-control" id="username1" name="username" placeholder="请输入ID"
                                   data-fv-field="loginName">
                            <i class="form-control-feedback" data-fv-icon-for="loginName" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="loginName"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">用户名不能为空
                            </small>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="sr-only" for="password">密码</label>
                            <input type="password" class="form-control" id="password1" name="password"
                                   placeholder="请输入密码" data-fv-field="password">
                            <i class="form-control-feedback" data-fv-icon-for="password" style="display: none;"></i>
                            <small class="help-block" data-fv-validator="notEmpty" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码不能为空
                            </small>
                            <small class="help-block" data-fv-validator="stringLength" data-fv-for="password"
                                   data-fv-result="NOT_VALIDATED" style="display: none;">密码必须大于6且小于30个字符
                            </small>
                        </div>
                        <div class="col-sm-7">
                            <button type="submit" class="btn btn-primary btn-block margin-top-10">登 录</button>
                        </div>
                        <div class="col-sm-5">
                            <button id="login_go" type="button"
                                    class="btn btn-outline btn-success btn-block margin-top-10">
                                学生登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <footer class="page-copyright">
                <p>© 2017
                    <a href="" target="_blank">Eurasia DSS</a>
                </p>
            </footer>
        </div>
    </div>
</div>
<!-- JS -->
<script src="Admin/js/jquery.js"></script>
<script src="Admin/js/bootstrap.js"></script>
<script src="Admin/js/bootstrap-select.min.js"></script>
<script src="Admin/js/formValidation.min.js" data-name="formValidation"></script>
<script src="Admin/js/bootstrap.min.js" data-deps="formValidation"></script>
</body>
<script type="text/javascript">
    $.post("${pageContext.request.contextPath}/TronClassServlet?method=pages",
        function (data, status) {

        }
    );

//    //取消键盘回车事件
//    $(function () {
//        $("*").each(function () {
//            $(this).keypress(function (e) {
//                var key = window.event ? e.keyCode : e.which;
//                if (key.toString() == "13") {
//                    return false;
//                }
//            });
//        });
//    });
    //切换老师登录和学生登录
    $("#register_login").hide();
    $(document).ready(function () {
        $("#register").click(function () {
            $("#login").hide();
            $("#register_login").fadeIn("slow");
        });
        $("#login_go").click(function () {
            $("#register_login").hide();
            $("#login").fadeIn("slow");
        });
<%--//验证用户是否存在--%>
        <%--$("input[name='register_username'] ").change(function () {--%>
            <%--var name = $(this).val();--%>
<%--//            name = $.trim(name);//取出前后空格--%>
            <%--if (name != "") {--%>
                <%--$.post("${pageContext.request.contextPath}/UserAction?method=check",--%>
                    <%--{"username": name, "time": new Date()},--%>
                    <%--function (data, status) {--%>

                        <%--if (data == 1) {--%>
                            <%--$("#username1_verify2").show();--%>
                        <%--} else {--%>
                            <%--$("#username1_verify2").hide();--%>
                        <%--}--%>

                    <%--}--%>
                <%--);--%>
            <%--}--%>
        <%--});--%>
    });
</script>
<script type="text/javascript">


</script>

</html>