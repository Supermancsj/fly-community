layui.use(['layedit','form','jquery','layer'], function(){
  let $ = layui.jquery;
  let layedit = layui.layedit;
  let form = layui.form;
  let index;
  let layer=layui.layer;

  layedit.set({
    uploadImage: {
      url: '/upload/sendPost' //接口url
      ,type: 'get'//默认post
    }
  })
  index = layedit.build('L_content',{
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


  form.on('select(column)', function(data){
    $('#LAY_quiz').addClass('layui-hide');
    if(data.value==1){
      $('#LAY_quiz').removeClass('layui-hide');

    }
    console.log(data.value);
  });

  form.on('submit(L_submit)',function (data) {
    let vimCode = $(".vifiyCode").val();
    if(vimCode.length === 0){
      layer.msg('验证码必须输入', {icon: 5,anim: 6});
      return;
    }

    $.get('../post/verifyImgCode',{vimCode:vimCode},function(res){
      if(res.code === 1){
        layer.msg(res.msg, {icon: 5,anim: 6});
        return false;
      }
        let context = layedit.getContent(index);
        data.field.context = context;
        //window.location.href="/post/postworkjs?data="+JSON.stringify(data.field);
        let fromJson = data.field;
        $.post('../post/postworkjs', fromJson, function (res) {
            console.log(data);
          //  layer.msg(JSON.stringify(res.msg));
            window.alert(res.msg);
            window.location.href ="../index.jsp";

        });
    });
    return false;
  });

  $(".vimCode").click(function () {
    this.src = "../verifyCodeImg?ran="+Math.random();
  });
    return false;
});
