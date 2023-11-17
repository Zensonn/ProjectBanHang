package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Orders;

import java.util.List;

public interface IOrdersService {
    void create(Orders orders);
    void update(Orders orders);
    void softDelete(Long ordersID);
    List<Orders> findAll();
    List<Orders> findAll(String keyword, int page, int pageSize);
    Orders findById(Long ordersID);
    Long count();
}
