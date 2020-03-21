<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/8/22
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>

<style>
    .lm4{
        width:500px;
    }
    .lm3{
        width:200px;
    }
</style>

<body>
<div>
    <%@ include file="page/header.jsp" %>
</div>
<script>
    layui.use('jquery', function() {
        var $ = layui.jquery;
        $(document).ready(function () {

            if (location.href.indexOf("#reloaded") == -1) {
                location.href = location.href + "#reloaded";
                location.reload();
            }
        });
        $.post('../user/mypost', function(res) {
            console.log("ghghgh09")
        });
    });



</script>
<div class="layui-container fly-marginTop fly-user-main">
    <%@ include file="page/left.jsp" %>
    <div class="site-tree-mobile layui-hide">  <i class="layui-icon"></i></div>
    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20="">

        <div class="layui-container fly-marginTop fly-user-main">

            <%--<div class="fly-panel fly-panel-user" pad20="">--%>
            <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_uc">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li data-type="mine-jie" lay-id="mypost" class="">我发的帖</li>
                    <li data-type="collection" lay-id="mycollection" class="">我收藏的帖</li>
                    <!--<li data-type="collection" data-url="/collection/find/" lay-id="collection" class="layui-this">我收藏的帖</li>-->
                </ul>
                <!--table-->
                <div class="layui-tab-content" id="LAY_ucm" style="padding: 5px 0;">
                    <div class="layui-tab-item layui-show lm4" style="">
                        <table class="layui-hide" id="LAY_mySendCard"></table>
                        <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" lay-id="LAY_mySendCard" style=" ">
                            <div class="layui-table-box">
                                <div class="layui-table-header">
                                    <table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line">
                                        <%--<colgroup>--%>
                                        <%--<col width="150px">--%>
                                        <%--<col width="200px">--%>
                                        <%--<col width="150px">--%>
                                        <%--<col width="200px">--%>
                                        <%--<col width="150px">--%>
                                        <%--<col width="200px">--%>
                                        <%--<col>--%>
                                        <%--</colgroup>--%>
                                        <thead>
                                        <tr>
                                            <th data-field="title" data-key="1-0-0" data-minwidth="300" class="">
                                                <div class="layui-table-cell laytable-cell-1-0-0"><span>帖子标题</span></div>
                                            </th>
                                            <th data-field="status" data-key="1-0-1" class="">
                                                <div class="layui-table-cell laytable-cell-1-0-1" align="center"><span>状态</span></div>
                                            </th>
                                            <th data-field="status" data-key="1-0-2" class="">
                                                <div class="layui-table-cell laytable-cell-1-0-2" align="center"><span>结贴</span></div>
                                            </th>
                                            <th data-field="time" data-key="1-0-3" class="">
                                                <div class="layui-table-cell laytable-cell-1-0-3" align="center"><span>发表时间</span></div>
                                            </th>
                                            <th data-field="4" data-key="1-0-4" class=" layui-table-col-special">
                                                <div class="layui-table-cell laytable-cell-1-0-4"><span>数据</span></div>
                                            </th>
                                            <th  data-key="1-0-3" class="">

                                            </th>
                                            <th data-field="5" data-key="1-0-5" class=" layui-table-col-special">
                                                <div class="layui-table-cell laytable-cell-1-0-5"><span>操作</span></div>
                                            </th>
                                        </tr>
                                        </thead>
                                        <%--</table>--%>
                                </div>
                                <div class="layui-table-body layui-table-main">
                                    <%--<table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line">--%>
                                    <tbody>


                                    <%--${mypost}--%>
                                    <c:forEach items="${mypost}" var="mypost1">
                                        <tr>
                                            <th data-minwidth="300">${mypost1.title}</th>
                                            <th data-minwidth="300">${mypost1.status==1?"已审核":"未审核"}</th>
                                            <th data-minwidth="300">${mypost1.is_closed==1?"已结贴":"未结贴"}</th>
                                            <th data-minwidth="300">${mypost1.create_time}</th>
                                            <th data-minwidth="300"> ${mypost1.browse_num}阅${mypost1.reply_num}读</th>
                                            <th data-minwidth="300"> &nbsp;&nbsp;&nbsp;<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">编辑</a></th>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="layui-table-page layui-hide">
                                <div id="layui-table-page1"></div>
                            </div>
                            <style>
                                .laytable-cell-1-0-0 {}

                                .laytable-cell-1-0-1 {
                                    width: 100px;
                                }

                                .laytable-cell-1-0-2 {
                                    width: 100px;
                                }

                                .laytable-cell-1-0-3 {
                                    width: 120px;
                                }

                                .laytable-cell-1-0-4 {
                                    width: 150px;
                                }

                                .laytable-cell-1-0-5 {
                                    width: 100px;
                                }
                            </style>
                        </div>
                    </div>
                    <div class="layui-tab-item  lm3" style="">
                        <table class="layui-hide" id="LAY_myCollectioncard"></table>
                        <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-4" lay-id="LAY_myCollectioncard"
                             style=" ">
                            <div class="layui-table-box">
                                <div class="layui-table-header lm3">
                                    <table cellspacing="0" cellpadding="0" border="0" class="layui-table lm4" lay-skin="line">
                                        <thead>
                                        <tr>
                                            <th data-field="title" data-key="4-0-0" data-minwidth="300" class="">
                                                <div class="layui-table-cell laytable-cell-4-0-0"><span>帖子标题</span></div>
                                            </th>
                                            <th data-field="collection_timestamp" data-key="4-0-1" class="">
                                                <div class="layui-table-cell laytable-cell-4-0-1" align="center"><span>收藏时间</span></div>
                                            </th>
                                        </tr>
                                        </thead>
                                        <%--</table>--%>
                                        <%--</div>--%>

                                        <%--<div class="layui-table-body layui-table-main">--%>
                                        <%--<table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line">--%>
                                        <tbody>
                                        <%--//${mycollect}--%>
                                        <c:forEach items="${mycollect}" var="mycollect1">
                                            <tr>
                                                <th data-minwidth="300">${mycollect1.title}</th>
                                                <th data-minwidth="300">${mycollect1.create_time}</th>


                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--<div class="layui-none">无数据</div>-->

                                </div>
                            </div>
                            <div class="layui-table-page layui-hide">
                                <div id="layui-table-page4"></div>
                            </div>
                            <style>
                                .laytable-cell-4-0-0 {}

                                .laytable-cell-4-0-1 {
                                    width: 120px;
                                }
                            </style>
                        </div>
                    </div>
                </div>
                <!--table-->
            </div>
        </div>
    </div>

</div>


<div>
    <%@ include file="page/footer.jsp" %>
</div>

<script>

    layui.use(['element','jquery'], function(){
        var $ = layui.jquery;
        var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        element.on('tab(user)', function(data){
            // console.log(data.index)

            if(data.index == 0){
                console.log("ghghgssh")
                $(document).ready(function () {
                    // console.log(location.href.indexOf("#reloaded"));
                    if (location.href.indexOf("#reloaded1") == -1) {
                        console.log("11");

                        location.href = location.href + "#reloaded1";
                        location.reload();


                    }
                });

                $.post('../user/mypost', function(res) {
                    console.log("ghghgh")
                });
            } else if(data.index == 1){
                $(document).ready(function () {
                    console.log(location.href.indexOf("#reloaded2"));
                    if (location.href.indexOf("#reloaded2") == -1) {
                        console.log("22")
                        location.href = location.href + "#reloaded2";
                        location.reload();
                    }
                });
                // element.tabChange('user', 'mycollection');
                $.post('../user/mycollect', function(res) {
                    console.log("ghghgh1")
                });
            }
        });
    });
</script>



</body>
</html>
