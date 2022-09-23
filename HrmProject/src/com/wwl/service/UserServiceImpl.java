package com.wwl.service;

import com.wwl.dao.UserDao;
import com.wwl.dao.UserDaoImpl;
import com.wwl.pojo.User;

public class UserServiceImpl implements UserService {
    private UserDao ud = new UserDaoImpl();

    //登录
    @Override
    public User login(String username, String password) {
        User user = ud.findUserByUsername(username);
        if (user != null) {
            if (password.equals(user.getPassword())) {
                return user;
            }
        }
        return null;
    }

    //注册
    @Override
    public String register(String loginname, String password, int status, String createdate, String nickname) {
        int i = ud.register(loginname, password, status, createdate, nickname);
        if (i > 0) {
            return i + "";
        }
        return "";
    }

    @Override
    public int checkLoginName(String loginname) {
        User user = ud.findUserByUsername(loginname);
        if (user != null) {
            return 1;
        }
        return 0;
    }

    //注册用户
    @Override
    public int insertUser(User user) {
        return ud.insertUser(user);
    }
}
