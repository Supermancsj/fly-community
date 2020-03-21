<%--
  Created by IntelliJ IDEA.
  User: xyh
  Date: 2019/8/24
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../commons/layui/css/layui.css"/>
    <link rel="stylesheet" href="../style/css/admin.css" media="all">
    <link id="layuicss-layer" rel="stylesheet" href="../commons/layui/css/modules/layer/default/layer.css" media="all">
    <script src="../commons/layui/layui.js"></script>
    <script src="../js/jquery.js"></script>

    <script src="../js/test.js"></script>
    <style>
        .start{
            cursor: pointer;
        }
        .end{
            cursor: pointer;
            color: #00FFFF;
            background: #2F9688;
            border: none;
        }
    </style>
</head>
<body style="position: absolute;top: 80px;left:70px" >
<div class="comtable" >
    <div>
        <%@include file="header.jsp"%>
    </div>
    <table id="demoo" lay-filter="testdemo"></table>
    <script type="text/html" id="barDemo">
        <a class=" djsa layui-btn layui-btn-normal layui-btn-xs" style="" onclick="dja(this);" lay-event="top">置顶</a>
        <a class="layui-btn layui-btn-xs" lay-event="access">通过</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="del">删除</a>
    </script>
    <div>
        <%@include file="footer.jsp"%>
    </div>
</div>
    <script src="../js/agenda.js"></script>
</body>
</html>
