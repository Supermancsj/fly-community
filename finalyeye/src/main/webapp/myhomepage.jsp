<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/22
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body class="fly-full">
<%--${user}--%>
<%@ include file="page/header.jsp" %>
<div class="fly-home fly-panel" style="background-image: url();"> <img src="/${user.head_img}"
                                                                       alt="cat250">
    <h1> ${user.nikeName}<i>${user.sex}</i> </h1>
    <p class="fly-home-info"> <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">${user.kiss} 飞吻</span> <i
            class="iconfont icon-shijian"> <span>${user.createTime}加入</span></i><span></span> <i class="iconfont icon-chengshi"></i><span>来自${user.city}</span>
    </p>

    <p class="fly-home-sign">${user.signature==null?"这个人没有签名":user.signature}</p>
</div>
<%--<div class="layui-container">--%>
<%--<div class="layui-row layui-col-space15">--%>
<%--<div class="layui-col-md6 fly-home-jie">--%>
<%--<div class="fly-panel">--%>
<%--<h3 class="fly-panel-title">${user.nikeName}最近的提问</h3>--%>
<%--&lt;%&ndash;<%@ include file="home1.jsp" %>&ndash;%&gt;--%>
<%--<%@ include file="home1.jsp" %>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="layui-col-md6 fly-home-da">--%>
<%--<div class="fly-panel">--%>
<%--<h3 class="fly-panel-title">${user.nikeName}最近的回答</h3>--%>
<%--<ul class="home-jieda">--%>
<%--<div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%@ include file="page/footer.jsp" %>
</body>
</html>
