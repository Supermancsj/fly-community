package org.zdk.fly_community.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Column {
    int id;
    String name;
    int sort_name;
    int user_id;
    LocalDateTime create_time;
    LocalDateTime update_time;
}
