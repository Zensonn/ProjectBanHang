package com.hcmute.team7.azshop.enums;

public enum Status {
    PENDING,
    COMPLETED,
    CANCELED;
    public String getStatusName() {
        return this.name();
    }
}
