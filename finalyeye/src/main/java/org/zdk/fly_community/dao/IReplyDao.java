package org.zdk.fly_community.dao;

import org.zdk.fly_community.entity.Reply;
import org.zdk.fly_community.entity.ReplyMsg;
import org.zdk.fly_community.entity.vo.UserReplyEntity;

import java.util.List;

public interface IReplyDao {
    boolean sendReply(Reply reply);

    List<UserReplyEntity> list(String postId, Integer pageIndex, Integer pageSize);

    Integer count(String postId);

    boolean deleteReply(int id);
    boolean updateStatus(Reply reply);

    Reply findPostStatus(int id);

    boolean dianzanReply(Integer reply_id);
    List<ReplyMsg> findByState();
}
