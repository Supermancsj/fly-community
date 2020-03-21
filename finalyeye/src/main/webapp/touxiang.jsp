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
                <li lay-id="avatar" class="layui-this"><a href="touxiang.jsp">头像</a></li>
                <li lay-id="pass"><a href="changepass.jsp">密码</a></li>

            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">

                <form action="" method="" enctype="multipart/form-data" name="form1">
                    <div class="layui-form layui-form-pane layui-tab-item layui-show">
                        <div class="layui-form-item">
                            <div class="avatar-add">
                                <p>建议尺寸1168*168，支持jpg、png、gif，最大不能超过50KB</p>
                                <button type="button" class="layui-btn upload-img" id="test1">
                                    <i class="layui-icon"></i>上传头像
                                </button>

                                <input class="layui-upload-file" type="file" accept="" name="file"> <img src="/images/${user.head_img}">
                                <span class="loading"></span>
                            </div>
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
<script>
    layui.use(['jquery', 'form', 'layer'], function() {
        let $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;




    });
</script>
<script src="commons/layui/layui.js"></script>
<script>
    layui.use(['element','jquery','upload'], function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/upload/changetou' //上传接口
            ,done: function(res){
                //上传完毕回调

               //$.post()
               if(res!==null) window.location.reload();


            }
            ,error: function(res){
                console.log("fail");
                layer.msg("图片不能超过50kb",{anim:6,skin:"",icon:""});
            }
        });
    });
</script>
</body>
</html>
