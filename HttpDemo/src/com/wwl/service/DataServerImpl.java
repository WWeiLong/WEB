package com.wwl.service;

import com.wwl.dao.DataDao;
import com.wwl.dao.DataDaoImpl;
import com.wwl.pojo.Student;

import java.util.ArrayList;

public class DataServerImpl implements DataServer {
    private DataDao dd = new DataDaoImpl();

    @Override
    public ArrayList<Student> getData(String page1, String total) {
        return dd.getData(page1, total);
    }
}
