package org.zdk.fly_community.services.impl;
import org.zdk.fly_community.dao.IReplyDao;
import org.zdk.fly_community.dao.impl.ReplyDaoImpl;
import org.zdk.fly_community.entity.Reply;
import org.zdk.fly_community.entity.ReplyMsg;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.entity.vo.UserReplyEntity;
import org.zdk.fly_community.services.IReplyService;
import java.util.List;

public class ReplyServiceImpl implements IReplyService {

    private IReplyDao replyDao = new ReplyDaoImpl();
    @Override
    public boolean sendReply(Reply reply) {
        return replyDao.sendReply(reply);
    }

    @Override
    public ResponseEntity list(String postId, Integer pageIndex, Integer pageSize) {
        Integer count = replyDao.count(postId);
        List<UserReplyEntity> replyList = replyDao.list(postId, (pageIndex - 1) * pageSize, pageSize);
        return ResponseEntity.page(count,replyList);
    }

    public boolean deleteReply(int id) {
        return replyDao.deleteReply(id);
    }

    public boolean updateStatus(int id) {
        Reply rep = replyDao.findPostStatus(id);
        System.out.println(rep);
        rep.setReply_status(1);
        replyDao.updateStatus(rep);
        return false;
    }

    @Override
    public boolean dianzanReply(Integer reply_id) {
        return replyDao.dianzanReply(reply_id);
    }


    public ResponseEntity list() {
        List<ReplyMsg> list=replyDao.findByState();
        return ResponseEntity.ok(list);
    }

}
