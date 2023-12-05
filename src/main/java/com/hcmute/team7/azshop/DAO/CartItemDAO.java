package com.hcmute.team7.azshop.DAO;

import com.hcmute.team7.azshop.entity.Cart;
import com.hcmute.team7.azshop.entity.CartItem;

public class CartItemDAO extends Repository<CartItem> {
    public CartItemDAO() {
        super(CartItem.class);
    }
}
