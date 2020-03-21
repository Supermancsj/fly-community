package org.zdk.fly_community.services.impl;

import org.zdk.fly_community.dao.IUserPostDao;
import org.zdk.fly_community.dao.impl.UserPostDaolmpl;
import org.zdk.fly_community.entity.vo.Userpost;
import org.zdk.fly_community.services.IUserPostService;

import java.util.List;

public class UserPostServiceImpl implements IUserPostService
{
  private IUserPostDao postDao=new UserPostDaolmpl();

    public List<Userpost> getu_pinfor_roof()
    {
        return postDao.getu_pinfor_roof();
    }
    public List<Userpost> getu_pinfor_all(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_all(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_unclosed(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_unclosed(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_closed(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_closed(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_top(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_top(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_ask(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_ask(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_share(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_share(pageIndex,pageSize);
    }
    public List<Userpost> getu_pinfor_discuss(Integer pageIndex,Integer pageSize)
    {
        return postDao.getu_pinfor_discuss(pageIndex,pageSize);
    }

    @Override
    public List<Userpost> getu_pinfor_advice(Integer pageIndex, Integer pageSize) {
        return postDao.getu_pinfor_advice(pageIndex,pageSize);
    }

    @Override
    public Integer count() {
        return postDao.count();
    }

}
