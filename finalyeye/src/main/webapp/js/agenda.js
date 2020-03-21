layui.use('element', function(){
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

    //监听导航点击
    element.on('nav(demos)', function(elem){
        layer.msg(elem.text());
    });
});
layui.use('table',function(){
    var table = layui.table;
    //第一个实例
    table.render({
        elem: '#demoo'
        ,width: 1200
        ,height: 550
        ,url: '/post/getPosts' //数据接口
        ,toolbar: 'default'
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'id', title: 'ID', width:150, sort: true, fixed: 'left'}
            ,{field: 'nikeName', title:'发帖人', width:180}
            ,{field:'context', title: '发帖内容', width:350}
            ,{field: 'createTime', title: '发帖时间', width: 200, sort: true}
            ,{field: 'isTop', title: '置顶', width: 100}
            ,{fixed: 'right', width: 210, align:'center', toolbar: '#barDemo'}
        ]]
    });
    table.render({
        elem: '#demo'
        ,width:900
        ,height: 550
        ,url: '/reply/getReplys' //数据接口
        ,toolbar: 'default'
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'id', title: 'ID', width:125, sort: true, fixed: 'left'}
            ,{field: 'nikeName', title: '评论者', width:200}
            ,{field: 'replyContext', title: '评论内容', width:200}
            ,{field: 'createTime', title: '评论时间', width: 200, sort: true}
            ,{fixed: 'right', width: 150, align:'center', toolbar: '#barDemoa'}
        ]]
    });
    table.render({
        elem: '#demos'
        ,width: 1360
        ,height: 550
        ,url: '/user/getUsers' //数据接口
        ,toolbar: 'default'
        ,page: true
        ,cols: [[ //表头
            {field: 'id', title: 'ID', width:100, sort: true, fixed: 'left'}
            ,{field: 'nikeName', title:'用户名称', width:100}
            ,{field:'sex', title: '性别', width:100}
            ,{field: 'email', title: '邮箱', width: 200}
            ,{field: 'tel', title: '电话', width: 150}
            ,{field: 'city', title: '地址', width: 100}
            ,{field: 'wealth', title: '财富', width: 100}
            ,{field: 'kiss', title: '飞吻', width: 100}
            ,{field: 'createTime', title: '注册时间', width: 150}
            ,{field: 'user_status', title: '状态', width: 100}
            ,{fixed: 'right', width: 150, align:'center', toolbar: '#barDemos'}
        ]]
    });

});
layui.use('form', function(){
    var form = layui.form;

    //监听提交
    form.on('submit(formDemo)', function(data){
        layer.msg(JSON.stringify(data.field));
        return false;
    });
});
layui.use(['table','jquery'], function(){
    var table = layui.table;
    let $=layui.jquery;
    //监听工具条
    table.on('tool(testdemo)', function(obj){
        let data = obj.data;
        if(obj.event === 'top'){
            layer.msg('ID：'+ data.id + ' 的置顶操作');
            window.location.href="/post/status?id=" + data.id + "&op=1";
        }
        else if(obj.event === 'access'){
            layer.msg('ID：'+ data.id + ' 的通过操作');
            window.location.href="/post/status?id=" + data.id + "&op=2";
        }else if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
              //  obj.del();
                //layer.close(index);
                window.location.href="/post/del?id=" + data.id;
            });
        }


    });


    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});

layui.use('table', function(){
    var table = layui.table;
    table.on('tool(mangerdemo)', function(obj1){
        let data = obj1.data;
        if(obj1.event === 'yuse'){
            layer.msg('ID：'+ data.id + ' 的启用操作');
            window.location.href="/user/setStatus?id=" + data.id + "&set=0";
        }
        else if(obj1.event === 'nuse'){
            layer.msg('ID：'+ data.id + ' 的禁用操作');
             window.location.href="/user/setStatus?id=" + data.id + "&set=1";
        }
    });
});
layui.use('table', function(){
    var table = layui.table;
    table.on('tool(commentdemo)', function(obj2){
        let data = obj2.data;
        if(obj2.event === 'dell'){
            layer.msg('ID：'+ data.id + ' 的删除操作');
            window.location.href="/reply/del?id=" + data.id;
        }else if (obj2.event === 'accross') {
            layer.msg('ID：'+ data.id + ' 的通过操作');
           window.location.href="/reply/reply_status?id=" + data.id;
        }

    });
});

