package com.hcmute.team7.azshop.enums;

public enum Status {
    PENDING,
    SHIPPING,
    COMPLETED,
    CANCELED;
    public String getStatusName() {
        return this.name();
    }
}
