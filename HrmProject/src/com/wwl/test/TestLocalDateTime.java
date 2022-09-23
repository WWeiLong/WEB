package com.wwl.test;

import java.time.*;
import java.time.temporal.ChronoUnit;

/**
 * @Author ：LJP
 * @Description ：新日期函数.TestLocalDateTime
 * @Date ：2022/8/19 14:34
 */

public class TestLocalDateTime {
    public static void main(String[] args) {
        LocalDate date = LocalDate.parse("2014-03-18");
        LocalTime time = LocalTime.parse("13:45:20");
        LocalDateTime dt1 = LocalDateTime.of(2014, Month.MARCH, 18, 13, 45, 20);
        LocalDateTime dt2 = LocalDateTime.of(date, time);
        LocalDateTime dt3 = date.atTime(13, 45, 20);
        LocalDateTime dt4 = date.atTime(time);
        LocalDateTime dt5 = time.atDate(date);
        System.out.println(dt1);
        System.out.println(dt2);
        System.out.println(dt3);
        System.out.println(dt4);
        System.out.println(dt5);
        System.out.println(dt1.toLocalDate());
        System.out.println(dt1.toLocalTime());
        //-----------------------------------------------------------
        Duration threeMinutes = Duration.ofMinutes(3);
        Duration threeMinutes1 = Duration.of(3, ChronoUnit.MINUTES);
        Period tenDays = Period.ofDays(10);
        Period threeWeeks = Period.ofWeeks(3);
        Period twoYearsSixMonthsOneDay = Period.of(2, 6, 1);
        System.out.println(threeMinutes);
        System.out.println(threeMinutes1);
        System.out.println(tenDays);
        System.out.println(threeWeeks);
        System.out.println(twoYearsSixMonthsOneDay);


    }
}
