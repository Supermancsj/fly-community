package org.zdk.fly_community.entity.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PostUserEntity {
    private int Post_id;//帖子编号
    private int column_id;//所在专栏 1 提问专栏 2 分享专栏 3 讨论专栏 4 建议专栏
    private String title;//标题
    private String  context;//内容详情
    private int kiss;//悬赏（飞吻）
    private int is_fine;//是否精华帖
    private int is_top;//是否置顶
    private int is_close;//是否已结
    private int user_id;//发帖人ID
    private int browse_num;//浏览数
    private int reply_num;// 回复数
    private LocalDateTime create_time;//创建时间
    private LocalDateTime update_time;//修改时间
    private String nick_Name;
    private String head_Img;
    private String grade;
}
