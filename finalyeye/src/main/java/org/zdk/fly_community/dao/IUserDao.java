package org.zdk.fly_community.dao;


import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;

import java.util.List;

public interface IUserDao {
    boolean register(User user);
    boolean findByTel(String tel);
    boolean login(User user);

    List<User> list();
   //获取我收藏的帖子
    // User login1(String logName, String logPwd);
    List<Post> unaudit();
    boolean pass(int unaudit);

    int getKiss(int id);
    boolean setKiss(int id, int kiss);
    List<User> showAll(int begin, int end);
    boolean setStatus(int id, int set);
    int getUserSum();
    User findById(int id);

    //////////////
    List<Post> mypost(User user);
    List<Post> mycollect(User user);//获取我收藏的帖子
    User getname(User user);
    boolean changepass(String pass, User user, String nowpass);
    boolean changetou(User user);
    boolean getdata(User user);
}
