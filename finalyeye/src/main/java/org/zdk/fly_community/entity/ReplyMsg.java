package org.zdk.fly_community.entity;

import java.util.Date;

public class ReplyMsg {
    private String nikeName;
    private String headImg;
    private String replyContext;
    private int replyPraise;
    private Date createTime;
    private Date replyTime;
    private int status;
    private int id;

    public ReplyMsg(){

    }

    public ReplyMsg(String nikeName,String headImg,String replyContext,int replyPraise,Date createTime){
        this.nikeName=nikeName;
        this.headImg=headImg;
        this.replyContext=replyContext;
        this.replyPraise=replyPraise;
        this.createTime=createTime;
    }
}
