package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
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
    @OneToMany(mappedBy = "cartItem", cascade = CascadeType.ALL)
    private Set<StyleValue> styleValues;

    public CartItem() {
    }

    public CartItem(Long id, List<Long> styleValueIds, int count, Date createdAt, Date updatedAt, Cart cart, Product product, Set<StyleValue> styleValues) {
        this.id = id;
        this.styleValueIds = styleValueIds;
        this.count = count;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.cart = cart;
        this.product = product;
        this.styleValues = styleValues;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Set<StyleValue> getStyleValues() {
        return styleValues;
    }

    public void setStyleValues(Set<StyleValue> styleValues) {
        this.styleValues = styleValues;
    }
}
