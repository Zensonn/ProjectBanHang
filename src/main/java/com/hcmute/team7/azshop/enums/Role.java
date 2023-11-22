package com.hcmute.team7.azshop.enums;

public enum Role {
    ADMIN,
    USER,
    VENDOR;
    public String getRoleName() {
        return this.name();
    }
}
