<%@ page import="org.zdk.fly_community.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/29
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Thread.sleep(10);
    User user = (User)session.getAttribute("user");
    //User user= (User)session.getAttribute("user");
%>
<div>
    <%@ include file="page/header.jsp" %>
    <script>
        //let tel = $(".per_tel").val();

    </script>
</div>

<div class="layui-container fly-marginTop fly-user-main">
    <%@ include file="page/left.jsp" %>
    <div class="fly-panel fly-panel-user" pad20="">
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li class="layui-this" lay-id="info"><a href="information.jsp">我的资料</a></li>
                <li lay-id="avatar"><a href="touxiang.jsp">头像</a></li>
                <li lay-id="pass"><a href="changepass.jsp">密码</a></li>

            </ul>

            <div class="layui-tab-content" style="padding: 20px 0;">
                <form action="" method="">
                    <div class="layui-form layui-form-pane layui-tab-item layui-show">
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机</label>
                            <div class="layui-input-inline tel-btn">
                            <%
                                //String email= user.getEmail();
                                String tel = user.getTel();
                                if(tel!=null){
                                    out.print("<input type=\"text\" name=\"per-tel\" required lay-verify=\"required\" value=\""+tel+"\" autocomplete=\"off\" style=\"cursor: not-allowed !important;\" class=\"layui-input per_tel\" onfocus=this.blur()>");
                                }
                                else{
                                    out.print("<input type=\"text\" name=\"per-tel\" required lay-verify=\"required\" value=\"\" autocomplete=\"off\" style=\"cursor: not-allowed !important;\" class=\"layui-input per_tel\" onfocus=this.blur()>");
                                }
                            %>
                            </div>
                        <%--<label class="layui-form-label">手机</label>
                            <div class="layui-input-inline tel-btn">
                                <input type="text" name="per-tel" required lay-verify="required" value="111" autocomplete="off" style="cursor: not-allowed !important;" class="layui-input per_tel" onfocus=this.blur()>
                            </div>--%>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <%--<input type="text" name="per-name" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input per_name">--%>
                                    <%
                                        //String email= user.getEmail();
                                        String name = user.getNikeName();
                                        if(name!=null){
                                            out.print("<input type=\"text\" name=\"per-name\" required lay-verify=\"required\" value=\""+name+"\" autocomplete=\"off\" class=\"layui-input per_name\">");
                                        }
                                        else{
                                            out.print("<input type=\"text\" name=\"per-name\" required lay-verify=\"required\" value=\"\" autocomplete=\"off\" class=\"layui-input per_name\">");
                                        }
                                    %>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">城市</label>
                            <div class="layui-input-inline">
                                <%--<input type="text" name="per-city" required lay-verify="required"  placeholder="请输入标题" autocomplete="off"  class="layui-input per_city">--%>
                                    <%
                                        //String email= user.getEmail();
                                        String city = user.getCity();
                                        if(city!=null){
                                            out.print("<input type=\"text\" name=\"per-city\" required lay-verify=\"required\" value=\""+city+"\" autocomplete=\"off\" class=\"layui-input per_city\">");
                                        }
                                        else{
                                            out.print("<input type=\"text\" name=\"per-city\" required lay-verify=\"required\" value=\"\" autocomplete=\"off\" class=\"layui-input per_city\">");
                                        }
                                    %>
                            </div>
                        </div>
                        <div class="layui-form-item per_sex">
                            <input type="radio" name="per-sex" value="男" title="男" >
                            <input type="radio" name="per-sex" value="女" title="女" >
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">签名</label>
                            <div class="layui-input-block">
                                <textarea name="desc" placeholder="随便写些什么刷下存在感" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn" key="set-mine" lay-filter="test1" lay-submit="" id="test1">立即提交</button>
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
            $.post('user/data',fromJson,function(res){
                //layer.msg(JSON.stringify(res),{anim:6,skin:"",icon:""});
                //JS跳转
                // window.location.href = "index1.jsp";
                var s=res.msg;
                console.log(res);
                console.log(s);
                // window.location.reload();
                // window.location.href = "changepass.jsp";
                if(s=="请选择性别"){
                    console.log("sex");
                    layer.msg("请选择性别",
                        {
                            time: 5000,
                            anim: 6,
                            skin: "",
                            icon: ""
                        }
                    );
                    setTimeout(function(){
                        //self.location='information.jsp';
                    },5000);}
                else{
                    layer.msg(s, {
                        anim: 6,
                        skin: "",
                        icon: ""
                    });
                    setTimeout(function(){
                        self.location='information.jsp';
                    },3000);
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
