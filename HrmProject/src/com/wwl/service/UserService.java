package com.wwl.service;

import com.wwl.pojo.User;

public interface UserService {
    /**
     * 登录功能
     *
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);

    /**
     * 注册功能
     *
     * @param loginname
     * @param password
     * @param status
     * @param createdate
     * @param nickname
     * @return
     */
    String register(String loginname, String password, int status, String createdate, String nickname);

    //验证是否被注册过
    int checkLoginName(String loginname);

    //注册用户
    int insertUser(User user);
}
