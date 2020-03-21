package org.zdk.fly_community.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Post {
    private int id;
    private int column_id;
    private String context;
    private String title;
    private int user_id;
    private int kiss;
    private int grade;
    private int status;
    private int is_fine;
    private int is_top;
    private int is_closed;
    private int browse_num;
    private int reply_num;
    private LocalDateTime create_time;
    private LocalDateTime update_time;
    private String product;   //所属产品
    private String version;   // 版本号
    private String browser;  //浏览器
    public Post(int user_id, int column_id, String title, String context, int kiss, String product, String version, String browser) {
       // this.id = id;
        this.column_id = column_id;
        this.title = title;
        this.context = context;
        this.kiss = kiss;
        this.user_id = user_id;
        this.browser = browser;
        this.version = version;
        this.product = product;
        this.is_closed = 0;
        this.is_fine = 0;
        this.is_top = 0;
        this.browse_num = 0;
        this.reply_num = 0;
        this.status = 0;

    }
}