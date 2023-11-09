package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Style;
import com.hcmute.team7.azshop.entity.StyleValue;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class StyleDAO extends Repository<Style> {

    public StyleDAO() {
        super(Style.class);
    }

    public void softDelete(Long id) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            Style style = entityManager.find(Style.class, id);

            // Cập nhật các StyleValue có tham chiếu đến Style
            for (StyleValue styleValue : style.getStyleValues()) {
                styleValue.setDeleted(true);
            }
            // Xóa Style
            style.setDeleted(true);

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }
}
