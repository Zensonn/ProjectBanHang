package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.CategoryDAO;
import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.service.ICategoryService;

import javax.inject.Inject;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    @Inject
    private CategoryDAO categoryDAO;

    @Override
    public void create(Category category) {
        categoryDAO.create(category);
    }

    @Override
    public void update(Category category) {
        categoryDAO.update(category);
    }

    @Override
    public void softDelete(Long categoryId) {
        categoryDAO.softDelete(categoryId);
    }

    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public List<Category> findAll(String keyword, int page, int pageSize) {
        return categoryDAO.findAll(keyword, page, pageSize);
    }

    @Override
    public Category findById(Long categoryId) {
        return categoryDAO.findById(categoryId);
    }

    @Override
    public Long count() {
        return categoryDAO.countAll();
    }
}
