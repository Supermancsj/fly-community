$(function(){
    $('#changeToSet').on('click',function(){
        $(window.parent.document).find('#contentIframe').attr('src','/xyh_page/AdminRepost.jsp')
        $(this).addClass('layui-this').siblings().removeClass('layui-this');
    })
})
$(function(){
    $('#changeToTest1').on('click',function(){
        $(window.parent.document).find('#contentIframe').attr('src','/xyh_page/AdminPost.jsp')
    })
})
$(function(){
    $('#changeToTest2').on('click',function(){
        $(window.parent.document).find('#contentIframe').attr('src','/xyh_page/AdminUser.jsp')
    })
})
$(function(){
    $('#changeToOut').on('click',function(){
        $(window.parent.document).find('#contentIframe').attr('src','/xyh_page/AdminRepost.jsp')
        $(this).addClass('layui-this').siblings().removeClass('layui-this');
    })
})
function dja(dom) {
        var collection=$(".djsa");
        $.each(collection,function () {
            $(this).removeClass("end");
            $(this).addClass("start");
        });
        $(dom).removeClass("start");
        $(dom).addClass("end");
}

