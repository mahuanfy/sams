/**
 * Created 马欢欢 pc on 2017/5/22.
 */
$(document).ready(function () {
    //年份显示
    var now = new Date();
    var year = now.getFullYear();

    $("#year_ten").append("<option value='"+year+"' selected=''>" + year + "</option>");
    for (var i = 1; i < 10; i++) {
        var i_year = year - i;
        $("#year_ten").append("<option value='"+i_year+"'>" + i_year + "</option>");
    }

//添加数据弹出框
    $("#refer").click(function () {

        layer.open({
            type: 1,
            title: '创客各分院数据填入',
            area: ['1050px', '500px'],
            skin: 'yourclass',
            content: $('#refer_div')

        });
    });
    //自带js框架
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
            content: function(value) {
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
});