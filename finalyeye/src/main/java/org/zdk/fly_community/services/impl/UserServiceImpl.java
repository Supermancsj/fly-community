package org.zdk.fly_community.services.impl;


import org.zdk.fly_community.dao.IUserDao;
import org.zdk.fly_community.dao.impl.UserDaoImpl;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.services.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
      private IUserDao iuserdao = new UserDaoImpl();
    @Override
    public List<User> list() {
        return iuserdao.list();
    }
    public boolean register(User user) {
        return iuserdao.register(user);
    }
    public boolean login(User user) { return iuserdao.login(user); }

    public List<Post> unaudit(){
        return iuserdao.unaudit();
    }
    public boolean pass(int unaudit){ return iuserdao.pass(unaudit); }

    public int getKiss(int id) {
        return iuserdao.getKiss(id);
    }


    public boolean setKiss(int id, int kiss) {
        return iuserdao.setKiss(id,kiss);
    }


    public User findByID(int id) { return iuserdao.findById(id); }


    public ResponseEntity showAll(int page, int limit) {
        List<User> data = iuserdao.showAll((page-1)*limit,page*limit);
        int sum = iuserdao.getUserSum();
        return ResponseEntity.page(sum,data);
    }


    public boolean setStatus(int id, int set) {
        return iuserdao.setStatus(id,set);
    }
    //////////haha
    public User getname(User user) {return iuserdao.getname(user); }
    public List<Post> mypost(User user){
        return iuserdao.mypost(user);
    }
    public List<Post> mycollect(User user){
        return iuserdao.mycollect(user);
    }


    public boolean changetou(User user){
        return iuserdao.changetou(user);
    }
    public String  changepass(String nowpass,String pass,String repass,User user){
        if(pass.equals(repass)&&(pass.length()<6||pass.length()>16)){
            return "长度必须在6到16位之间";
        }
        if(!pass.equals(repass)){
            return "新密码与确认密码不相等";
        }
        if(iuserdao.changepass(pass,user,nowpass)!=false){
            return "suc";
        }
        if(iuserdao.changepass(pass,user,nowpass)==false) {
            return "原密码输入错误";
        }
        return "fail";
    }
    public boolean getdata(User user){ return iuserdao.getdata(user); }
    public boolean findByTel(String tel){ return iuserdao.findByTel(tel);}


}

