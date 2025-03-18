package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");

    private final String type;

    TransactionType(String statusName) { this.type = statusName; }

    public String getStatusName() { return type; }

    public static Map<String, String> transactionType() {
        Map<String, String> listType = new LinkedHashMap<>();
        for (TransactionType item : TransactionType.values()) {
            listType.put(item.toString(), item.getStatusName());
        }
        return listType;
    }
}
