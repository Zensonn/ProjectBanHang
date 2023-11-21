package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Orders;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.Style;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
public class OrdersDAO extends Repository<Orders>{
    public OrdersDAO() {
        super(Orders.class);
    }

    public void softDelete(Long ordersId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            Orders orders = entityManager.find(Orders.class, ordersId);

            // Soft delete Styles and the Product

//            orders.setSelling(true);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }
}
