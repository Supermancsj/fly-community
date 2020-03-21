package org.zdk.fly_community.web;

import com.aliyuncs.CommonResponse;
import com.google.gson.Gson;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.services.IPostService;
import org.zdk.fly_community.services.IUserService;
import org.zdk.fly_community.services.impl.PostServiceImpl;
import org.zdk.fly_community.services.impl.UserServiceImpl;
import org.zdk.fly_community.util.Const;
import org.zdk.fly_community.util.GsonUtil;
import org.zdk.fly_community.util.SendSmsUtil;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {

    private IUserService userService = new UserServiceImpl();
    private IPostService postService = new PostServiceImpl();

    public ResponseEntity verifyImgCode(){
        String vimCode = request.getParameter("vimCode");
        String sessionVerifyCode=(String)session.getAttribute(Const.VERIFY_CODE);
        if(!vimCode.equalsIgnoreCase(sessionVerifyCode)){
            return ResponseEntity.fail("验证码输入错误！");
        }
        return ResponseEntity.ok();
    }
    public ResponseEntity sendSms(){
        //短信发送
        String tel = request.getParameter("tel");
        String code = String.valueOf((int)((Math.random()+1)*1000)) ;
        CommonResponse response = SendSmsUtil.sendSms(tel,code);
        System.out.println("阿里云反馈信息： "+response.getData());
        session.setAttribute(Const.TEL_VERIFY_CODE,code);
        return ResponseEntity.ok("发送短信成功");
    }
    public ResponseEntity register() throws UnsupportedEncodingException {
            //判断短信验证码是否正确
        //tel,nick_name,pwd
        String tel = request.getParameter("tel");
        String nick_name = new String(request.getParameter("nickName").getBytes("iso-8859-1"), "utf-8");
        String pwd = request.getParameter("pwd");
        System.out.println(tel);
        System.out.println(nick_name);
        System.out.println(pwd);
        User r = new User();
        r.setTel(tel);
        r.setNikeName(nick_name);
        r.setPwd(pwd);
        String telCode = request.getParameter("telCode");
        String sessionTelVerifyCode=(String)session.getAttribute(Const.TEL_VERIFY_CODE);
        if(!telCode.equalsIgnoreCase(sessionTelVerifyCode)){
            return ResponseEntity.fail("手机短信码输入错误！");
        }
        boolean flg = userService.register(r);
        if(flg)
            return ResponseEntity.ok(r.getTel());
        else
            return ResponseEntity.fail("fail");
        //return ResponseEntity.ok();
    }

    public ResponseEntity login(){
        String tel = request.getParameter("login-tel");
        String pwd = request.getParameter("login-pwd");
        String nikeName = request.getParameter("login");
        String head_img = request.getParameter("login-head_img");
        User r = new User();
        r.setTel(tel);
        r.setPwd(pwd);

        session.setAttribute("user",r);
        String login_vimCode = request.getParameter("login-vimCode");
        String sessionVerifyCode = (String)session.getAttribute(Const.VERIFY_CODE);
        if(!login_vimCode.equalsIgnoreCase(sessionVerifyCode)){
            return ResponseEntity.fail("验证码输入错误");
        }
        boolean flg = userService.login(r);

        int x = postService.getPostSum(0);
        if (flg)
            //return ResponseEntity.ok();
            return ResponseEntity.fail("请核对手机或者密码是否正确");
        else
        {
            User a = userService.getname(r);
            System.out.println(a.getNikeName());
            session.setAttribute("user",a);
            return ResponseEntity.ok();
        }
        //查询贴子数



        //return ResponseEntity.ok();
    }

        //手机号是否注册过

        //插入
        public String list() {
            List<User> list = userService.list();
            session.setAttribute("list", list);
            return REDIRECT + "page/list";
        }


    //查询我的帖子


    public ResponseEntity unaudit() {
        //UserDaoImpl.login(10001,"123456");
        // User user = (User) session.getAttribute("user");
        // System.out.println(user.getPassword());
        List<Post> unaudit = userService.unaudit();
        for (int i = 0; i < unaudit.size(); i++) {

        }
        session.setAttribute("unaudit", unaudit);
        // User user = userService.login("1000");
        System.out.println(unaudit.size());
        return ResponseEntity.ok(unaudit);


    }

    public String pass() {
        String i = request.getParameter("curindex");
        int i1 = Integer.parseInt(i);
        System.out.println("iiiii"+i1);
        List<Post> unaudit = (List<Post>) session.getAttribute("unaudit");
        if(userService.pass(unaudit.get(i1).getId())!=false){
            unaudit.remove(i1);
            return REDIRECT + "page/mana-oper";
        }else{
            return null;
        }
    }
    public String loginout()
    {
        session.removeAttribute("user");
        return REDIRECT + "index";
    }

    public void getUsers() throws IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        int limit =  Integer.parseInt(request.getParameter("limit"));
        ResponseEntity data = userService.showAll(page,limit);
        String str= GsonUtil.toJson(data);
        System.out.println(str);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println(str);
        out.close();
    }

    public void setStatus() throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int set = Integer.parseInt(request.getParameter("set"));
        userService.setStatus(id,set);
        response.sendRedirect("/page/AdminUser.jsp");
    }
    //////////haha
    //查询我的帖子
    public ResponseEntity mypost() {
        //UserDaoImpl.login(10001,"123456");
        User user = (User) session.getAttribute("user");
        List<Post> mypost = userService.mypost(user);
        session.setAttribute("mypost", mypost);
        // User user = userService.login("1000");
        return ResponseEntity.ok(mypost);


    }

    public ResponseEntity mycollect() {
        //UserDaoImpl.login(10001,"123456");
        User user = (User) session.getAttribute("user");
        // System.out.println(user.getPassword());
        List<Post> mycollect = userService.mycollect(user);
        for (int i = 0; i < mycollect.size(); i++) {

            // LocalDateTime now =mycollect.get(i).getCreate_time().toLocalDateTime();
            Long timestamp = mycollect.get(i).getCreate_time().toInstant(ZoneOffset.of("+8")).toEpochMilli();
            System.out.println(LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8)));
            mycollect.get(i).setCreate_time(LocalDateTime.ofEpochSecond(timestamp / 1000, 0, ZoneOffset.ofHours(8)));

        }
        session.setAttribute("mycollect", mycollect);
        // User user = userService.login("1000");
        // System.out.println(user.getId() + " rrrr" + user.getNickName());
        return ResponseEntity.ok(mycollect);


    }



    public ResponseEntity changepass() {
        User user = (User) session.getAttribute("user");
        String nowpass = request.getParameter("nowpass");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String s=userService.changepass(nowpass,pass,repass,user);
        if(s.equals("suc")){
            return ResponseEntity.ok("修改成功");
        }else{
            return ResponseEntity.fail(s);
        }
    }

    public ResponseEntity data() {
        String name = request.getParameter("per-name");
        String city = request.getParameter("per-city");
        String sex = request.getParameter("per-sex");
        String tel = request.getParameter("per-tel");
        if(sex==null){
            //System.out.println("sexno");
            return ResponseEntity.fail("请选择性别");

        }
        else{
            /*System.out.println(name);
            System.out.println(city);
            System.out.println(sex);
            System.out.println(tel);*/
            User r = (User) session.getAttribute("user");
            r.setTel(tel);
            r.setNikeName(name);
            r.setCity(city);
            r.setSex(sex);
            //boolean flg = userService.getdata(r);
            boolean flg = userService.findByTel(r.getTel());
            /*System.out.println(r.getTel());
            System.out.println(r.getNikeName());
            System.out.println(r.getCity());
            System.out.println(r.getSex());
            System.out.println(flg);*/
            if (flg){
                return ResponseEntity.fail("请核对手机号");
            }
            else
            {
                boolean d = userService.getdata(r);
                System.out.println(d);
                return ResponseEntity.ok("更改成功");
            }
        }
        //return ResponseEntity.ok("失败");
    }


}
