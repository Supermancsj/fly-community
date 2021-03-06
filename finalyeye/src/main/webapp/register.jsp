<%--
  Created by IntelliJ IDEA.
  User: 周娜
  Date: 2019/8/22
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="commons/layui/css/layui.css" />
    <link rel="stylesheet" href="style/css/global.css" />
    <link rel="stylesheet" href="style/css/register.css" />
    <script src="commons/layui/layui.js"></script>
    <%@ include file="page/header.jsp" %>
</head>
<body>
<div class="layui-container fly-container">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">==$0
                <li>
                    <a href="login.jsp">登录</a>
                </li>
                <li class="layui-this">
                    注册
                </li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding:20px 0;">
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tel" required lay-verify="required" autocomplete="off"
                                       class="layui-input tel">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">图形码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="vimCode" required lay-verify="required" autocomplete="off"
                                       class="layui-input vifiyCode">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <img src="verifyCodeImg" class="vimCode" alt="验证码"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">验证码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="telCode" required lay-verify="required"
                                       placeholder="请输入手机短信验证码" autocomplete="off" class="layui-input telVifiyCode">
                            </div>
                            <div class="layui-form-mid layui-word-aux">
                                <button type="button" class="layui-btn layui-btn-normal tel-btn">获取验证码</button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="nickName" required lay-verify="required" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">你在社区的名字</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="pwd" required lay-verify="required" autocomplete="off"
                                       class="layui-input pwd">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="pwd2" required lay-verify="required" placeholder="请输入密码"
                                       autocomplete="off" class="layui-input pwd2">
                            </div>
                        </div>
                        <div class="layui-form-item" style="position: relative; left: -10px; height: 32px;">
                            <input type="checkbox" name="agreement" lay-skin="primary" title="" checked="">
                            <div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary">
                                <i class="layui-icon layui-icon-ok"></i></div>
                            <a href="agreeterms.jsp" target="_blank"
                               style="position: relative; top: 4px; left: 5px; color: #999;">同意用户服务条款</a>
                        </div>
                        <div class="layui-form-item register-btn">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn layui-btn-normal" lay-submit
                                        lay-filter="formDemo">立即注册
                                </button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <%@include file="page/footer.jsp"%>
</div>
<script src="js/register.js"></script>
</body>
</html>
