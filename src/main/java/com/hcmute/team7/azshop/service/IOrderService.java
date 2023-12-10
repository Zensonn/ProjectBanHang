package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.Orders;

import java.util.List;


public interface IOrderService {
    void create(Cart cart, Long storeId);
    List<Orders> findAllOrdersByStore(int firstResult, int maxResults, Long storeId);
    void acceptOrder(Long id);
    void cancelOrder(Long id);
    void completeOrder(Long id);
}
