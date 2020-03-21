<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/28
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%@ include file="page/header.jsp" %>
</div>

<div class="layui-container fly-marginTop fly-user-main">
    <%@ include file="page/left.jsp" %>
    <div class="fly-panel fly-panel-user" pad20="">
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="" lay-id="info"><a href="information.jsp">我的资料</a></li>
                <li lay-id="avatar"><a href="touxiang.jsp">头像</a></li>
                <li lay-id="pass" class="layui-this"><a href="changepass.jsp">密码</a></li>

            </ul>

            <div class="layui-tab-content" style="padding: 20px 0;">
                <form action="" method="">
                <div class="layui-form layui-form-pane layui-tab-item layui-show">

                    <div class="layui-form-item"> <label for="L_nowpass" class="layui-form-label">当前密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_nowpass" name="nowpass" required="" lay-verify="required"
                                                                autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item"> <label for="L_pass" class="layui-form-label">新密码</label>
                        <div class="layui-input-inline"> <input type="password" id="L_pass" name="pass" required="" lay-verify="required"
                                                                autocomplete="off" class="layui-input"> </div>
                        <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                    </div>
                    <div class="layui-form-item"> <label for="L_repass" class="layui-form-label">确认密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="L_repass" name="repass" required="" lay-verify="required"
                                                                autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" key="set-mine" lay-filter="test1" lay-submit="" id="test1">确认修改</button>
                    </div>


                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div>
    <%@ include file="page/footer.jsp" %>
</div>

<script src="commons/layui/layui.js"></script>
<script>
    layui.use(['element','jquery','form','layer'],function () {
        let $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;



        form.on('submit(test1)', function(data){
            let fromJson = data.field;
            //$.post(请求地址，请求参数，请求成功后返回的数据);
            $.post('user/changepass',fromJson,function(res){
                //layer.msg(JSON.stringify(res),{anim:6,skin:"",icon:""});
                //JS跳转
               // window.location.href = "index1.jsp";
                    var s=res.msg;

                   // window.location.reload();
               // window.location.href = "changepass.jsp";
                if(s=="修改成功"){
                    layer.msg(s,
                        {
                            time: 5000
                        }
                    );
                setTimeout(function(){
                    self.location='changepass.jsp';
                },5000);}
                else{
                    layer.msg(s, {
                        anim: 6,
                        skin: "",
                        icon: ""
                    })
                }


                }).error(function(res) {
                    console.log("fail");
                    var s=res.msg;
                    layer.msg(s, {
                    anim: 6,
                    skin: "",
                    icon: ""
                })

            });
            return false;
        });
    });

</script>

</body>
</html>
