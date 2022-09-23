package com.wwl.test;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;

import static java.time.temporal.TemporalAdjusters.lastDayOfMonth;
import static java.time.temporal.TemporalAdjusters.nextOrSame;

/**
 * @Author ：LJP
 * @Description ：新日期函数.TestParseAndoperatetionDate
 * @Date ：2022/8/19 14:48
 */

public class TestParseAndoperatetionDate {
    public static void main(String[] args) {
        LocalDate date1 = LocalDate.of(2014, 3, 18);
        LocalDate date2 = date1.withYear(2011);
        LocalDate date3 = date2.withDayOfMonth(25);
        LocalDate date4 = date3.with(ChronoField.MONTH_OF_YEAR, 9);
        LocalDate date11 = LocalDate.of(2014, 3, 18);
        LocalDate date12 = date1.plusWeeks(1);
        LocalDate date13 = date2.minusYears(3);
        LocalDate date14 = date3.plus(6, ChronoUnit.MONTHS);

        LocalDate date111 = LocalDate.of(2014, 3, 18);
        LocalDate date22 = date1.with(nextOrSame(DayOfWeek.SUNDAY));
        LocalDate date33 = date2.with(lastDayOfMonth());

        LocalDate date = LocalDate.of(2014, 3, 18);
        String s1 = date.format(DateTimeFormatter.BASIC_ISO_DATE);
        String s2 = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
        //------------------------------------------------------------------------
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date8 = LocalDate.of(2014, 3, 18);
        String formattedDate = date1.format(formatter);
        LocalDate date9 = LocalDate.parse(formattedDate, formatter);

    }
}
