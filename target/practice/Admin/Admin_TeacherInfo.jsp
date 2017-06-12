<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Paging</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="css/global.css" media="all">
	<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="plugins/layui/layui.js"></script>
</head>
<script type="text/javascript">
	//获取老师的所有信息
	$(function () {
        $.post("${pageContext.request.contextPath}/AdminServlet?method=findTeacherInfo",
            function (data,status) {
            	for(var i =0;i<data.length;i++){
            	    $("#con").append("<tr> <td><input type='checkbox'></td>"+
                        "<td>"+(i+1)+"</td>"+
                        "<td>"+data[i]['t_teacherid']+"</td>"+
						" <td>"+data[i]['t_username']+"</td>"+
                        "<td>"+data[i]['t_sex']+"</td> " +
						"<td>"+data[i]['t_tipsay']+"</td>"+
                        "<td>****</td> " +
						"<td><a  class='layui-btn layui-btn-mini' onclick='updateTeacher("+data[i]['t_id']+")'>编辑</a>&nbsp;&nbsp;&nbsp;"+
                        "<a  data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini' onclick='deleTeteacher("+data[i]['t_id']+")'>删除</a>"+
                        "</td></tr>");
				}
        	},
			"json"
        );
    });

    function updateTeacher (t_id) {
        $.post("${pageContext.request.contextPath}/AdminServlet?method=findTeacherToId",
            {
                t_id:t_id
            },
            function (data,status) {
                $("input[name='t_teacherid1']").val(data[0]['t_teacherid']);
                $("input[name='t_username1']").val(data[0]['t_username']);
                $("input[name='t_password1']").val(data[0]['t_password']);
                $("input[name='t_sex1']").val(data[0]['t_sex']);
                $("input[name='t_id']").val(data[0]['t_id']);
                $("input[name='t_tipsay1']").val(data[0]['t_tipsay']);

                layer.open({
                    type: 1,
                    title: '添加学生信息',
                    area: ['360px', '400px'],
                    skin: 'yourclass',
                    content: $('#teacher_add_div1')
                });

            },
            "json"
        );
    }



    function deleTeteacher(t_id) {

        $.post("${pageContext.request.contextPath}/AdminServlet?method=deleteTeacher",
            {
                t_id:t_id
            },
            function (data,status) {
                layer.confirm('是否删除', {icon: 3, title:'删除'}, function(index){
                    layer.msg('删除成功', {icon: 6,time:500},function(){
                        location.reload();
                    });

                    layer.close(index);
                });

            }
        );
    }

    $(function () {
        $("#addTeacher").click(function () {
            layer.open({
                type: 1,
                title: '添加老师信息',
                area: ['360px', '400px'],
                skin: 'yourclass',
                content: $('#teacher_add_div')
            });
        });
    });
</script>
<body>
<div style="margin: 15px;">
	<blockquote class="layui-elem-quote">
		<a href="javascript:;" class="layui-btn layui-btn-small" id="addTeacher">
			<i class="layui-icon">&#xe608;</i> 添加老师信息
		</a>
	</blockquote>
	<fieldset class="layui-elem-field">
		<legend>老师名单</legend>
		<div class="layui-field-box">
			<div>
				<table class="site-table table-hover">
					<thead>
					<tr>
						<th><input type="checkbox" id="selected-all"></th>
						<th>编号</th>
						<th>工号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>代课</th>
						<th>密码</th>
						<th>操作</th>
					</tr>
					</thead>
					<!--内容容器-->
					<tbody id="con">




					</tbody>
				</table>
				<!--分页容器-->

			</div>
		</div>
	</fieldset>
</div>

</body>
<div id="teacher_add_div" style="display: none">
	<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet?method=insertTeacher" method="post">
		<div style="width: 20px;"></div>
		<div class="huan_a"></div>
		<div class="layui-form-item">
			<label class="layui-form-label">工号</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_teacherid"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_username"  autocomplete="off" class="layui-input">
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_sex"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">代课</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_tipsay"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6" type="text"   name="t_password"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="width: 20px; "></div>
		<div class="layui-input-block huan_center">
			<button  class="layui-btn" lay-submit="" type="submit"  >立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>
</div>
<div id="teacher_add_div1" style="display: none">
	<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet?method=updataTeacher" method="post">
		<div style="width: 20px;"></div>
		<div class="huan_a"></div>
		<div class="layui-form-item">
			<input type="hidden" name="t_id">
			<label class="layui-form-label">工号</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_teacherid1"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_username1"  autocomplete="off" class="layui-input">
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_sex1"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">代课</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6"   name="t_tipsay1"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input  style="background:#F6F6F6" type="text"   name="t_password1"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="width: 20px; "></div>
		<div class="layui-input-block huan_center">
			<button id="" class="layui-btn" lay-submit="" type="submit"  >立即提交</button>
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