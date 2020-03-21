package org.zdk.fly_community.dao.impl;

import org.zdk.fly_community.dao.IUserPostDao;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.Userpost;
import org.zdk.fly_community.util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class UserPostDaolmpl extends BaseDao implements IUserPostDao {
    @Override
    public List<Userpost> getu_pinfor_roof()
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and post.is_top=1";
        return this.list(sql,Userpost.class);
    }
    public List<Userpost> getu_pinfor_all(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id order by post.create_time desc limit ?,? ";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_unclosed(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and post.is_closed=0 order by post.create_time desc limit ?,?";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_closed(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and post.is_closed=1 order by post.create_time desc limit ?,?";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }

    public List<Userpost> getu_pinfor_top(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and post.is_fine=1 order by post.create_time desc limit ?,?";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_ask(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and column1.id=1 order by post.create_time desc limit ?,?";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_share(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and column1.id=2 order by post.create_time desc limit ?,? ";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_discuss(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and column1.id=3 order by post.create_time desc limit ?,? " ;
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_advice(Integer pageIndex,Integer pageSize)
    {
        String sql="select post.id,post.user_id,title,nick_name nikeName,post.kiss,head_img,column1.name columnName,reply_num ,grade,is_fine,is_top,post.create_time from tbl_post post join tbl_user user join tbl_column column1 where post.user_id=user.id and post.column_id=column1.id and column1.id=4 order by post.create_time desc limit ?,?; ";
        Integer startIndex=(pageIndex-1)*pageSize;
        return this.list(sql,Userpost.class,startIndex,pageSize);
    }
    public Integer count() {
        con = JdbcUtil.getConnection();
        String sql = " select count(1) from tbl_post ";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.closeAll(rs,ps,con);
        }
        return 0;
    }
}