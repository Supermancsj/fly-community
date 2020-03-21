<%--
  Created by IntelliJ IDEA.
  User: 周娜
  Date: 2019/8/24
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <link rel="stylesheet" href="commons/layui/css/layui.css" />
    <link rel="stylesheet" href="style/global.css" />
    <link rel="stylesheet" href="style/login.css" />
    <script src="commons/layui/layui.js"></script>
    <%@ include file="page/header.jsp" %>
</head>
<body>
<div class="layui-container fly-container">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">==$0
                <li class="layui-this">
                    登录
                </li>
                <li>
                    <a href="register.jsp">注册</a>
                </li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding:20px 0;">
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机</label>
                            <div class="layui-input-inline">
                                <input type="number" name="login-tel" required lay-verify="required" autocomplete="off"
                                       class="layui-input login-tel">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="login-pwd" required lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input login-pwd">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图形码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="login-vimCode" required lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input login-vrifyCode">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <img src="verifyCodeImg" class="login-vimCode" alt="验证码"/>
                            </div>
                        </div>
                        <div class="layui-form-item login-btn">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit
                                        lay-filter="formDemo">立即登陆
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary">忘记密码</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/login.js"></script>
</body>
</html>
