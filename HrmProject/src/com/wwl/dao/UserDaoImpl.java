package com.wwl.dao;

import com.wwl.pojo.User;
import com.wwl.util.JDBCUtils;

import java.util.ArrayList;
import java.util.Date;

public class UserDaoImpl implements UserDao {
    //登录
    @Override
    public User findUserByUsername(String username) {
        String sql = "select *from user_inf where loginname = ?";
        ArrayList<User> list = JDBCUtils.executeQuery(sql, User.class, username);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    //注册
    @Override
    public int register(String loginname, String password, int status, String createdate, String nickname) {
        String sql = "insert into user_inf(loginname,password,status,createdate,username) values(?,?,?,?,?)";
        int i = JDBCUtils.executeUpdate(sql, loginname, password, status, createdate, nickname);
        return i;
    }

    //注册用户
    @Override
    public int insertUser(User user) {
        String sql = "INSERT INTO user_inf(loginname, password, status, createdate, username) VALUES (?,?,?,?,?);";
        int i = JDBCUtils.executeUpdate(sql, user.getLoginname(), user.getPassword(), user.getStatus(), new Date(), user.getUsername());
        return i;
    }
}
