package org.zdk.fly_community.dao;
import org.zdk.fly_community.entity.Post;
import org.zdk.fly_community.entity.vo.Userpost;

import java.util.List;

public interface IUserPostDao {
     List<Userpost> getu_pinfor_roof();
     List<Userpost> getu_pinfor_all(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_unclosed(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_closed(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_top(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_ask(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_share(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_discuss(Integer pageIndex, Integer pageSize);
     List<Userpost> getu_pinfor_advice(Integer pageIndex, Integer pageSize);
     Integer count();

}
