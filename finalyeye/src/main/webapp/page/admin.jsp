<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2019/8/28
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>layuiAdmin pro - 通用后台管理模板系统（单页面专业版）</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../commons/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../style/css/admin1.css" media="all">
        <link rel="stylesheet" href="../style/css/admin.css" media="all">
        <%--<link id="layuicss-layer" rel="stylesheet" href="../commons/layui/css/modules/layer/default/layer.css" media="all">--%>
    </head>
<body layadmin-themealias="default" class="layui-layout-body" style="">
        <div>
            <%@include file="header.jsp"%>
        </div>

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">待办事务</div>
                <div class="layui-card-body">

                    <div class="layui-carousel layadmin-carousel layadmin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 280px;">
                        <div carousel-item="">
                            <ul class="layui-row layui-col-space10 layui-this">
                                <li class="layui-col-xs6">
                                    <a lay-href="" href="AdminRepost.jsp"  class="layadmin-backlog-body">
                                        <h3>待审评论</h3>
                                        <p><cite>66</cite></p>
                                    </a>
                                </li>

                                <li class="layui-col-xs6">
                                    <a lay-href="app/forum/list" href="AdminPost.jsp" class="layadmin-backlog-body">
                                        <h3>待审帖子</h3>
                                        <p><cite>12</cite></p>
                                    </a>
                                </li>

                                <li class="layui-col-xs6">
                                    <a lay-href="template/goodslist" href="AdminUser.jsp" class="layadmin-backlog-body">
                                        <h3>用户管理</h3>
                                        <p><cite>99</cite></p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <%@include file="footer.jsp"%>
            </div>
        </div>
    </body>
</html>
