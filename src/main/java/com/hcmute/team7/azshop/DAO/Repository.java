package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

public abstract class Repository<T> {
    private final Class<T> entityClass;

    protected Repository(Class<T> cls) {
        this.entityClass = cls;
    }

    public void create(T entity) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(entity);
            //entityManager.merge(entity);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            throw e;
        } finally {
            entityManager.close();
        }
    }

    public void update(T entity) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            throw e;
        } finally {
            entityManager.close();
        }
    }

    public void saveOrUpdate(T entity) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(entity);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            throw e;
        } finally {
            entityManager.close();
        }
    }


    public void delete(Object id) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            T entity = entityManager.find(entityClass, id);
            entityManager.remove(entity);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }

    public T findById(Object id) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        return entityManager.find(entityClass, id);
    }

    public List<T> findAll() {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
            Root<T> root = criteriaQuery.from(entityClass);

            criteriaQuery.select(root);
            return entityManager.createQuery(criteriaQuery).getResultList();
        } finally {
            entityManager.close();
        }
    }

    public Long countAll() {
        EntityManager entityManager = JPAConfig.getEntityManager();
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is null");
        }

        Long result = 0L;

        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
            Root<T> root = criteriaQuery.from(entityClass);

            criteriaQuery.select(criteriaBuilder.count(root));
            Query query = entityManager.createQuery(criteriaQuery);
            result = (Long) query.getSingleResult();
        } catch (Exception e) {
            // Log the exception or notify the user here
            throw e;
        } finally {
            entityManager.close();
        }

        return result;
    }


    public List<T> findAll(int firstResult, int maxResults) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
            Root<T> root = criteriaQuery.from(entityClass);

            criteriaQuery.select(root);

            TypedQuery<T> query = entityManager.createQuery(criteriaQuery);
            query.setFirstResult(firstResult);
            query.setMaxResults(maxResults);

            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    public List<T> findAll(String keyword, int firstResult, int maxResults) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is null");
        }

        List<T> result = new ArrayList<>();

        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(entityClass);
            Root<T> root = criteriaQuery.from(entityClass);

            criteriaQuery.select(root);

            if (keyword != null) {
                Predicate searchPredicate = criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("name")),
                        "%" + keyword.toLowerCase() + "%"
                );
                criteriaQuery.where(searchPredicate);
            }

            TypedQuery<T> query = entityManager.createQuery(criteriaQuery);
            query.setFirstResult((firstResult < 1) ? 0 : (firstResult - 1) * maxResults);
            query.setMaxResults(maxResults);

            result = query.getResultList();
        } catch (Exception e) {
            throw e;
        } finally {
            entityManager.close();
        }
        return result;
    }

}
