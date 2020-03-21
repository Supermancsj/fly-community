package org.zdk.fly_community.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Userpost {
    private Integer user_id;
    private String nikeName;
    private String columnName;
    private int kiss;
    private String head_img;
    private int column_id;
    private int reply_num;
    private String grade;
    private String title;
    private int is_fine;
    private LocalDateTime create_time;
    private int is_top;
    private int id;
}
