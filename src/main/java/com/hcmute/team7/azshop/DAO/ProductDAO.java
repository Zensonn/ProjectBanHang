package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.Style;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
public class ProductDAO extends Repository<Product>{
    public ProductDAO() {
        super(Product.class);
    }

    public void softDelete(Long productId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            Product product = entityManager.find(Product.class, productId);

            // Soft delete Styles and the Product

            product.setSelling(true);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }
}
