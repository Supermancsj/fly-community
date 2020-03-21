<%--
  Created by IntelliJ IDEA.
  User: keke6
  Date: 2019/8/22
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="commons/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="commons/layui/css/modules/layer/default/layer.css"/>
    <script type="text/javascript" src="commons/layui/layui.js"></script>
    <meta charset="utf-8">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是跨设备模块化前端框架layui的官网社区，致力于为web开发提供强劲动力">
    <meta name="renderer" content="webkit">  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>我的Fly - layui前端框架官方社区</title>
    <link rel="stylesheet" href="style/css/second.css">
    <link rel="stylesheet" href="style/css/global.css">
    <link rel="stylesheet" type="text/css" href="style/css/header.css"/>
</head>
<body>
  <header>
      <%@include file="page/header.jsp"%>
  </header>
  <div>
      <%@include file="page/direction.jsp"%>
  </div>
    <div>
        <%@include file="page/container.jsp"%>
    </div>
  <div>
      <%@include file="page/footer.jsp"%>
  </div>
</body>
</html>
