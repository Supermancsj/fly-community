<%@ page import="org.zdk.fly_community.entity.vo.UserReplyEntity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/22 0022
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath %>"/>
<html>
<head>
    <title>回帖子页面</title>
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
<body>
<%--头--%>
<%--显示帖子+回帖子--%>
<div>
    <%@include file="header.jsp"%>
</div>
<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <%--显示帖子--%>
            <div class="fly-panel detail-box">
                <div>
                    <c:choose>
                        <c:when test="${empty list_Post}">
                            <p class="fly-none">帖子丢了</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list_Post}" var="p">
                                    <h1>${p.title}</h1><%--标题--%>
                                        <%--人气等--%>
                                    <div class="fly-detail-info">
                                        <c:choose>
                                            <c:when test="${p.column_id==1}">
                                                <span class="layui-badge layui-bg-green fly-detail-column"> 提问 </span>
                                            </c:when>
                                            <c:when test="${p.column_id==2}">
                                                <span class="layui-badge layui-bg-green fly-detail-column"> 分享 </span>
                                            </c:when>
                                            <c:when test="${p.column_id==3}">
                                                <span class="layui-badge layui-bg-green fly-detail-column"> 讨论 </span>
                                            </c:when>
                                            <c:when test="${p.column_id==4}">
                                                <span class="layui-badge layui-bg-green fly-detail-column"> 建议 </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="layui-badge layui-bg-green fly-detail-column"> 其他帖子 </span>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${p.is_close==0}">
                                                <span class="layui-badge" style="background-color: #999;">未结</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="layui-badge" style="background-color: #999;">已结</span>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${p.is_top==1}">
                                                <span class="layui-badge layui-bg-black">置顶</span>
                                            </c:when>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${p.is_fine==1}">
                                                <span class="layui-badge layui-bg-red">精帖</span>
                                            </c:when>
                                        </c:choose>
                                        <span class="fly-list-nums">
                                            <a href="#comment">
                                                <i class="iconfont" title="回答">&#xe60c;</i> ${p.reply_num}
                                            </a>
                                            <i class="iconfont" title="人气">&#xe60b;</i> ${p.browse_num}
                                        </span>
                                    </div>
                                        <%--昵称等--%>
                                    <div class="detail-about">
                                        <a class="fly-avatar" href="/u/45473568/">
                                            <img src="${p.head_Img}" alt="${p.nick_Name}">
                                        </a>
                                        <div class="fly-detail-user">
                                            <a href="/u/45473568/" class="fly-link">
                                                <cite>${p.nick_Name}</cite>
                                                <c:choose>
                                                    <c:when test="${p.grade!=null}">
                                                        <i class="layui-badge fly-badge-vip">VIP${p.grade}</i>
                                                    </c:when>
                                                </c:choose>
                                            </a>
                                            <span>${p.create_time}</span>
                                        </div>
                                        <div class="detail-hits">
                                            <span style="padding-right: 10px; color: #FF7200">悬赏：${p.kiss}飞吻</span>
                                        </div>
                                    </div>
                                        <%--主体--%>
                                    <div class="detail-body layui-text photos">
                                        <table class="layui-table">
                                            <tbody>
                                            <tr>  <%--<td>版本：扩展组件 最新版</td>
                                                     <td>浏览器：谷歌</td>--%>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <p>${p.context}</p>
                                    </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <%--回帖部分--%>
            <div class="fly-panel detail-box" id="flyReply">

                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>
                <%--显示当前postID下的评论--%>
                <%--
                <div>
                    <c:choose>
                        <c:when test="${empty list2}">
                            <ul class="jieda" id="jieda">
                                <li class="fly-none">消灭零回复</li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list2}" var="UserReplyEntity">
                                <ul class="jieda" id="jieda">
                                    <li data-id="197808">
                                        <a name="item-1566900710529"></a>
                                        <div class="detail-about detail-about-reply">
                                            <a class="fly-avatar" href="/u/37553712/">
                                                <img src="${UserReplyEntity.head_Img}" alt="${UserReplyEntity.nick_Name}">
                                            </a>
                                            <div class="fly-detail-user">
                                                <a href="/u/37553712/" class="fly-link">
                                                    <cite>${UserReplyEntity.nick_Name}</cite>
                                                </a>
                                            </div>
                                            <div class="detail-hits">
                                                <span>${UserReplyEntity.create_time}</span>
                                            </div>
                                        </div>
                                        <div class="detail-body layui-text jieda-body photos">
                                                ${UserReplyEntity.reply_context}
                                        </div>
                                        <div class="jieda-reply">
                                            <span class="jieda-zan " type="zan">
                                                <i class="iconfont icon-zan"></i>
                                                <em>${UserReplyEntity.praise_count}</em>
                                            </span>
                                            <span type="reply">
                                                <i class="iconfont icon-svgmoban53"></i> 回复
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                --%>
                <%--帖子回复列表--%>
                <div>
                    <ul  class = "jieda" id="replyList"></ul>
                </div>

                <%--分页--%>
                <div id="note-page" style="text-align: center;"></div>


                <form action=" " method = " "  class="layui-form">
                <%--输入当前的用户ID--%>
                <div class="layui-input-inline">
                    <input type="hidden" id="postid" value="${PostId}">
                </div>
                <%--上面是显示回复，下面是富文本编辑器--%>
                <div style="text-align: center"></div>
                <a name="comment"> </a>
                <div class="layui-form layui-form-pane">
                    <div class="layui-form-item layui-form-text">
                        <div class="layui-input-block">
                            <textarea id="demo" name="replyText" required lay-verify="content"placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 150px;"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button type="button" class="layui-btn" lay-submit lay-filter="TJ" onclick="">提交回复</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../js/lookPost.js"></script>
</body>
</html>

