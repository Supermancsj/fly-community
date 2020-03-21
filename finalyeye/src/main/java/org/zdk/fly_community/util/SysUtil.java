package org.zdk.fly_community.util;


/**
 * @description
 * @auther: CDHONG.IT
 * @date: 2019/8/18-16:20
 **/
public final class SysUtil {

    public static final String VERIFY_CODE = "verifyCode"; //验证码
    public static final String TEL_VERIFY_CODE = "telVerifyCode"; //手机验证码
    public static final String CURRENT_USER = "currentUser";

    public interface UserStatus{
        int ENABLED = 0;  //启用
        int DISABLED = 1; //禁用
    }

}
