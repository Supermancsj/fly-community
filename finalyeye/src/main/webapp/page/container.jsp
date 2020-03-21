<%--
  Created by IntelliJ IDEA.
  User: keke6
  Date: 2019/8/22
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../commons/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="../commons/layui/css/modules/layer/default/layer.css"/>
    <script type="text/javascript" src="../commons/layui/layui.js"></script>
    <script type="text/javascript" src="../commons/jquery-1.8.3.min.js"></script>
    <meta charset="utf-8">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是跨设备模块化前端框架layui的官网社区，致力于为web开发提供强劲动力">
    <meta name="renderer" content="webkit">  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../style/css/second.css">
    <link rel="stylesheet" href="../style/css/global.css">
    <link rel="stylesheet" type="text/css" href="../style/css/header.css"/>
</head>
<body>
<div>
    <%@include file="header.jsp"%>
</div>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel layui-hide-xs"></div>
            <div>
                <%@include file="roof.jsp"%>
            </div>
<div>
    <div class="fly-panel" style="margin-bottom: 0;">
        <div class="fly-panel-title fly-filter">
            <a href="/page/mainshow.jsp?flag=showall" class="layui-this">综合</a>
            <span class="fly-mid"></span>
            <a href="/page/mainshow.jsp?flag=showunsolved">未结</a>
            <span class="fly-mid"></span>
            <a href="/page/mainshow.jsp?flag=showsolved">已结</a>
            <span class="fly-mid"></span>
            <a href="/page/mainshow.jsp?flag=showtop">精华</a>
        </div>
        <div>
            <%@include file="mainshow.jsp"%>
        </div>
    </div>

</div>
        </div>
</div>
</div>
</body>
</html>
