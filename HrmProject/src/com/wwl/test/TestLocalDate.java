package com.wwl.test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoField;

/**
 * @Author ：LJP
 * @Description ：新日期函数.TestLocalDate
 * @Date ：2022/8/19 14:03
 */

public class TestLocalDate {
    public static void main(String[] args) {
        LocalDate date = LocalDate.of(2022, 8, 19);
        System.out.println(date.getYear());
        System.out.println(date.getMonth());
        System.out.println(date.getDayOfMonth());
        LocalDate now = LocalDate.now();
        System.out.println(now);
        System.out.println(date.get(ChronoField.YEAR));
        System.out.println(date.get(ChronoField.DAY_OF_MONTH));
        System.out.println(date.get(ChronoField.MONTH_OF_YEAR));

        LocalDate parse = LocalDate.parse("2019-08-11");
        System.out.println(parse);
        LocalTime parse1 = LocalTime.parse("13:45:20");
        System.out.println(parse1);
    }
}
