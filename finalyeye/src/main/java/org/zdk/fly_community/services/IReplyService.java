package org.zdk.fly_community.services;


import org.zdk.fly_community.entity.Reply;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.entity.vo.UserReplyEntity;

import java.util.List;

public interface IReplyService {

    boolean sendReply(Reply reply);
    ResponseEntity list(String postId, Integer pageIndex, Integer pageSize);

    boolean deleteReply(int id);

    boolean updateStatus(int id);
    boolean dianzanReply(Integer reply_id);

    ResponseEntity list();

}
