package org.zdk.fly_community.services;


import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;
import org.zdk.fly_community.entity.vo.ResponseEntity;

import java.util.List;

public interface IUserService {
    boolean register(User user);
    boolean login(User user);

    List<User> list();

    List<Post> unaudit();
    boolean pass(int unaudit);

    int getKiss(int id);
    boolean setKiss(int id, int kiss);
    User findByID(int id);

    ResponseEntity showAll(int page, int limit);
    boolean setStatus(int id, int set);
    /////////////
    /////////////
    List<Post> mypost(User user);
    List<Post> mycollect(User user);
    User getname(User user);
    String  changepass(String nowpass, String pass, String repass, User user);
    boolean changetou(User user);
    boolean getdata(User user);
    boolean findByTel(String tel);
}
