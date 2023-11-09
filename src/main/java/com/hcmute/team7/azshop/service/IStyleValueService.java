package com.hcmute.team7.azshop.service;

import com.hcmute.team7.azshop.entity.StyleValue;

import java.util.List;

public interface IStyleValueService {
    void create(StyleValue styleValue);
    void update(StyleValue styleValue);
    void softDelete(Long styleValueId);
    List<StyleValue> findAll(String keyword, int page, int pageSize);
    StyleValue findById(Long styleValueId);
    Long count();
}
