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
<%
    JSONArray jsonArray = (JSONArray) session.getAttribute("user");
    if(jsonArray==null){
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }else{
%>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field site-demo-button">
        <legend>创课各分院每月点击次数数据统计</legend>
        <div style="">

            <div class="layui-btn-group">
                <button id="refer" class="refer layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon"></i>&nbsp;增加
                </button>
                <button id="delete" class="layui-btn layui-btn-danger layui-btn-small"><i class="layui-icon"></i>&nbsp;删除
                </button>
            </div>

        </div>
        <div>
            <table class="layui-table">
                <colgroup>
                    <col width="40">
                    <col width="60">
                    <col width="">
                    <col width="100">
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
                    <col width="110">
                </colgroup>
                <thead>
                <tr>
                    <th><input type="checkbox" id="selected-all"></th>
                    <th>编号</th>
                    <th>年份</th>
                    <th>月份</th>
                    <th>人居环境学院</th>
                    <th>信息工程学院</th>
                    <th>人文教育学院</th>
                    <th>通识学院</th>
                    <th>休闲管理学院</th>
                    <th>高职学院</th>
                    <th>会计学院</th>
                    <th>爱德艺术学院</th>
                    <th>文化传媒学院</th>
                    <th>物流贸易学院</th>
                    <th>金融学院</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="tr_1">

                </tbody>
            </table>
        </div>
        <div id="demo1"></div>
        <ul id="biuuu_city_list"></ul>
    </fieldset>
</div>
<script type="text/javascript">


    $(document).ready(function () {

        //总页数
        $("#refer_div").hide();
        var tronClasstype = [];
        var dataLength = [];

        <%--var a =${.getAttribute("pages")};--%>
        //分页代码
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage
//                , layer = layui.layer;
            laypage({
                cont: 'demo1'
                , groups: 5, //连续显示分页数
                jump: function(obj, first){
                    //得到了当前页，用于向服务端请求对应数据
                     var curr = obj.curr;
                    $.post("${pageContext.request.contextPath}/TronClassServlet?method=pool",
                        {
                            curr:curr
                        },
                        function (data, status) {
                            $(".tr_1").html("");
                            for (var i = 0; i < data.length; i++) {
                                dataLength.push(data[i]);
                                tronClasstype = data[i];
                                $(".tr_1").append("<tr> <td><input type='checkbox'></td>" +
                                    "<td>" + (i + 1) + "</td>" +
                                    "<td>" + tronClasstype['year'] + "</td>" +
                                    "<td>" + tronClasstype['tron_month'] + "</td>" +
                                    "<td>" + tronClasstype['eu_rj'] + "</td>" +
                                    "<td>" + tronClasstype['eu_xin'] + "</td>" +
                                    "<td>" + tronClasstype['eu_rw'] + "</td>" +
                                    "<td>" + tronClasstype['eu_ts'] + "</td>" +
                                    "<td>" + tronClasstype['eu_xiu'] + "</td>" +
                                    "<td>" + tronClasstype['eu_gz'] + "</td>" +
                                    "<td>" + tronClasstype['eu_kuai'] + "</td>" +
                                    "<td>" + tronClasstype['eu_ad'] + "</td>" +
                                    "<td>" + tronClasstype['eu_wc'] + "</td>" +
                                    "<td>" + tronClasstype['eu_wu'] + "</td>" +
                                    "<td>" + tronClasstype['eu_jr'] + "</td>" +
                                    "<td>" +
                                    "<a href='/manage/article_edit_1' class='layui-btn layui-btn-mini'>编辑</a>" +
                                    "<a href='javascript:;' data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>删除</a>" +
                                    "</td> </tr>"
                                );
                            }

                        },
                        "json"
                    );

                }
                , pages: <%=session.getAttribute("pages") %>//总页数
            });
        });
//
//        alert(111);

//        layui.use(['laypage', 'layer'], function () {
//            var laypage = layui.laypage
//                , layer = layui.layer;
//            var nums = 5; //每页出现的数据量
//
//            //模拟渲染
//            var render = function (dataLength, curr) {
//                var arr = []
//                    , thisData = dataLength.concat().splice(curr * nums - nums, nums);
//                layui.each(thisData, function (index, item) {
//                    arr.push('<li>' + item + '</li>');
//                });
//                return arr.join('');
//            };
//
//            //调用分页
//            laypage({
//                cont: 'demo8'
//                , pages: Math.ceil(dataLength.length / nums) //得到总页数
//                , jump: function (obj) {
//                    document.getElementById('biuuu_city_list').innerHTML = render(dataLength, obj.curr);
//                }
//            });
////
//        });
//

    });


</script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
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

<div id="refer_div">
    <form class="layui-form" action="${pageContext.request.contextPath}/TronClassServlet?method=save" method="post">
        <div class="huan_a"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">年份</label>
            <div class="layui-input-inline">
                <select name="year" lay-filter="aihao" id="year_ten">
                </select>
            </div>
            <label class="layui-form-label">月份</label>
            <div class="layui-input-inline">
                <select name="tron_month" lay-filter="aihao">
                    <%--<option value=""></option>--%>
                    <option value="一月份" selected="">一月份</option>
                    <option value="二月份">二月份</option>
                    <option value="三月份">三月份</option>
                    <option value="四月份">四月份</option>
                    <option value="五月份">五月份</option>
                    <option value="六月份">六月份</option>
                    <option value="七月份">七月份</option>
                    <option value="八月份">八月份</option>
                    <option value="九月份">九月份</option>
                    <option value="十月份">十月份</option>
                    <option value="十一月份">十一月份</option>
                    <option value="十二月份">十二月份</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">人居环境学院</label>
                <div class="layui-input-inline">
                    <input type="number" name="eu_rj" lay-verify="number" autocomplete="off" class="layui-input">
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
            <div class="huan_a"></div>
            <div class="layui-input-block huan_center">
                <button class="layui-btn" lay-submit="" type="submit"  >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<%}%>
</html>
