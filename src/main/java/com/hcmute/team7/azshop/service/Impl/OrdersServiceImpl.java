package com.hcmute.team7.azshop.service.Impl;


import com.hcmute.team7.azshop.DAO.OrdersDAO;
import com.hcmute.team7.azshop.entity.Orders;
import com.hcmute.team7.azshop.service.IOrdersService;

import javax.inject.Inject;
import java.util.List;

public class OrdersServiceImpl implements IOrdersService {  // Update the interface

    @Inject
    private OrdersDAO ordersDAO;  // Update the DAO

    @Override
    public void create(Orders orders) {
        ordersDAO.create(orders);
    }

    @Override
    public void update(Orders orders) {
        ordersDAO.update(orders);
    }

    @Override
    public void softDelete(Long ordersID) {
        ordersDAO.softDelete(ordersID);
    }

    @Override
    public List<Orders> findAll() {
        return ordersDAO.findAll();
    }

    @Override
    public List<Orders> findAll(String keyword, int page, int pageSize) {
        return ordersDAO.findAll(keyword, page, pageSize);
    }

    @Override
    public Orders findById(Long ordersID) {
        return ordersDAO.findById(ordersID);
    }

    @Override
    public Long count() {
        return ordersDAO.countAll();
    }
}
