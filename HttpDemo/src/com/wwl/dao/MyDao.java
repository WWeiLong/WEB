package com.wwl.dao;

import com.wwl.pojo.Person;

public interface MyDao {
    Person login(String username);

    String register(String username, String password, String phone);

    String register(Person person);
}
