package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.User;

public interface IUserService {
    User findByEmail(String email);

    // Các phương thức dành cho register

    boolean Register(String userName, String fullName, String email, String code, String password);
    boolean checkExistEmail(String email);
    boolean checkExistUserName(String userName);
    void updateEmailActive(String email);

    // // Các phương thức dành cho login
    User login(String email, String password);
}
