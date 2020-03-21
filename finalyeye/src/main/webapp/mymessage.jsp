<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/22
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="page/header.jsp" %>
<div class="layui-container fly-marginTop fly-user-main">
    <%@ include file="page/left.jsp" %>
    <div class="site-tree-mobile layui-hide"> <i class="layui-icon">&#xe602;</i></div>
    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;"> <button class="layui-btn layui-btn-danger layui-hide"
                                                                                                                 id="LAY_delallmsg">清空全部消息</button>
            <div id="LAY_minemsg" style="margin-top: 10px;"> <div class="fly-none">您暂时没有最新消息</div>
        </div>
    </div>
</div>
        <%@ include file="page/footer.jsp" %>
</body>
</html>
