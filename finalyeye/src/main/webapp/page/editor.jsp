<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2019/8/22
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath %>"/>
<html>

<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
    <%--<title>发表新帖 - Fly社区</title>--%>
    <%--<link rel="stylesheet" href="../style/css/font.css">--%>
    <%--<link rel="stylesheet" href="../style/css/mycss.css">--%>
    <%--<link rel="stylesheet" href="../style/css/global.css" charset="utf-8">--%>
    <%--<link rel="stylesheet" href="../commons/layui/css/layui.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="../commons/layui/css/modules/layer/default/layer.css"/>--%>
    <%--<script src="../commons/layui/layui.js"></script>--%>
    <%--<link rel="stylesheet" type="text/css" href="../style/css/header.css"/>--%>
    <%--</head>--%>
<body>
<div>
    <%@include file="header.jsp"%>
</div>
<div class="layui-container fly-marginTop">
    <div>
        <%@include file="header.jsp"%>
    </div>
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表新帖</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="" class="layui-form" method="">
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md3 "><label class="layui-form-label" id="zhuanlan" >所在专栏</label>
                                    <div class="layui-input-block ">
                                        <select lay-verify="required" id="sell" name="class" lay-filter="column">
                                            <option ></option>
                                            <option value="1" >提问</option>
                                            <option value="2">分享</option>
                                            <option value="3">讨论</option>
                                            <option value="4">建议</option>
                                        </select></div>
                                </div>
                                <div class="layui-col-md9"><label for="L_title" class="layui-form-label">标题</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="L_title" name="title" required lay-verify="required"
                                               autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-col-space15 layui-form-item layui-hide" id="LAY_quiz">
                                <div class="layui-col-md3"><label class="layui-form-label">所属产品</label>
                                    <div class="layui-input-block"><select name="project">
                                        <option></option>
                                        <option value="layui">layui</option>
                                        <option value="layuiAdmin">layuiAdmin</option>
                                        <option value="layim">layim</option>
                                        <option value="模板市场">模板市场</option>
                                        <option value="扩展组件">扩展组件</option>
                                    </select></div>
                                </div>

                                <div class="layui-col-md3"><label class="layui-form-label" for="L_version">版本</label>
                                    <div class="layui-input-block"><input type="text" id="L_version" value=""
                                                                          name="version" autocomplete="off"
                                                                          class="layui-input"></div>
                                </div>
                                <div class="layui-col-md6"><label class="layui-form-label" for="L_browser">浏览器</label>
                                    <div class="layui-input-block"><input type="text" id="L_browser" value=""
                                                                          name="browser" placeholder="浏览器名称及版本，如：IE 11"
                                                                          autocomplete="off" class="layui-input"></div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="L_content" name="context" placeholder="详细描述"
                                              class="layui-textarea fly-editor" style=" height: 260px;"></textarea></div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline"><label class="layui-form-label">悬赏</label>
                                    <div class="layui-input-inline" style="width: 190px;"><select name="experience">
                                        <option value="20">20飞吻</option>
                                        <option value="50">50飞吻</option>
                                        <option value="80">80飞吻</option>
                                        <option value="100">100飞吻</option>
                                        <option value="200">200飞吻</option>
                                        <option value="500">500飞吻</option>
                                    </select></div>
                                    <div class="layui-form-mid layui-word-aux"><span style="padding-right: 5px;">发表后无法更改飞吻</span>
                                        <a href="/jie/13435/"
                                           target="_blank" style="color: #FF5722;"><strong>（提升飞吻）</strong></a></div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">图形码</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="vimCode" required lay-verify="required" autocomplete="off" class="layui-input vifiyCode">
                                </div>
                                <div class="layui-form-mid layui-word-aux">
                                    <img src="../verifyCodeImg" class="vimCode" alt="验证码" />
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button type="button" class="layui-btn" lay-filter="L_submit" lay-submit>立即发布</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <%@include file="footer.jsp"%>
</div>
    <script src="../js/fly.js"></script>
</body>
</html>

