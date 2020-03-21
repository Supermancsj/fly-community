package org.zdk.fly_community.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Collect {
    private int id;
    private int user_id;
    private int post_id;
    private LocalDateTime create_time;
}
