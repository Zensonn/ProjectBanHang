package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.StoreDAO;
import com.hcmute.team7.azshop.DAO.UserDAO;
import com.hcmute.team7.azshop.entity.Store;
import com.hcmute.team7.azshop.enums.Role;
import com.hcmute.team7.azshop.entity.User;
import com.hcmute.team7.azshop.service.IUserService;

import javax.inject.Inject;

public class UserServiceImpl implements IUserService {

    @Inject
    private UserDAO userDAO;

    @Inject
    private StoreDAO storeDAO;

    @Override
    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public boolean Register(String userName, String fullName, String email, String code, String password) {
        if (userDAO.checkExistEmail(email)) {
            return false;
        }
        if (userDAO.checkExistUserName(userName)) {
            return false;
        }
        userDAO.Register(new User(userName, fullName, email, code, false, password, Role.USER));
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDAO.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUserName(String userName) {
        return userDAO.checkExistUserName(userName);
    }

    @Override
    public void updateEmailActive(String email) {
        userDAO.updateEmailActive(email);
    }


    // Các hàm cho phần login

    @Override
    public User login(String email, String password) {
        User user = userDAO.findByEmail(email);
        if(user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean registerForVendor(String userName, String fullName, String email, String code, String password) {
        if (userDAO.checkExistEmail(email)) {
            return false;
        }
        if (userDAO.checkExistUserName(userName)) {
            return false;
        }

        // Tạo user mới
        User user = new User(userName, fullName, email, code, false, password, Role.VENDOR);

        // Tạo cửa hàng mới
        Store store = new Store();
        store.setName(userName + "'s Store"); // Tạo mặc định tên cho cửa hàng
        store.setBio(userName + "'s Store");
        store.setUser(user);

        // Gán cửa hàng cho user
        // user.setStore(store);

        // Lưu user và cửa hàng vào cơ sở dữ liệu
        userDAO.Register(user);
        storeDAO.create(store);

        return true;
    }
}
