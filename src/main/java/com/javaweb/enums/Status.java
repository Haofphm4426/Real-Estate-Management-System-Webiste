package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum Status {
    CHUA_XU_LY("Chưa xử lý"),
    DANG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý");


    private final String statusName;

    Status(String statusName) { this.statusName = statusName; }

    public String getStatusName() { return statusName; }

    public static Map<String, String> type() {
        Map<String, String> listType = new LinkedHashMap<>();
        for (Status item : Status.values()) {
            listType.put(item.toString(), item.getStatusName());
        }
        return listType;
    }

    public static String getValueByStatusCode(String code) {
        for(Status item : Status.values()) {
            if (item.toString().equals(code)) {
                return item.getStatusName();
            }
        }
        return null;
    }

    public static String getCodeByValue(String statusName) {
        for(Status item : Status.values()) {
            if (item.getStatusName().equals(statusName)) {
                return item.toString();
            }
        }
        return null;
    }
}
