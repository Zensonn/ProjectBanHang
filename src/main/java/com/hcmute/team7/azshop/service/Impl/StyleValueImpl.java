package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.StyleValueDAO;
import com.hcmute.team7.azshop.entity.StyleValue;
import com.hcmute.team7.azshop.service.IStyleValueService;

import javax.inject.Inject;
import java.util.List;

public class StyleValueImpl implements IStyleValueService {

    @Inject
    private StyleValueDAO styleValueDAO;

    @Override
    public void create(StyleValue styleValue) {
        styleValueDAO.create(styleValue);
    }

    @Override
    public void update(StyleValue styleValue) {
        styleValueDAO.update(styleValue);
    }

    @Override
    public void softDelete(Long styleValueId) {
        styleValueDAO.softDelete(styleValueId);
    }

    @Override
    public List<StyleValue> findAll(String keyword, int page, int pageSize) {
        return styleValueDAO.findAll(keyword, page, pageSize);
    }

    @Override
    public StyleValue findById(Long styleValueId) {
        return styleValueDAO.findById(styleValueId);
    }

    @Override
    public Long count() {
        return styleValueDAO.countAll();
    }
}
