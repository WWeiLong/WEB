package com.wwl.dao;

import com.wwl.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PageDao {
    public int getTotal() {
        String sql = "select count(*) count from student";
        ResultSet rs = JDBCUtil.executeQuery(sql);
        try {
            if (rs.next()) {
                int count = rs.getInt("count");
                return count;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
