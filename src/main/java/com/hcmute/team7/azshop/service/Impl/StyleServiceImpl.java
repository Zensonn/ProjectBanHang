package com.hcmute.team7.azshop.service.Impl;

import com.hcmute.team7.azshop.DAO.StyleDAO;
import com.hcmute.team7.azshop.entity.Style;
import com.hcmute.team7.azshop.service.IStyleService;

import javax.inject.Inject;
import java.util.List;

public class StyleServiceImpl implements IStyleService {
    @Inject
    private StyleDAO styleDAO;

    @Override
    public void create(Style style) {
        styleDAO.create(style);
    }

    @Override
    public void update(Style style) {
        styleDAO.update(style);
    }

    @Override
    public void softDelete(Long styleId) {
        styleDAO.softDelete(styleId);
    }

    @Override
    public List<Style> findAll() {
        return styleDAO.findAll();
    }

    @Override
    public List<Style> findAll(String keyword, int page, int pageSize) {
        return styleDAO.findAll(keyword, page, pageSize);
    }

    @Override
    public Style findById(Long styleId) {
        return styleDAO.findById(styleId);
    }

    @Override
    public Long count() {
        return styleDAO.countAll();
    }
}
