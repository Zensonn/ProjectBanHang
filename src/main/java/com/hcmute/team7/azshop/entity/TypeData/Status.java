package com.hcmute.team7.azshop.entity.TypeData;

public enum Status {
    PENDING,
    COMPLETED,
    CANCELED;
    public String getStatusName() {
        return this.name();
    }
}
