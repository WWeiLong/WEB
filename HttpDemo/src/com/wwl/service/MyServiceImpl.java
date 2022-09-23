package com.wwl.service;

import com.wwl.dao.MyDao;
import com.wwl.dao.MyDaoImpl;
import com.wwl.pojo.Person;

public class MyServiceImpl implements MyService {
    private MyDao md = new MyDaoImpl();

    //登录
    @Override
    public Person login(String username, String password) {
        Person p = md.login(username);
        if (p != null) {
            if (p.getPassword().equals(password)) {
                return p;
            }
        }
        return null;
    }

    //注册
    @Override
    public String register(String username, String password, String phone) {
        String p = md.register(username, password, phone);
        return p;
    }

    @Override
    public String register(Person person) {
        return md.register(person);
    }
}
