package com.wwl.pojo;

/**
 * @功能: 实体类
 * @作者: 🐋
 * @日期: 2022-09-02
 */
public class Student {
    private int number;
    private String password;
    private String name;
    private String sex;
    private String birthday;
    private int chinese;
    private int math;
    private int english;
    private int total;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getChinese() {
        return chinese;
    }

    public void setChinese(int chinese) {
        this.chinese = chinese;
    }

    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }

    public int getEnglish() {
        return english;
    }

    public void setEnglish(int english) {
        this.english = english;
    }

    public void setTotal() {
        this.total = this.math + this.chinese + this.english;
    }

    public int getTotal() {
        return total;
    }

    /**
     * @param number
     * @param password
     * @param name
     * @param sex
     * @param birthday
     * @param chinese
     * @param math
     * @param english
     */
    public Student(int number, String password, String name, String sex, String birthday, int chinese, int math,
                   int english) {
        super();
        this.number = number;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.birthday = birthday;
        this.chinese = chinese;
        this.math = math;
        this.english = english;
    }

    /**
     *
     */
    public Student() {
        super();
    }

    @Override
    public String toString() {
        return "Student [number=" + number + ", password=" + password + ", name=" + name + ", sex=" + sex
                + ", birthday=" + birthday + ", chinese=" + chinese + ", math=" + math + ", english=" + english
                + ", total=" + total + "]";
    }

}
