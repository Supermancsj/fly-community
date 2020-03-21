package org.zdk.fly_community.web;
import com.google.gson.Gson;
import org.zdk.fly_community.dao.IPostDao;
import org.zdk.fly_community.dao.IUserDao;
import org.zdk.fly_community.dao.impl.PostDaoImpl;

import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.services.IPostService;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.services.IUserService;
import org.zdk.fly_community.services.impl.PostServiceImpl;
import org.zdk.fly_community.services.impl.UserServiceImpl;
import org.zdk.fly_community.util.Const;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/post/*")
public class PostServlet extends BaseServlet {

    private IPostService PS = new PostServiceImpl();
    private IUserService userService= new UserServiceImpl();
    public ResponseEntity postworkjs(){
       // int id=request.getParameter("");
        //String id = request.getParameter("id");
        //String column_id = request.getParameter("column_id");
        String kiss = request.getParameter("experience");
        String title = request.getParameter("title");
        String context = request.getParameter("context");
        String version= request.getParameter("version");
        String browser= request.getParameter("browser");
        String product= request.getParameter("project");
        String column_id= request.getParameter("class");
        int col=Integer.parseInt(column_id);
        int kiss01=Integer.parseInt(kiss);
        User u=(User)session.getAttribute("user");
        System.out.println(u.getKiss()+"hhhhhhhhhhhhhhhhhhhh");
        if(u.getKiss()>=kiss01)
        {
            int newkiss=u.getKiss()-kiss01;
            int id = u.getId();
            userService.setKiss(id,newkiss);
            Post post=new Post(u.getId(),col,title,context,kiss01,product,version,browser);
            System.out.println(product);
            System.out.println(browser);
            System.out.println(col);
            PS.PostWork(post);
            return ResponseEntity.ok("发表成功！！！！");
        }
        return ResponseEntity.fail("kiss值不足！！");
    }
    public ResponseEntity verifyImgCode(){
        String vimCode = request.getParameter("vimCode");
        String sessionVerifyCode = (String)session.getAttribute(Const.VERIFY_CODE);
        if(!vimCode.equalsIgnoreCase(sessionVerifyCode))
            return ResponseEntity.fail("验证码输入错误");
        return ResponseEntity.ok();
    }
    public void getPosts() throws IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        int limit =  Integer.parseInt(request.getParameter("limit"));

        ResponseEntity data = PS.showPost(page,limit);
        System.out.println(data);
        Gson gson = new Gson();
        String str=gson.toJson(data);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println(str);
        out.close();
    }

    public void status() throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int op = Integer.parseInt(request.getParameter("op"));
        PS.updateStatus(id,op);
        response.sendRedirect("/page/AdminPost.jsp");
    }

    public boolean del() throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PS.delById(id);
        response.sendRedirect("/page/AdminPost.jsp");
        return true;
    }
}
