package org.zdk.fly_community.dao.impl;

import lombok.Data;
import org.zdk.fly_community.dao.IPostDao;
import org.zdk.fly_community.entity.BackPost;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.PostUserEntity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
@Data
public class PostDaoImpl extends BaseDao implements IPostDao{

    @Override
    public boolean PostWork(Post post) {
        String sql="insert into tbl_post(title,context,column_id,kiss," +
                "status,is_fine,is_top,is_closed,user_id,browse_num,reply_num,product,version,browser) " +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String now= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return this.update(
                sql,
               // post.getId(),
                post.getTitle(),
                post.getContext(),
                post.getColumn_id(),
                post.getKiss(),
                post.getStatus(),
                post.getIs_fine(),
                post.getIs_top(),
                post.getIs_closed(),
                post.getUser_id(),
                post.getBrowse_num(),
                post.getReply_num(),
                post.getProduct(),
                post.getVersion(),
                post.getBrowser()
        );
    }
    @Override
    public List<PostUserEntity> list(int postID) {
        String sql = "select post.id Post_id,column_id,title,context,post.kiss kiss,is_fine,is_top,is_closed is_close,user.id user_id,browse_num,reply_num,post.create_time create_time,user.nick_name nick_Name,head_img head_Img,grade from tbl_post post join tbl_user user on post.user_id=user.id where post.id=? ";
        return this.list(sql,PostUserEntity.class, postID);
    }

    public List<BackPost> showAll(int begin, int end) {
        String sql = "select tbl_post.id,nick_name nikeName,context,tbl_post.create_time createTime,is_top isTop from tbl_user,tbl_post where user_id=tbl_user.id and tbl_post.status=0 limit ?,?";
        return this.list(sql, BackPost.class,begin,end);
    }

    @Override
    public int getPostSum(int status) {
        String sql="select count(*) sum from tbl_post where status=" + status;
        return this.getCount(sql,"sum");
    }

    public Post findPostStatus(int id) {
        String sql = "select id,status,is_top,is_fine,is_closed from tbl_post where id=?";
        return this.findOne(sql,Post.class,id);
    }

    @Override
    public boolean updateStatus(Post post) {
        String sql = "update tbl_post set status=?,is_top=?,is_fine=?,is_closed=? where id=?";
        return this.update(sql,post.getStatus(),post.getIs_top(),post.getIs_fine(),post.getIs_closed(),post.getId());
    }
    public boolean deletePost(int id) {
        String sql="delete from tbl_post where id="+id;
        return  this.del(sql);
    }

}
