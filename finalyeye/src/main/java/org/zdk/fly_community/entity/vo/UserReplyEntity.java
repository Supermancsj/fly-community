package org.zdk.fly_community.entity.vo;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserReplyEntity {

    private int id;
    private int post_id;
    private int reply_id;
    private String reply_context;
    private int praise_count ;
    private LocalDateTime create_time;
    private String head_Img;
    private String nick_Name;
    private String grade;
}

