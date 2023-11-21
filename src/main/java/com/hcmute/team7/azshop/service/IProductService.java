package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Product;

import java.util.List;

public interface IProductService {
    void create(Product product);
    void update(Product product);
    void softDelete(Long productId);
    List<Product> findAll();
    List<Product> findAll(String keyword, int page, int pageSize);
    Product findById(Long productId);
    Long count();
}
