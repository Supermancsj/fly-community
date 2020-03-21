package org.zdk.fly_community.web;


import lombok.extern.slf4j.Slf4j;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.services.IUserService;
import org.zdk.fly_community.services.impl.UserServiceImpl;
import org.zdk.fly_community.util.FileUploadUtil;

import javax.servlet.annotation.WebServlet;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@WebServlet("/upload/*")
public class FileUploadServlet extends BaseServlet{
    public ResponseEntity layedit(){
        return FileUploadUtil.fileUpload(request);
    }
    public ResponseEntity sendPost(){
        return FileUploadUtil.postfileUpload(request);
    }
    public ResponseEntity changetou() {
        User user = (User) session.getAttribute("user");
        String saveFileName=FileUploadUtil.changetou(request);

        if(saveFileName.equals("large")){
            String data1="";
            data1="图片太大了，请重新上传";
            ResponseEntity.fail(data1);
        }
        user.setHead_img(saveFileName);
        IUserService userService = new UserServiceImpl();
        userService.changetou(user);
        Map<String,String> data = new HashMap<>();
        data.put("src","images/"+saveFileName);
        System.out.println(saveFileName);
        data.put("title",saveFileName);
        return ResponseEntity.ok(data);

    }
}

