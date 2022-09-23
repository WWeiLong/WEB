package com.wwl.dao;

import com.wwl.pojo.User;

public interface UserDao {
    //登录
    User findUserByUsername(String username);

    //注册
    int register(String loginname, String password, int status, String createdate, String nickname);

    //数据库注册用户
    int insertUser(User user);
}
