layui.use(['element', 'carousel','laypage','util','jquery','layer'], function(){
    let element = layui.element,
        carousel = layui.carousel,
        laypage = layui.laypage,
        util = layui.util,
        $ = layui.jquery,
        layer = layui.layer;
    //发送一个请求获取第一个的数据  pageIndex  pageSize
    var global;
    getPostInfo();
    function getUrlVars() {
        var vars = [],
            hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            hash = hashes[0].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        console.log(hash[1]);
        if(hash[1]==null) {
            return "showall";
        }
        else{return hash[1];}

    }
    function getPostInfo(pageIndex = 1,pageSize = 4){

        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        // $.get('column/getwant',function(res) {
        //     layer.msg(JSON.stringify(res));
        //     global = res.msg.toString();
        //     console.log(global);
        // } );
        //console.log(global);
        var global=null;
        global=getUrlVars();
        if (global==null) {
            global="showall "
        }
        $.get('/column/'+global,{pageIndex:pageIndex,pageSize:pageSize},function(res){
            $("#postList").empty();
            console.log(res);
            res.data.forEach(item=>{
                let li = ` <li>  <a href="" class="fly-avatar">
        <img src="/${item.head_img}" alt="${item.nikeName}">  </a>  <h2>
        <a class="layui-badge">${item.columnName}</a>
            <a href="reply/list?PostId=${item.id}">${item.title}</a>
       </h2>
        <div class="fly-list-info">
            <a href="/u/37219560" link=""><cite>${item.nikeName}</cite></a>
            <span>${item.create_time}</span>
            <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> ${item.kiss}</span>
            <span class="fly-list-nums">       <i class="iconfont icon-pinglun1" title="回答"></i> ${item.reply_num}    </span>
        </div>
        <div class="fly-list-badge ${item.is_fine==1?"":"layui-hide"}">   
            <span class="layui-badge layui-bg-red">精帖</span>
        </div>
    </li>`;
                $("#postList").append(li);
            });
            //执行一个laypage实例
            laypage.render({
                elem: 'pageInfo' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: res.count //数据总数，从服务端得到
                ,limit: pageSize
                ,curr: pageIndex
                ,jump: function(obj, first){
                    //首次不执行
                    if(!first){
                        //do something
                        getPostInfo(obj.curr,pageSize);
                    }
                }
            });

        });

    }


});