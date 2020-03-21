package org.zdk.fly_community.dao.impl;



import com.fasterxml.jackson.annotation.JsonFormat;
import org.zdk.fly_community.dao.IUserDao;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.User;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

public class UserDaoImpl extends BaseDao implements IUserDao {
    public boolean register(User user){
        String sql = "insert into tbl_user(tel,nick_name,password) values(?,?,?)";
        return this.update(sql,user.getTel(),user.getNikeName(),user.getPwd());
    }


    public boolean findByTel(String tel){
        String sql = "select tel from tbl_user where tel=? ";
        User user = this.findOne(sql,User.class,tel);
        return Objects.isNull(user);
    }

    public boolean login(User user){
        String sql=" select tel,password pwd,nick_name nikeName,head_img from tbl_user where tel=? && password=? ";
        User t_user = this.findOne(sql,User.class,user.getTel(),user.getPwd());
        return Objects.isNull(t_user);
    }


    @Override
    public List<User> list() {
        String sql = "select tel,email,nick_name nickName,head_img headImg,role,user_status userStatus from tbl_user ";
        return this.list(sql, User.class);
    }

    /*public User login1(String logName, String logPwd) {
        String sql = "select id,tel,email,nick_name nickName,head_img headImg,role,user_status userStatus from tbl_user where (tel=? or email=?) and password=? and tbl_user.role=-1";
        return this.findOne(sql, User.class,logName,logName,logPwd);
    }*/
    public List<Post> unaudit(){
        String sql="select tbl_post.id,user_id,tbl_post.title,tbl_post.create_time from tbl_user,tbl_post where tbl_user.id=tbl_post.user_id and tbl_post.status=0";
        return this.list(sql, Post.class);
    }
    public boolean pass(int unaudit){
        String sql="update tbl_post set status=1 where id=?";
        return this.update(sql,unaudit);
    }

    public int getKiss(int id) {
        String sql="select kiss from tbl_user where id=?";
        return this.findOne(sql,User.class,id).getKiss();
    }

    @Override
    public boolean setKiss(int id, int kiss) {
        String sql="update tbl_user set kiss=? where id=?";
        return this.update(sql,kiss,id);
    }

    @Override
    public List<User> showAll(int begin,int end) {
        String sql="select id,tel,email,nick_name nikeName,sex,city,wealth,kiss,user_status,create_time createTime from tbl_user limit ?,?";
        //String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return this.list(sql,User.class,begin,end);
    }

    @Override
    public boolean setStatus(int id, int set) {
        String sql = "update tbl_user set user_status=? where id=?";
        return this.update(sql,set,id);
    }

    @Override
    public int getUserSum() {
        String sql="select count(*) sum from tbl_user";
        return this.getSum(sql);
    }

    public User findById(int id) {
        String sql="select id,tel,email,nick_name nikeName,sex,city,signature,head_img headImg,password,qq,sina,wealth,kiss,grade,role,user_status userStatus,email_status emailStatus,email_code emailCode,create_time createTime,update_time updateTime from tbl_user where id=?";
        return this.findOne(sql,User.class,id);
    }

    //////
    public List<Post> mypost(User user)//获取我发的帖子
    {
        String sql="select is_closed,tbl_post.title,tbl_post.is_fine,tbl_post.status,tbl_post.create_time from tbl_user,tbl_post where tbl_user.id=tbl_post.user_id and tbl_user.id=? ";
        return this.list(sql, Post.class,user.getId());
    }
    public List<Post> mycollect(User user)//获取我收藏的帖子
    {
        String sql="select reply_num,browse_num,tbl_post.title,tbl_collect.create_time from tbl_post,tbl_collect where tbl_collect.post_id=tbl_post.id and tbl_collect.user_id=? ";
        return this.list(sql, Post.class,user.getId());
    }

    public boolean changepass(String pass,User user,String nowpass){
        String sql="update tbl_user set password=? where id=? and password=?";
        return this.update(sql,pass,user.getId(),nowpass);
    }
    public boolean changetou(User user){
        String sql="update tbl_user set head_img=? where id=?";
        return this.update(sql,user.getHead_img(),user.getId());
    }
    public User getname(User user){
        //String sql=" select kiss,wealth,id,tel,password pwd,nick_name nikeName,head_img,city from tbl_user where tel=? && password=? ";
        String sql=" select grade,role,kiss,city,create_time createTime,id,tel,password pwd,nick_name nikeName,head_img from tbl_user where tel=? && password=? ";
        User t_user = this.findOne(sql,User.class,user.getTel(),user.getPwd());
        System.out.println("login12"+user.getTel()+" "+user.getPwd());
        return t_user;
    }
    public boolean getdata(User user){
        String sql=" update tbl_user set nick_name=?,sex=?,city=? where tel=? ";
        return this.update(sql,user.getNikeName(),user.getSex(),user.getCity(),user.getTel());

    }

}
