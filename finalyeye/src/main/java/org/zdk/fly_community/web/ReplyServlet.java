package org.zdk.fly_community.web;


import com.google.gson.Gson;
import org.zdk.fly_community.entity.Reply;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.entity.vo.PostUserEntity;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.entity.vo.UserReplyEntity;
import org.zdk.fly_community.services.IPostService;
import org.zdk.fly_community.services.IReplyService;
import org.zdk.fly_community.services.impl.PostServiceImpl;
import org.zdk.fly_community.services.impl.ReplyServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/reply/*")
public class ReplyServlet extends BaseServlet {

    private IReplyService replyService = new ReplyServiceImpl();
    private IPostService postService = new PostServiceImpl();
    //查询所有
    public String list() {
        int i=0; String PostId=null;
        if(i==0)
        {
             PostId = request.getParameter("PostId");
            i++;
        }
        else {
            PostId = (String) session.getAttribute("PostId");
        }
       List<PostUserEntity> list_Post = postService.list(Integer.parseInt(PostId));
       session.setAttribute("list_Post", list_Post);
        session.setAttribute("PostId",PostId);
        return REDIRECT + "page/lookPost1";
    }

    //评论内容
    public ResponseEntity page(){
        String postId = request.getParameter("PostId");
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        System.out.println(pageIndex);
        System.out.println(pageSize);
        return replyService.list(postId,pageIndex,pageSize);
    }
    public String dianzan() {
        String PostId = (String) session.getAttribute("PostId");
        String reply_id = request.getParameter("reply_id");
        boolean a=replyService.dianzanReply(Integer.parseInt(reply_id));
        return REDIRECT + "page/lookPost1";
    }

    //提交回复
    public ResponseEntity submitReply() {
        User u=(User)session.getAttribute("user");
        int logId=u.getId();
        String replyText = request.getParameter("content");
        String PostId =(String)session.getAttribute("PostId");
        Reply r=new Reply();
        r.setPost_id(Integer.parseInt(PostId));
        r.setReply_context(replyText);
        r.setUser_id(logId);
        session.setAttribute("PostId",PostId);
        boolean flg=replyService.sendReply(r);
        if(flg)
            return ResponseEntity.ok(r.getPost_id());
        else
            return ResponseEntity.fail("fail");
    }
    public boolean del() throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        replyService.deleteReply(id);
        response.sendRedirect("/page/AdminRepost.jsp");
        return true;
    }

    public void reply_status() throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        replyService.updateStatus(id);
        response.sendRedirect("/page/AdminRepost.jsp");
    }

    public void getReplys() throws IOException {
        ResponseEntity data = replyService.list();
        System.out.println(data);
        Gson gson = new Gson();
        String str=gson.toJson(data);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println(str);
        out.close();
    }


}
