layui.use(['element','form','layedit','jquery','laypage','layer'], function(){
    let element = layui.element,
        layedit = layui.layedit,
        laypage = layui.laypage,
        util = layui.util,
        form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;

    let PostId =$("#postid").val();

    console.log(PostId);
    let pageIndex = 1;
    let pageSize = 10;
    replyList(pageIndex,pageSize);

    function replyList(pageIndex,pageSize){
        $.get('reply/page',{PostId:PostId,pageIndex:pageIndex,pageSize:pageSize},function (res) {
            $("#replyList").empty();

            console.log(res.count);

            console.log(res.data);

            res.data.forEach(reply=>{
                let info = `            
                                          <li data-id="197808">
                                        <a name="item-1566900710529"></a>
                                        <div class="detail-about detail-about-reply">
                                            <a class="fly-avatar" href="/u/37553712/">
                                                <img src="${reply.head_Img}" alt="">
                                            </a>
                                            <div class="fly-detail-user">
                                                <a href="/u/37553712/" class="fly-link">
                                                    <cite>${reply.nick_Name}</cite>
                                                    <c:when test="${reply.grade}!=null">
                                                         <i class="layui-badge fly-badge-vip">${reply.grade}</i>
                                                       </c:when>
                                                </a>
                                            </div>
                                            <div class="detail-hits">
                                                <span>${reply.create_time}</span>
                                            </div>
                                        </div>
                                        <div class="detail-body layui-text jieda-body photos">
                                                ${reply.reply_context}
                                        </div>
                                        <div class="jieda-reply">
                                        
                                            <span class="jieda-zan " type="zan">
                                            
                                          <a  href="reply/dianzan?reply_id=${reply.id} "> 
                                          
                                            <i class="iconfont icon-zan" ></i>
                                            
                                            </a> 
                                            
                                                <em>${reply.praise_count}</em>
                                            </span>
                                            <span type="reply">
                                                <i class="iconfont icon-svgmoban53"></i> 回复
                                            </span>
                                        </div>
                                        
                                    </li>`;
                console.log(reply.id);

                $("#replyList").append(info);
                //分页实例
                laypage.render({
                    elem: 'note-page', //注意，这里的 note-page 是 ID，不用加 # 号
                    count: res.count, //数据总条数，从服务端得到
                    limit: pageSize,  //每页显示的条数
                    layout:['page'],
                    curr:pageIndex,
                    jump:function (obj,first) {
                        if(!first){
                            pageIndex = obj.curr;
                            replyList(pageIndex,pageSize);
                        }
                    }
                });
            });
        });
    }
    layedit.set({
        uploadImage: {
            url: '/upload/layedit' //接口url
            ,type: 'post'//默认post
        }
    });
    var index=layedit.build('demo',{
        tool: [
            'strong' //加粗
            ,'italic' //斜体
            ,'underline' //下划线
            ,'del' //删除线
            ,'|' //分割线
            ,'left' //左对齐
            ,'center' //居中对齐
            ,'right' //右对齐
            ,'link' //超链接
            ,'unlink' //清除链接
            ,'face' //表情
            ,'image' //插入图片
            ,'help' //帮助
        ]
    }); //建立编辑器
    //提交时把值同步到文本域中
    form.verify({
        //content富文本域中的lay-verify值
        content: function(value) {
            return layedit.sync(index);
        }
    });
    //监听提交
    form.on('submit(TJ)', function(data){
        data.field.content=layedit.getContent(index);
        let fromJson = data.field;
        console.log(data.field);
        //$.post(请求地址，请求参数，请求成功后返回的数据);
        $.post('reply/submitReply',fromJson,function(res){
                window.alert("发表成功");
            //JS跳转
                window.location.href="reply/list?PostId="+PostId;
        });
        return false;
    });
});