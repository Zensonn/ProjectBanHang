package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.Category;
import com.hcmute.team7.azshop.entity.Style;

import java.util.List;

public interface IStyleService {
    void create(Style style);
    void update(Style style);
    void softDelete(Long styleId);
    List<Style> findAll();
    List<Style> findAll(String keyword, int page, int pageSize);
    Style findById(Long styleId);
    Long count();
}
