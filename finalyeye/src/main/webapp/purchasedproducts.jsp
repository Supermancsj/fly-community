<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/22
  Time: 13:51
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
    <div class="site-tree-mobile layui-hide"> <i class="layui-icon"></i></div>
    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20="">
        <div class="layui-tab layui-tab-brief" lay-filter="user" overflow="">
            <ul class="layui-tab-title">
                <li lay-id="" class="layui-this">我发布的组件</li> <span class="layui-unselect layui-tab-bar" lay-stope="tabmore"><i
                    lay-stope="tabmore" class="layui-icon"></i></span>
            </ul>
            <div class="layui-tab-content" id="LAY_ucm" style="padding: 5px 0;">
                <div class="layui-tab-item layui-show">
                    <table class="layui-hide" id="LAY_mySendExtend"></table>
                    <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-3" lay-id="LAY_mySendExtend"
                         style=" ">
                        <div class="layui-table-box">
                            <div class="layui-table-header">
                                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                                    <thead>
                                    <tr>
                                        <th data-field="title" data-key="3-0-0" data-minwidth="200" class="">
                                            <div class="layui-table-cell laytable-cell-3-0-0"><span>组件</span></div>
                                        </th>
                                        <th data-field="alias" data-key="3-0-1" class="">
                                            <div class="layui-table-cell laytable-cell-3-0-1" align="center"><span>组件模块名</span></div>
                                        </th>
                                        <th data-field="status" data-key="3-0-2" class="">
                                            <div class="layui-table-cell laytable-cell-3-0-2" align="center"><span>状态</span></div>
                                        </th>
                                        <th data-field="create_time" data-key="3-0-3" class="">
                                            <div class="layui-table-cell laytable-cell-3-0-3" align="center"><span>发布时间</span></div>
                                        </th>
                                        <th data-field="4" data-key="3-0-4" class=" layui-table-col-special">
                                            <div class="layui-table-cell laytable-cell-3-0-4" align="center"><span>操作</span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="layui-table-body layui-table-main">
                                <table cellspacing="0" cellpadding="0" border="0" class="layui-table">
                                    <tbody></tbody>
                                </table>
                                <div class="layui-none">您还没有贡献过组件（<a href="/extend/" target="_blank" class="fly-link">前往发布</a>）</div>
                            </div>
                        </div>
                        <div class="layui-table-page layui-hide">
                            <div id="layui-table-page3"></div>
                        </div>
                        <style>
                            .laytable-cell-3-0-0 {}

                            .laytable-cell-3-0-1 {
                                width: 120px;
                            }

                            .laytable-cell-3-0-2 {
                                width: 100px;
                            }

                            .laytable-cell-3-0-3 {
                                width: 120px;
                            }

                            .laytable-cell-3-0-4 {
                                width: 100px;
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="page/footer.jsp" %>
</body>
</html>
