package org.zdk.fly_community.dao.impl;
import org.zdk.fly_community.dao.IReplyDao;
import org.zdk.fly_community.entity.Reply;
import org.zdk.fly_community.entity.ReplyMsg;
import org.zdk.fly_community.entity.vo.UserReplyEntity;
import org.zdk.fly_community.util.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class ReplyDaoImpl extends BaseDao implements IReplyDao {
    @Override
    public boolean sendReply(Reply reply)
    {
        String sql = "insert into tbl_reply(post_id,reply_context,user_id) values(?,?,?)";
        String sql2 = "update tbl_post set tbl_post.reply_num=(select count(1) from tbl_reply where post_id =? and replay_status = 1 ) where tbl_post.id =?";
        this.update(sql2,reply.getPost_id(),reply.getPost_id());
        return this.update(sql,reply.getPost_id(), reply.getReply_context(), reply.getUser_id());
    }

    @Override
    public Integer count(String postId) {
        con = JdbcUtil.getConnection();
        int i=Integer.parseInt(postId);
        String sql = " select count(1) count from tbl_reply where post_id = '"+i+"' and  reply_status = 1 ";
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
    @Override
    public List<UserReplyEntity> list(String postId,Integer pageIndex,Integer pageSize) {
        String sql = " select reply.id id,reply.post_id post_id,reply_context,praise_count,reply.create_time create_time, " +
                " user.id reply_id,head_img head_Img,nick_name nick_Name,grade " +
                " from tbl_reply reply join tbl_user user on reply.user_id = user.id where post_id = ? and reply.reply_status = 1  order by reply.create_time limit ?,? ";
        return this.list(sql,UserReplyEntity.class,postId,pageIndex,pageSize);
    }

    public boolean deleteReply(int id) {
        String sql="delete from tbl_reply where id=" + id;
        return this.del(sql);
    }

    @Override
    public Reply findPostStatus(int id) {
        String sql = "select id,replay_status reply_status from tbl_reply where id=?";
        return this.findOne(sql,Reply.class,id);
    }

    public boolean dianzanReply(Integer reply_id) {
        String sql = "update tbl_reply set tbl_reply.praise_count=(tbl_reply.praise_count+1) where tbl_reply.id =?" ;
        return this.update(sql,reply_id);
    }

    public List<ReplyMsg> findByState() {
        String sql="select tbl_reply.id,nick_name nikeName,reply_context replyContext,tbl_reply.create_time createTime from tbl_reply,tbl_user where replay_status=0 and tbl_reply.user_id=tbl_user.id";
        return this.list(sql,ReplyMsg.class);
    }

    public boolean updateStatus(Reply reply) {
        String sql = "update tbl_reply set replay_status=? where id=?";
        return this.update(sql,reply.getReply_status(),reply.getId());
    }

    public static void main(String[] args) {
        IReplyDao s=new ReplyDaoImpl();
        boolean d=s.dianzanReply(23);
    }
}
