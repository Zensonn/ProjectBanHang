package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Product;
import com.hcmute.team7.azshop.entity.Store;

import java.util.List;

public interface IProductService {
    void create(Product product, Store store);
    void update(Product product, Store store);
    void softDelete(Long productId);
    List<Product> findAll();
    List<Product> findAll(String keyword, int page, int pageSize, Long storeId);
    Product findById(Long productId);
    Long count();
}
