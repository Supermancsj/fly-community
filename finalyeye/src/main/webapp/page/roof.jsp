<%--
  Created by IntelliJ IDEA.
  User: keke6
  Date: 2019/8/23
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: keke6
  Date: 2019/8/22
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath %>"/>

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
<body >

<div class="fly-panel">
    <div class="fly-panel-title fly-filter"><a>置顶</a><a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
    </div>
    <ul class="fly-list">
        <c:forEach items="${list}" var="post">
           <li>  <a href="/u/6497232" class="fly-avatar">    <img src="/${post.head_img}" alt="岁月小偷">  </a>  <h2>
               <a class="layui-badge">${post.columnName}</a>
               <a href="reply/list?PostId=${post.id}">${post.title}</a>  </h2>
                    <div class="fly-list-info">
                        <a href="/u/6497232" link="">
                            <cite>${post.nikeName}</cite>
                            <i class="iconfont icon-renzheng" title="认证信息：2018-2019 年度 layui “社区之光”"></i>
                            <c:choose>
                                <c:when test="${post.grade}!=null">
                                    <i class="layui-badge fly-badge-vip">
                                            ${post.grade}</i>
                                </c:when>
                                <c:otherwise>
                                    <i class="">
                                    </i>
                                </c:otherwise>
                            </c:choose>

                            <%--<c:if test="${post.grade!=null}">--%>
                                <%--<i class="layui-badge fly-badge-vip">--%>
                                        <%--${post.grade}</i>--%>
                            <%--</c:if>--%>
                        </a>
                                    <span>${post.create_time}</span>
                                    <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻">
                                        <i class="iconfont icon-kiss"></i> ${post.kiss}</span>
                                            <span class="fly-list-nums">
                                                <i class="iconfont icon-pinglun1" title="回答"></i> ${post.reply_num}
                                                    </span>      </div>  <div class="fly-list-badge">
                                                    <c:if test="${post.is_fine==1}">
                                                        <span class="layui-badge layui-bg-red">精帖</span>
                                                    </c:if>
               </div>
           </li>
        </c:forEach>
            </ul>
</div>


</body>

</html>
<script>
    $.post('userpost/showroof');
</script>