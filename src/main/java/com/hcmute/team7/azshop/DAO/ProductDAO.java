package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.Style;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.util.List;

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
    public List<Product> findByCategoryId(Long categoryId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
            Root<Product> root = criteriaQuery.from(Product.class);

            // Add a Predicate to filter based on category_id
            if (categoryId != null) {
                Join<Product, Category> categoryJoin = root.join("category"); // Assuming there is a field named "category" in your entity
                Predicate categoryPredicate = criteriaBuilder.equal(categoryJoin.get("id"), categoryId);
                criteriaQuery.where(categoryPredicate);
            }

            criteriaQuery.select(root);
            return entityManager.createQuery(criteriaQuery).getResultList();
        } finally {
            entityManager.close();
        }
    }
}