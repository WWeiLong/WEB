package com.wwl.service;

import com.wwl.pojo.Student;

import java.util.ArrayList;

public interface DataServer {
    ArrayList<Student> getData(String page1, String total);

}
