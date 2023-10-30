package com.hcmute.team7.azshop.entity.TypeData;

public enum Role {
    ADMIN,
    USER,
    VENDOR;
    public String getRoleName() {
        return this.name();
    }
}
