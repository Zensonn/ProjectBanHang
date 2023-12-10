package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.config.JPAConfig;
import com.hcmute.team7.azshop.entity.Orders;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;


public class OrderDAO extends Repository<Orders>{
    public OrderDAO() {
        super(Orders.class);
    }


    // Lấy tất cả các đơn hàng của mỗi cửa hàng
    public List<Orders> findAllOrdersByStore(int firstResult, int maxResults, Long storeId) {
        EntityManager entityManager = JPAConfig.getEntityManager();
        if (entityManager == null) {
            throw new IllegalStateException("EntityManager is null");
        }

        List<Orders> result = new ArrayList<>();

        try {
            CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
            CriteriaQuery<Orders> criteriaQuery = criteriaBuilder.createQuery(Orders.class);
            Root<Orders> root = criteriaQuery.from(Orders.class);

            criteriaQuery.select(root);

            List<Predicate> predicates = new ArrayList<>();
            if (storeId != null) {
                Predicate storePredicate = criteriaBuilder.equal(root.get("store").get("id"), storeId);
                predicates.add(storePredicate);
            }
            criteriaQuery.where(predicates.toArray(new Predicate[0]));

            TypedQuery<Orders> query = entityManager.createQuery(criteriaQuery);
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
