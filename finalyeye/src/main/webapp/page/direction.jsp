<%--
  Created by IntelliJ IDEA.
  User: keke6
  Date: 2019/8/22
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs  layui-this"><a href="index.jsp">首页</a></li>
            <li><a href="/column/showask">     提问   </a>        </li>
            <li><a href="/column/showshare">    分享   <span class="layui-badge-dot"></span>  </a>        </li>
            <li><a href="/column/showdiscuss">  讨论   </a>        </li>
            <li><a href="/column/showadvice">  建议   </a>        </li>
        </ul>    <div class="fly-column-right layui-hide-xs">    <span class="fly-search LAY_search"><i class="layui-icon"></i></span>    <a href="page/editor.jsp" class="layui-btn">发表新帖</a>    </div>    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">    <a href="page/editor.jsp" class="layui-btn">发表新帖</a>    </div>  </div></div>
</body>
</html>
