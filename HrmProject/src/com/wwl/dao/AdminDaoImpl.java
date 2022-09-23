package com.wwl.dao;

import com.alibaba.fastjson.JSON;
import com.wwl.pojo.User;
import com.wwl.util.JDBCUtils;

import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao {
    //用户信息
    @Override
    public String getUserData(String page, String limit) {
        String sql = "select *from user_inf limit " + page + "," + limit;
        ArrayList<User> list = JDBCUtils.executeQuery(sql, User.class);
        
        return JSON.toJSONString(list);
    }
}
