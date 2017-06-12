<%--
  Created by IntelliJ IDEA.
  User: 马欢欢
  Date: 2017/6/6
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/table.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">

    $(document).ready(function () {

        $.post("${pageContext.request.contextPath}/ScoreServlet?method=score ",
            function (data, status) {
                $("#Student_currise").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#Student_currise").append(" <tr ><td><input type='checkbox'></td>" +
                        "<th>" + (i + 1) + "</th>" +
                        "<th>" + data[i]['sc_studentid'] + "</th>" +
                        "<th>" + data[i]['sc_name'] + "</th>" +
                        "<th>" + data[i]['sc_class1'] + "</th>" +
                        "<th>" + data[i]['sc_class2'] + "</th>" +
                        "<th>" + data[i]['sc_class3'] + "</th>" +
                        "<th>" + data[i]['sc_class4'] + "</th>" +
                        "<th>" + data[i]['sc_class5'] + "</th>" +
                        "<th>" + data[i]['sc_class6'] + "</th>" +
                        "<th>" + data[i]['sc_class7'] + "</th>" +
                        "<th>" + data[i]['sc_class8'] + "</th>" +
                        "<th>" + data[i]['sc_class9'] + "</th>" +
                        "<th>" + data[i]['sc_class10'] + "</th>" +//onclick='student_compile(" + data[i]['sc_id'] + ")'
                        "<td>" +
                        "<button class='layui-btn layui-btn-mini' onclick='student_compile(" + data[i]['sc_id'] + ")'>编辑</button>&nbsp;&nbsp;" +
                        "<button href='javascript:;' data-id='1' onclick='student_delete(" + data[i]['sc_id'] + ")' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>删除</button> </td></tr>");
                }
            },
            "json"
        );

//按照id查找

    });
    function student_delete(sc_id) {
        layer.confirm('是否删除?', {icon: 3, title:'确认删除'}, function(index){
            $.post("${pageContext.request.contextPath}/ScoreServlet?method=sc_idDelete&sc_id="+sc_id,
                function (data,status) {
                    layer.msg('删除成功', {icon: 1,time: 500});
                    location.reload();
                }
            );
            layer.close(index);
        });

    }
//编辑
    function student_compile(sc_id) {
        $.post("${pageContext.request.contextPath}/ScoreServlet?method=sc_idscore&sc_id="+sc_id,
            function (data, status) {
                $("input[name='sc_studentid']").val(data[0]["sc_studentid"]);
                $("input[name='sc_id']").val(data[0]["sc_id"]);
                $("input[name='sc_name']").val(data[0]["sc_name"]);
                $("input[name='sc_class1']").val(data[0]["sc_class1"]);
                $("input[name='sc_class2']").val(data[0]["sc_class2"]);
                $("input[name='sc_class3']").val(data[0]["sc_class3"]);
                $("input[name='sc_class4']").val(data[0]["sc_class4"]);
                $("input[name='sc_class5']").val(data[0]["sc_class5"]);
                $("input[name='sc_class6']").val(data[0]["sc_class6"]);
                $("input[name='sc_class7']").val(data[0]["sc_class7"]);
                $("input[name='sc_class8']").val(data[0]["sc_class8"]);
                $("input[name='sc_class9']").val(data[0]["sc_class9"]);
                $("input[name='sc_class10']").val(data[0]["sc_class10"]);
            },
            "json"
        );

            layer.open({
                type: 1,
                title: '学生信息更改',
                area: ['1050px', '400px'],
                skin: 'yourclass',
                content: $('#student_div')
            });

    }

    //添加学生及成绩弹出框
    $(function () {
        $("#add").click(function () {
            layer.open({
                type: 1,
                title: '添加学生信息',
                area: ['1050px', '400px'],
                skin: 'yourclass',
                content: $('#student_info'),
            });
        });
    });

</script>
<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote">
        <a href="javascript:;" class="layui-btn layui-btn-small" id="add">
            <i class="layui-icon">&#xe608;</i> 添加学生及成绩
        </a>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>学生成绩列表</legend>
        <div class="layui-field-box">
            <table class="site-table table-hover">
                <colgroup>
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="">
                    <col width="108">
                </colgroup>
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
                <tbody id="Student_currise"></tbody>
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

    layui.use(['icheck', 'laypage', 'layer'], function () {
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
            jump: function (obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if (!first) {
                    //layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });
    });
</script>
</body>
<%--编辑--%>
<div id="student_div" style="display: none">
    <form class="layui-form" action="${pageContext.request.contextPath}/ScoreServlet?method=saveById1" method="post">
        <div style="width: 20px;"></div>
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <input type="hidden" name="sc_id">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input  style="background:#F6F6F6"   name="sc_studentid"  autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input  style="background:#F6F6F6"   name="sc_name"  autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">web技术开发(java)</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class1" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">计算机组成原理</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class2" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">软件工程</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class3" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">大学英语</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class4" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">网站设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class5" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">工科数学</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class6" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">C语言程序设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class7" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">php程序设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class8" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">orcal数据库</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class9" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">html5入门</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class10" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div style="width: 20px; "></div>
        <div class="layui-input-block huan_center">
            <button id="button_aaa" class="layui-btn" lay-submit="" type="submit"  >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<%--添加信息--%>
<div id="student_info" style="display: none">
    <form class="layui-form" action="${pageContext.request.contextPath}/ScoreServlet?method=addStudentResult" method="post">
        <div style="width: 20px;"></div>
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-inline">
                <input    name="sc_studentid1"  autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input    name="sc_name1"  autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">web技术开发(java)</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class11" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">计算机组成原理</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class21" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">软件工程</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class31" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">大学英语</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class41" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">网站设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class51" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">工科数学</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class61" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">C语言程序设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class71" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">php程序设计</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class81" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">orcal数据库</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class91" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">html5入门</label>
                <div class="layui-input-inline">
                    <input type="number" name="sc_class101" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div style="width: 20px;"></div>
        <div class="layui-input-block huan_center" >
            <button id="button_bbb" class="layui-btn" lay-submit="" type="submit"  >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function(value) {
                if(value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function(valu0e) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
</html>
