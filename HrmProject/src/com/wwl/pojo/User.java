package com.wwl.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
    private int id;
    private String loginname;
    private String password;
    private int status;
    private Date createdate;
    private String username;
    private String dateString;

    public User(int id, String loginname, String password, int status, Date createdate, String username) {
        this.id = id;
        this.loginname = loginname;
        this.password = password;
        this.status = status;
        this.createdate = createdate;
        this.username = username;

    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createdate);
        DateString(format);
        this.createdate = createdate;
    }

    public void DateString(String dateString) {
        this.dateString = dateString;
    }

    public String getDateString() {
        return dateString;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", createdate='" + createdate + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
