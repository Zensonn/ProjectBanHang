package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.*;
import com.hcmute.team7.azshop.entity.*;
import com.hcmute.team7.azshop.enums.Status;
import com.hcmute.team7.azshop.service.IOrderService;

import javax.inject.Inject;
import javax.persistence.EntityTransaction;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

public class OrderServiceImpl implements IOrderService {

    @Inject
    private OrderDAO orderDAO;
    @Inject
    private OrderItemDAO orderItemDAO;
    @Inject
    private CartDAO cartDAO;
    @Inject
    private CartItemDAO cartItemDAO;
    @Inject
    private StoreDAO storeDAO;

    @Override
    public void create(Cart cart, Long storeId) {
        Store store = storeDAO.findById(storeId);

        if (store == null) {
            throw new RuntimeException("Store with ID " + storeId + " not found.");
        }

        Orders order = new Orders();
        order.setStatus(Status.PENDING);
        order.setCreatedAt(new Date());
        order.setUser(cart.getUser());
        order.setTotalPrice(cart.getTotalMoney());
        order.setStore(store);

        List<OrderItem> orderItemList = new ArrayList<>();
        for (CartItem item : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrders(order);
            orderItem.setCount(item.getQuantity());
            orderItem.setProduct(item.getProduct());
            orderItem.setUnitPrice(item.getProduct().getPrice());
            // Tạo OrderItem và thêm vào danh sách
            orderItemDAO.create(orderItem);
            orderItemList.add(orderItem);
            // Update inventory here if necessary
            // Xóa CartItem sau khi đã tạo OrderItem
            cartItemDAO.delete(item);
        }

        order.setOrderItems(orderItemList);

        // Cập nhật Cart để đặt lại giá trị
        cart.setCartItems(new HashSet<>());
        cart.setTotalItem(0);
        cart.setTotalMoney(0);
        cartDAO.update(cart);

        // Tạo Order mới
        orderDAO.create(order);
    }

    @Override
    public List<Orders> findAllOrdersByStore(int firstResult, int maxResults, Long storeId) {
        return orderDAO.findAllOrdersByStore(firstResult, maxResults, storeId);
    }

    @Override
    public void acceptOrder(Long id) {
        Orders order = orderDAO.findById(id);
        order.setStatus(Status.SHIPPING);
        orderDAO.update(order);
    }

    @Override
    public void cancelOrder(Long id) {
        orderDAO.delete(id);
    }

    @Override
    public void completeOrder(Long id) {
        Orders order = orderDAO.findById(id);
        order.setStatus(Status.COMPLETED);
        order.setPaid(true);
        orderDAO.update(order);
    }
}
