package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class CartItem implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cartItemId;
    @ElementCollection
    @CollectionTable(joinColumns = @JoinColumn(name = "cart_item_id"))
    private List<Long> styleValueIds;
    @Column(nullable = false)
    private int count;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;
    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @ManyToOne
    @JoinColumn(name = "style_value_id")
    private StyleValue styleValue;
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    public CartItem() {
    }

    public CartItem(Long cartItemId, List<Long> styleValueIds, int count, Date createdAt, Date updatedAt, Cart cart, Product product, StyleValue styleValue) {
        this.cartItemId = cartItemId;
        this.styleValueIds = styleValueIds;
        this.count = count;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.cart = cart;
        this.product = product;
        this.styleValue = styleValue;
    }

    public Long getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Long cartItemId) {
        this.cartItemId = cartItemId;
    }

    public List<Long> getStyleValueIds() {
        return styleValueIds;
    }

    public void setStyleValueIds(List<Long> styleValueIds) {
        this.styleValueIds = styleValueIds;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public StyleValue getStyleValue() {
        return styleValue;
    }

    public void setStyleValue(StyleValue styleValue) {
        this.styleValue = styleValue;
    }
}
