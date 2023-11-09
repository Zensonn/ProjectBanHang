package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Style;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

public class CategoryDAO extends Repository<Category> {

    public CategoryDAO() {
        super(Category.class);
    }

    public void softDelete(Long categoryId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            Category category = entityManager.find(Category.class, categoryId);
            // Sử dụng truy vấn JPQL để cập nhật isDeleted của StyleValue liên quan
            Query updateQuery = entityManager.createQuery("UPDATE StyleValue sv SET sv.isDeleted = true WHERE sv.style.category = :category");
            updateQuery.setParameter("category", category);
            updateQuery.executeUpdate();

            // Cập nhật isDeleted của Style và Category
            for (Style style : category.getStyles()) {
                style.setDeleted(true);
            }
            category.setDeleted(true);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }


}
