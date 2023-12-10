package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.User;

import javax.persistence.*;

public class UserDAO extends Repository<User> {
    public UserDAO() {
        super(User.class);
    }

    // Hàm dùng để tạo user khi đăng ký tài khoản
    public void Register(User user) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(user);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            throw e;
        } finally {
            entityManager.close();
        }
    }

    public User findByEmail(String email) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            return entityManager.createQuery(jpql, User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            // Xử lý trường hợp không tìm thấy kết quả
            return null;
        } finally {
            entityManager.close();
        }
    }


    public boolean checkExistEmail(String email) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            Query query = entityManager.createQuery(jpql);
            query.setParameter("email", email);

            query.getSingleResult();

            return true;
        } catch (NoResultException e) {
            return false;
        }
    }

    public boolean checkExistUserName(String userName) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.userName = :userName";
            Query query = entityManager.createQuery(jpql);
            query.setParameter("userName", userName);

            query.getSingleResult();

            return true;
        } catch (NoResultException e) {
            return false;
        }
    }

    // Hàm kích hoạt tài khoản
    public void updateEmailActive(String email) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            User user = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();

            if (user != null) {
                user.setEmailActive(true);
                entityManager.merge(user);
                transaction.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            throw e;
        } finally {
            entityManager.close();
        }
    }
}
