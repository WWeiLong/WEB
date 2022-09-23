package com.wwl.service;

import com.wwl.dao.AdminDao;
import com.wwl.dao.AdminDaoImpl;

public class AdminServiceImpl implements AdminService {
    private AdminDao ad = new AdminDaoImpl();

    @Override
    public String getUserData(String page, String limit) {

        return ad.getUserData(page, limit);
    }
}
