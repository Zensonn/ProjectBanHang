package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ElementCollection
    @CollectionTable(joinColumns = @JoinColumn(name = "order_item_id"))
    private List<Long> styleValueIds;
    @Column(nullable = false)
    private int count;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Orders orders;
    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @OneToMany(mappedBy = "orderItem")
    private Set<StyleValue> styleValues;

    public OrderItem() {
    }

    public OrderItem(Long id, List<Long> styleValueIds, int count, Date createdAt, Date updatedAt, Orders orders, Product product, Set<StyleValue> styleValues) {
        this.id = id;
        this.styleValueIds = styleValueIds;
        this.count = count;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.orders = orders;
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

    public Orders getOrder() {
        return orders;
    }

    public void setOrder(Orders orders) {
        this.orders = orders;
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
