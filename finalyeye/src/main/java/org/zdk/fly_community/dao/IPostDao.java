package org.zdk.fly_community.dao;
import org.zdk.fly_community.entity.BackPost;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.PostUserEntity;

import java.util.List;

/**
 * @description
 * @auther: CDHONG.IT
 * @date: 2019/8/21-9:54
 **/
public interface IPostDao {
    boolean PostWork(Post post);
    List<PostUserEntity> list(int postID);

    List<BackPost> showAll(int begin, int end);

    int getPostSum(int status);

    Post findPostStatus(int id);

    boolean updateStatus(Post post);

    boolean deletePost(int id);
}
