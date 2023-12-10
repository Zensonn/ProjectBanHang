package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.entity.OrderItem;

public class OrderItemDAO extends Repository<OrderItem> {
    protected OrderItemDAO() {
        super(OrderItem.class);
    }
}
