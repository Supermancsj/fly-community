package org.zdk.fly_community.entity;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    private Integer id;
    private String tel;
    private String nikeName;
    private String pwd;
    private String sex;
    private String email;
    BigDecimal wealth;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private String city;
    private String signature;
    private String qq;
    private String head_img;
    private int kiss;
    private String grade;
    private String role;
    private int user_status;
    private int email_status;
    private int email_code;

    public Integer getId() {
        return id;
    }

    public String getTel() {
        return tel;
    }

    public String getNikeName() {
        return nikeName;
    }

    public String getPwd() {
        return pwd;
    }

    public String getSex() {
        return sex;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public String getCity() {
        return city;
    }

    public String getSignature() {
        return signature;
    }

    public String getQq() {
        return qq;
    }

    public String getHead_img() {
        return head_img;
    }

    public int getKiss() {
        return kiss;
    }

    public String getGrade() {
        return grade;
    }

    public String getRole() {
        return role;
    }

    public int getUser_status() {
        return user_status;
    }

    public int getEmail_status() {
        return email_status;
    }

    public int getEmail_code() {
        return email_code;
    }


}