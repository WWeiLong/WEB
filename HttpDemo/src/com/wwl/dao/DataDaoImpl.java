package com.wwl.dao;

import com.wwl.pojo.Student;
import com.wwl.util.JDBCUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

public class DataDaoImpl implements DataDao {
    @Override
    public ArrayList<Student> getData(String page1, String total) {
        String sql = "select *from student limit " + page1 + "," + total;
        ResultSet rs = JDBCUtil.executeQuery(sql);
        try {
            ArrayList<Student> list = new ArrayList<Student>();
            while (rs.next()) {
                Student stu = new Student();
                stu.setNumber(rs.getInt("number"));
                stu.setName(rs.getString("name"));
                stu.setPassword(rs.getString("password"));
                stu.setBirthday(rs.getString("birthday"));
                stu.setSex(rs.getString("sex"));
                stu.setMath(rs.getInt("math"));
                stu.setEnglish(rs.getInt("english"));
                stu.setChinese(rs.getInt("chinese"));
                stu.setTotal();
                list.add(stu);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
