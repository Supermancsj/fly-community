package org.zdk.fly_community.services.impl;

import lombok.Data;
import org.zdk.fly_community.dao.IPostDao;
import org.zdk.fly_community.dao.impl.PostDaoImpl;

import org.zdk.fly_community.entity.BackPost;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.PostUserEntity;
import org.zdk.fly_community.entity.vo.ResponseEntity;
import org.zdk.fly_community.services.IPostService;

import java.util.List;
@Data
public class PostServiceImpl implements IPostService {

    private IPostDao postDao= new PostDaoImpl();
    @Override
    public boolean PostWork(Post post) {
        return postDao.PostWork(post);
    }
    @Override
    public List<PostUserEntity> list(int postId) {
        return postDao.list(postId);
    }

    public ResponseEntity showPost(int page, int limit) {
        List<BackPost> list = postDao.showAll((page - 1) * limit, page * limit);
        int sum = postDao.getPostSum(0);
        return ResponseEntity.page(sum, list);
    }
        public boolean updateStatus(int id, int op) {
            Post post = postDao.findPostStatus(id);
            switch (op){
                case 1:
                    if(post.getIs_top()==1)post.setIs_top(0);
                    else post.setIs_top(1);
                    break;
                case 2:
                    if(post.getStatus()==1)post.setStatus(0);
                    else post.setStatus(1);
                    break;
                default:
                    break;
            }
            postDao.updateStatus(post);
            return false;
        }

        public boolean delById(int id) {
            return postDao.deletePost(id);
        }

    @Override
    public int getPostSum(int status) {
        return postDao.getPostSum(status);
    }
}
