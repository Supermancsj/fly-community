package org.zdk.fly_community.web;

import org.zdk.fly_community.entity.vo.Userpost;
import org.zdk.fly_community.services.IUserPostService;
import org.zdk.fly_community.services.impl.UserPostServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/userpost/*")
public class UserPostServlet extends BaseServlet{
    private IUserPostService postService= new UserPostServiceImpl();

    public String showroof(){
        List <Userpost> roof=postService.getu_pinfor_roof();
        session.setAttribute("list",roof);
        return null;
    }
}
