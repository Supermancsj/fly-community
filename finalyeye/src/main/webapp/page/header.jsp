
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../commons/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="../commons/layui/css/modules/layer/default/layer.css"/>
    <script type="text/javascript" src="../commons/layui/layui.js"></script>
    <meta charset="utf-8">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是跨设备模块化前端框架layui的官网社区，致力于为web开发提供强劲动力">
    <meta name="renderer" content="webkit">  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../style/css/second.css">
    <link rel="stylesheet" href="../style/css/global.css">
    <link rel="stylesheet" type="text/css" href="../style/css/header.css"/>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;//…
        });
    </script>
</head>
<div class="fly-header layui-bg-black">
    <div class="layui-container"><a class="fly-logo" href="/">
        <c:set var="user" scope="session" value="${user}"/>
        <img src="../images/logo.png" alt="layui"></a>
        <ul class="layui-nav fly-nav layui-hide-xs">
            <li class="layui-nav-item layui-this"><a href="../index.jsp"><i class="iconfont icon-jiaoliu"></i>交流</a></li>
            <li class="layui-nav-item"><a href="javascript:;"><i class="iconfont icon-chanpin" style="top: 1px;"></i>专区<span class="layui-nav-more"></span></a>
                <span class="layui-badge-dot" style="margin: -5px 10px 0; right: 0;"></span>      </li>
            <li class="layui-nav-item">        <a href="http://www.layui.com/"><i class="iconfont icon-ui"></i>框架</a>      </li>
            <c:if test="${user.role==1}">
            <li class="layui-nav-item"> <a href="/page/admin.jsp"><i class="layui-icon layui-icon-password"></i>后台管理</a>      </li>
            </c:if>
            <span class="layui-nav-bar"></span></ul>
        <ul class="layui-nav fly-nav-user">

            <c:if test="${user.tel!=null}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                    <a class="fly-nav-avatar" href="usercenter.jsp" id="LAY_header_avatar" hidden="hidden">
                        <cite class="layui-hide-xs" >${user.nikeName}</cite>
                        <img src="/${user.head_img}">          <span class="layui-nav-more"></span>
                    </a>
                    </a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit">
                        <dd><a href="../usercenter.jsp">用户中心</a></dd>
                        <dd><a href="">基本设置</a></dd>            <hr>
                        <dd><a href="">我的消息</a></dd>
                        <dd><a href="../user/product/">已购产品</a></dd>
                        <dd><a href="/u/45542616">我的主页</a></dd>            <hr style="margin: 5px 0;">
                        <dd><a href="/user/loginout" style="text-align: center;">退出</a></dd>
                    </dl>        </li>
            </c:if>
            <c:if test="${user.tel==null}">
            <li class="layui-nav-item">
                <a class="iconfont icon-touxiang layui-hide-xs" href="../login.jsp"></a>
            </li>
            <li class="layui-nav-item"><a href="../login.jsp">登入</a>        </li>
            <li class="layui-nav-item">          <a href="/register.jsp">注册</a>        </li>              </c:if>
        </ul>
    </div>
</div>
<body>
</body>
</html>
