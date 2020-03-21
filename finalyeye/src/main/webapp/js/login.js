layui.use(['form','jquery','layer'], function(){
    let form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;

    //切换验证码
    $(".login-vimCode").click(function () {
        this.src = "verifyCodeImg?ran="+Math.random();
    });



    //监听提交
    form.on('submit(formDemo)', function(data){
        //layer.msg(JSON.stringify(data.field));
        //return false;
        let tel = $(".login-tel").val();
        if(tel.length === 0 || tel.length !== 11){
            //手机号不合法
            layer.msg('手机输入不合法', {icon: 5,anim: 6});
            return;
        }

        let pwd = $(".login-pwd").val();
        if(pwd.length === 0 || pwd.length<6){
            layer.msg('密码不能为空或少于六位', {icon: 5,anim: 6});
            return;
        }

        let fromJson = data.field;
        //let vimCode = $(".login-vrifyCode").val();
        $.get('user/login',fromJson,function(res){
            if(res.code === 1) {
                layer.msg(res.msg, {icon: 5, anim: 6});
                return;
            }
            window.location.href = "index.jsp";
            //window.location.href = "main.html";
            //$(_this).attr("class","layui-btn layui-btn-normal layui-btn-disabled");
        });

    });
});