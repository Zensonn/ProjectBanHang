package com.hcmute.team7.azshop.service.Impl;


import com.hcmute.team7.azshop.DAO.ProductDAO;  // Update the import
import com.hcmute.team7.azshop.entity.Product;  // Update the import
import com.hcmute.team7.azshop.service.IProductService;  // Update the import

import javax.inject.Inject;
import java.util.List;

public class ProductServiceImpl implements IProductService {  // Update the interface

    @Inject
    private ProductDAO productDAO;  // Update the DAO

    @Override
    public void create(Product product) {
        product.setPromotionalPrice(product.getPrice() - ((product.getPrice() * product.getPercentDiscount()) / 100));
        productDAO.create(product);
    }

    @Override
    public void update(Product product) {
        product.setPromotionalPrice(product.getPrice() - ((product.getPrice() * product.getPercentDiscount()) / 100));
        productDAO.update(product);
    }

    @Override
    public void softDelete(Long productId) {
        productDAO.softDelete(productId);
    }

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public List<Product> findAll(String keyword, int page, int pageSize) {
        return productDAO.findAll(keyword, page, pageSize);
    }

    @Override
    public Product findById(Long productId) {
        return productDAO.findById(productId);
    }

    @Override
    public Long count() {
        return productDAO.countAll();
    }
}
