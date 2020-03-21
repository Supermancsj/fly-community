<%--
  Created by IntelliJ IDEA.
  User: xyh
  Date: 2019/8/26
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body style="position: absolute;top: 80px;left: 70px">

<div><%@include file="header.jsp"%></div>
<div class="comtable" >
            <table id="demos" lay-filter="mangerdemo"></table>
            <script type="text/html" id="barDemos">
                <a class="layui-btn  layui-btn-xs" lay-event="yuse">启用</a>
                <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="nuse">禁用</a>
            </script>
        </div>
        <div>
            <%@include file="footer.jsp"%>
        </div>
        <script src="../js/agenda.js"></script>
    </body>
</html>
