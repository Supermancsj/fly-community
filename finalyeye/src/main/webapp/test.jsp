<%-- User: CDHONG.IT Date: 2019/8/27  --%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath %>"/>
    <link rel="stylesheet" type="text/css" href="commons/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="commons/layui/css/modules/layer/default/layer.css"/>
    <script type="text/javascript" src="commons/layui/layui.js"></script>
    <script type="text/javascript" src="commons/jquery-1.8.3.min.js"></script>
    <meta charset="utf-8">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是跨设备模块化前端框架layui的官网社区，致力于为web开发提供强劲动力">
    <meta name="renderer" content="webkit">  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="style/css/second.css">
    <link rel="stylesheet" href="style/css/global.css">
    <link rel="stylesheet" type="text/css" href="style/css/header.css"/>
</head>
<body>
<section>
    <div id="context">
        <div class="top-note">
            <div class="fly-panel-style">
                <div class="fly-panel-title">置顶</div>
                <div class="fly-note-list">
                    <ul id="postList"></ul>
                </div>
            </div>
        </div>
    </div>
    <div id="pageInfo"></div>
</section>
<script src="js/page.js"></script>
</body>
</html>
