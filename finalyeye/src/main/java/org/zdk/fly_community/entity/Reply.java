package org.zdk.fly_community.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Reply {
    private int id;
    private int post_id;
    private String reply_context;
    private int praise_count;
    private int reply_status;
    private int user_id;
    private LocalDateTime create_time;
}
