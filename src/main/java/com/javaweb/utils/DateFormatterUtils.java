package com.javaweb.utils;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateFormatterUtils {
    public String toNewDateFormat(Date oldDate) {
        return new SimpleDateFormat("dd/MM/yyyy").format(oldDate);
    }
}
