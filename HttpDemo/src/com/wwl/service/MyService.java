package com.wwl.service;

import com.wwl.pojo.Person;

public interface MyService {
    Person login(String username, String password);

    String register(String username, String password, String phone);

    String register(Person person);
}
