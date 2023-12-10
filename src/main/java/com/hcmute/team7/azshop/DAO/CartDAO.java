package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.entity.Cart;

public class CartDAO extends Repository<Cart> {
    public CartDAO() {
        super(Cart.class);
    }
}
