package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Category;

import java.util.List;

public interface ICategoryService {
    void create(Category category);
    void update(Category category);
    void softDelete(Long categoryId);
    List<Category> findAll();
    List<Category> findAll(String keyword, int page, int pageSize);
    Category findById(Long categoryId);
    Long count();
}
