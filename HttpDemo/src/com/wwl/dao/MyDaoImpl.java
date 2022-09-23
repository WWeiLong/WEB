package com.wwl.dao;

import com.wwl.pojo.Person;
import com.wwl.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MyDaoImpl implements MyDao {
    @Override
    public Person login(String username) {
        String sql = "select *from person where username = ?";
        ResultSet rs = JDBCUtil.executeQuery(sql, username);
        Person p = new Person();
        try {
            if (rs.next()) {
                int id = rs.getInt("id");
                String username1 = rs.getString("username");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                p.setId(id);
                p.setUsername(username1);
                p.setPassword(password);
                p.setPhone(phone);
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs);
        }
        return null;
    }

    @Override
    public String register(String username, String password, String phone) {
        String sql1 = "select * from person where phone = ?";
        ResultSet rs = JDBCUtil.executeQuery(sql1, phone);
        try {
            if (rs.next()) {
                return "-1";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs);
        }

        String sql2 = "insert into person(username,password,phone) values(?,?,?)";
        int i = JDBCUtil.executeUpdate(sql2, username, password, phone);
        if (i > 0) {
            return "1";
        }
        return "";
    }

    @Override
    public String register(Person person) {
        String sql2 = "insert into person(username,password,phone,email,realname,sex,birthday) values(?,?,?,?,?,?,?)";
        int i = JDBCUtil.executeUpdate(sql2, person.getUsername(), person.getPassword(), person.getPhone(), person.getEmail(), person.getRealname(), person.getSex(), person.getBirthday());
        if (i > 0) {
            return "1";
        }
        return "";
    }
}
