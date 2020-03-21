package org.zdk.fly_community.web;

import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.entity.vo.Userpost;
import org.zdk.fly_community.services.IUserPostService;
import org.zdk.fly_community.services.impl.UserPostServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/column/*")
public class ColumnServlet extends BaseServlet {

    private IUserPostService postService= new UserPostServiceImpl();
    public ResponseEntity showall() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List<Userpost>allcolumn = postService.getu_pinfor_all(pageIndex,pageSize);
        session.setAttribute("column",allcolumn);
        int count=postService.count();
        return ResponseEntity.page(count,allcolumn);
    }
    //需要传递的index和size回复
   public ResponseEntity showtop() throws IOException {
       Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
       Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_top(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showunsolved() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_unclosed(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showsolved() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_closed(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showask() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_ask(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showshare() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_share(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showdiscuss() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_discuss(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity showadvice() throws IOException {
        Integer pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));
        List <Userpost> topcolumn = postService.getu_pinfor_advice(pageIndex,pageSize);
        session.setAttribute("column",topcolumn);
        int count= postService.count();
        System.out.println(count);
        return ResponseEntity.page(count,topcolumn);
    }
    public ResponseEntity getwant()
    {
        int m;
        String id=null;
        Object obj=request.getParameter("flag");
        if(obj!=null)
        {
            id=(String)obj;
            m=Integer.parseInt(request.getParameter("flag"));
            switch (m) {
                case 1: id="index";break;
                case 2: id="showunsolved";break;
                case 3: id="showsolved";break;
                case 4: id="showtop";break;
            }
        }
        else
        {
            id="showall";
        }
        return ResponseEntity.ok(id);
  }
}
