<%@ page import="java.util.*" %>
<%@ page import="com.eu.sams.entity.StudentBean" %>
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
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="plugins/layui/layui.js" charset="utf-8"></script>
</head>
<%
    List  list= (List) session.getAttribute("info");
    StudentBean studentBean = (StudentBean) list.get(0);
%>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>留言板 给老师提个意见吧</legend>
</fieldset>

<textarea class="layui-textarea" id="LAY_demo1" style="display: none">
</textarea>

    <div class="layui-form-item">
        <div class="layui-input-inline" style="margin-left: 50px;">

            <select id="select_Teacher" name="teacher" lay-filter="aihao" style="width: 100px;height: 40px">

            </select>
        </div>


<div class="site-demo-button" style="margin-top: 20px;margin-left: 50px;margin-bottom: 20px;">
    <button class="layui-btn site-demo-layedit" data-type="content">提交留言</button>
    <!--<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>-->
    <!--<button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>-->
</div>
    </div>
<fieldset class="layui-elem-field site-demo-button">
    <legend>我的历史留言</legend>
    <div id="aaa">
    </div>
    <p></p>
</fieldset>
<script type="text/javascript">
//    <option value='计算机原理' >计算机原理</option>
    $(function () {
        $.post("${pageContext.request.contextPath}/AdminStuCurriseServlet?method=Student_findTeacher",
            function (data,status) {
                $("#select_Teacher").html("");
                for(var i=0;i<data.length;i++){


                    $("#select_Teacher").append("<option value='"+data[i]['t_teacherid']+"'>"+data[i]['t_username']+"</option>");
                }
            },"json"
        );
    });

</script>


<script type="text/javascript">
    $(document).ready(function () {

        $.post("${pageContext.request.contextPath}/EvaluateServlet?method=find_studentMessage",
            function (data, status) {
                $("#aaa").html("");
                for(var i =0;i<data.length;i++) {
                    $("#aaa").append("<div class='layui-elem-quote'>学号：" + data[i]['e_studentid'] + "<br><b><%=studentBean.getS_username()%>: </b>" + data[i]['e_sudent_t'] + " <div>" + data[i]['e_time'] + " </div></div>");
                }
            },
            "json"
        );
    });

    layui.use('layedit', function () {
        var layedit = layui.layedit
            , $ = layui.jquery;

        //构建一个默认的编辑器
        var index = layedit.build('LAY_demo1');

        //编辑器外部操作
        var active = {
            content: function () {
                var time = new Date();
                // 程序计时的月从0开始取值后+1
                var m = time.getMonth() + 1;
                var t = time.getFullYear() + "-" + m + "-"
                    + time.getDate() + " " + time.getHours() + ":"
                    + time.getMinutes() + ":" + time.getSeconds();

                //留言板内容写入数据库
                var e_sudent_t = layedit.getContent(index);
                var teacherID = $("select[name='teacher']").val();
                $(function () {
//                    alert(layedit.getContent(index)); //获取编辑器内容
                    $.post("${pageContext.request.contextPath}/EvaluateServlet?method=studentMessage",
                        {
                            e_teacherid: teacherID,
                            e_sudent_t: e_sudent_t,
                            e_time:t,
                            e_studentname:<%=studentBean.getS_username()%>
                        },
                        function (data, status) {
                            layer.msg('留言成功', {icon: 1,time: 1000}, function () {
                                location.reload();
                            });
                        }
                    );
                });

            }
            , text: function () {
//                alert(layedit.getText(index)); //获取编辑器纯文本内容
                $("#aaa").append("<div class='layui-elem-quote'>" + layedit.getText(index) + "</div>");

            }
            , selection: function () {
                alert(layedit.getSelection(index));
            }
        };

        $('.site-demo-layedit').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //自定义工具栏
        layedit.build('LAY_demo2', {
            tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
            , height: 100
        })
    });
</script>

</body>
</html>