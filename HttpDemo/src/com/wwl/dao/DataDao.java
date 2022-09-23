package com.wwl.dao;

import com.wwl.pojo.Student;

import java.util.ArrayList;

public interface DataDao {
    ArrayList<Student> getData(String page1, String total);
}
