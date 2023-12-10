package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Product;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
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

    public List<Product> findAll(String keyword, int firstResult, int maxResults, Long storeId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is null");
        }

        List<Product> result = new ArrayList<>();

        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
            Root<Product> root = criteriaQuery.from(Product.class);

            criteriaQuery.select(root);

            List<Predicate> predicates = new ArrayList<>();
            if (keyword != null) {
                Predicate searchPredicate = criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("name")),
                        "%" + keyword.toLowerCase() + "%"
                );
                predicates.add(searchPredicate);
            }
            if (storeId != null) {
                Predicate storePredicate = criteriaBuilder.equal(root.get("store").get("id"), storeId);
                predicates.add(storePredicate);
            }
            criteriaQuery.where(predicates.toArray(new Predicate[0]));

            TypedQuery<Product> query = entityManager.createQuery(criteriaQuery);
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
