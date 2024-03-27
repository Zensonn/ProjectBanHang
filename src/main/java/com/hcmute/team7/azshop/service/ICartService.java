package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.User;

public interface ICartService {
    void addToCart(Product product, int quantity, User user);
    void updateItemInCart(Product product, int quantity, User user);
    void deleteItemFromCart(Product product, User user);
}