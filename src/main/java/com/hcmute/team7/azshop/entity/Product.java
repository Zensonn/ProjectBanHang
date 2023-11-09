package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "nvarchar(255)", nullable = false)
    private String name;
    @Column(columnDefinition = "nvarchar(1000)", nullable = false)
    private String description;
    @Column(nullable = false)
    private int price;
    @Column(nullable = false)
    private int promotionalPrice;
    @Column(nullable = false)
    private int quantity;
    private int sold;
    private boolean isSelling = true;
    private String image;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    @ManyToOne
    @JoinColumn(name = "style_value_id")
    private StyleValue styleValue;
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;
    @OneToOne(mappedBy = "product")
    private CartItem cartItem;
    @OneToOne(mappedBy = "product")
    private OrderItem orderItem;
    @OneToMany(mappedBy = "product")
    private List<Review> reviews;
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    public Product() {
    }

}
