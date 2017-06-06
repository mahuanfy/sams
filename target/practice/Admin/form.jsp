<%@ page import="net.sf.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>创课各分院每月点击次数数据统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="css/eu_manage.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/button_js.js" charset="utf-8"></script>
</head>

	<body>

		<div style="margin: 15px;">

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
	</body>
<div >
    <form class="layui-form" action="">
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">月份</label>
            <div class="layui-input-inline">
                <select name="tron_month" lay-filter="aihao">
                    <%--<option value=""></option>--%>
                    <option value="0" selected="">一月份</option>
                    <option value="1" >二月份</option>
                    <option value="2">三月份</option>
                    <option value="3">四月份</option>
                    <option value="4">五月份</option>
                    <option value="5">六月份</option>
                    <option value="6">七月份</option>
                    <option value="7">八月份</option>
                    <option value="8">九月份</option>
                    <option value="9">十月份</option>
                    <option value="10">十一月份</option>
                    <option value="11">十二月份</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">人居环境学院</label>
                <div class="layui-input-inline">
                    <input type="number"  name="eu_rj" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">信息工程学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xin" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">人文教育学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rw" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">通识学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ts" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">休闲管理学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_xiu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">高职学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_gz" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">会计学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_kuai" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">爱德艺术学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_ad" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">文化传媒学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wc" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">物流贸易学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_wu" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">金融学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_jr" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"   lay-submit=""lay-filter="demo1"  >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</html>