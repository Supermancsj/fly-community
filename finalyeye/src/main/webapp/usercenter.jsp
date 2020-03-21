<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/22
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户中心 - Fly社区</title>
</head>
<body>
<%@ include file="page/header.jsp" %>
<div class="layui-container fly-marginTop fly-user-main">
    <%@ include file="page/left.jsp" %>
    <div class="site-tree-mobile layui-hide"> <i class="layui-icon">&#xe602;</i></div>
    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20 style="padding-top:20px;">
        <%--<div class="fly-msg" style="margin-bottom: 20px;"> 您的邮箱尚未验证，这比较影响您的帐号安全，<a href="/user/activate/">立即去激活？</a> </div>--%>
        <div class="layui-row layui-col-space20">
            <div class="layui-col-md6">
                <div class="fly-panel fly-panel-border">
                    <div class="fly-panel-title"> 我的会员信息 </div>
                    <div class="fly-panel-main layui-text" style="padding: 18px 15px; height: 50px; line-height: 26px;">
                        <p> 您的财富经验值：<span style="padding-right: 20px; color: #FF5722;">￥${user.wealth}</span> 您当前为：${user.grade} </p>
                        <p> 您拥有社区飞吻：<span style="color: #FF7200; padding-right: 5px;">20 飞吻</span> </p>
                    </div>
                </div>
            </div>
            <div class="layui-col-md6">
                <div class="fly-panel fly-signin fly-panel-border">
                    <div class="fly-panel-title"> 签到 <i class="fly-mid"></i> <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
                        <i class="fly-mid"></i> <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
                        <span class="fly-signin-days"></span> </div>
                    <div class="fly-panel-main fly-signin-main"> <i class="layui-icon fly-loading">&#xe63d;</i> </div>
                </div>
            </div>
            <div class="layui-col-md12" style="margin-top: -20px;">
                <div class="fly-panel fly-panel-border">
                    <div class="fly-panel-title"> 快捷方式 </div>
                    <div class="fly-panel-main">
                        <ul class="layui-row layui-col-space10 fly-shortcut">
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/information.jsp"><i class="layui-icon">&#xe620;</i><cite>修改信息</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/touxiang.jsp"><i class="layui-icon">&#xe6af;</i><cite>修改头像</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/changepass.jsp"><i class="layui-icon">&#xe607;</i><cite>修改密码</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/set/#bind"><i class="layui-icon">&#xe770;</i><cite>帐号绑定</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/add/"><i class="layui-icon">&#xe61f;</i><cite>发表新帖</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/column/share/"><i class="layui-icon">&#xe705;</i><cite>查看分享</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4 LAY_search"> <a href="javascript:;"><i class="layui-icon">&#xe615;</i><cite>搜索资源</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/mypost.jsp"><i class="layui-icon">&#xe600;</i><cite>我的收藏</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/15697/"><i class="layui-icon">&#xe735;</i><cite>成为赞助商</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/2461/"><i class="layui-icon">&#xe63a;</i><cite>关注公众号</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="http://www.layui.com/doc/"><i class="layui-icon">&#xe63c;</i><cite>文档</cite></a>
                            </li>
                            <li class="layui-col-sm3 layui-col-xs4"> <a href="http://www.layui.com/demo/"><i class="layui-icon">&#xe656;</i><cite>示例</cite></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="page/footer.jsp" %>
</body>
</html>
