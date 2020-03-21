package org.zdk.fly_community.services;

import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.PostUserEntity;
import org.zdk.fly_community.entity.vo.ResponseEntity;

import java.util.List;

public interface IPostService {

    List<PostUserEntity> list(int postId);

    boolean PostWork(Post post);

    ResponseEntity showPost(int page, int limit);

    boolean updateStatus(int id, int op);

    boolean delById(int id);

    int getPostSum(int status);
}
