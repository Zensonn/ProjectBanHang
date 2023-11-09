package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.StyleValue;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class StyleValueDAO extends Repository<StyleValue> {

    public StyleValueDAO() {
        super(StyleValue.class);
    }

    public void softDelete(Long id) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            StyleValue styleValue = entityManager.find(StyleValue.class, id);
            styleValue.setDeleted(true);
            entityManager.merge(styleValue);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }
}
