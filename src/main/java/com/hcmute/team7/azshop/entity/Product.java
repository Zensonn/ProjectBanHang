package com.hcmute.team7.azshop.entity;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Where(clause = "isSelling = false")
public class Product implements Serializable {
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
    private int percentDiscount;
    @Column(nullable = false)
    private int quantity;
    private int sold;
    private boolean isSelling = false;
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
    @JoinColumn(name = "style_id")
    private Style style;
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;
    @OneToMany(mappedBy = "product")
    private List<CartItem> cartItems;
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

    public Product(Long id, String name, String description, int price, int promotionalPrice, int percentDiscount, int quantity, int sold, boolean isSelling, String image, Date createdAt, Date updatedAt, Category category, Style style, Store store, List<CartItem> cartItem, OrderItem orderItem, List<Review> reviews) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.promotionalPrice = promotionalPrice;
        this.percentDiscount = percentDiscount;
        this.quantity = quantity;
        this.sold = sold;
        this.isSelling = isSelling;
        this.image = image;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.category = category;
        this.style = style;
        this.store = store;
        this.cartItems = cartItem;
        this.orderItem = orderItem;
        this.reviews = reviews;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPromotionalPrice() {
        return promotionalPrice;
    }

    public void setPromotionalPrice(int promotionalPrice) {
        this.promotionalPrice = promotionalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public boolean isSelling() {
        return isSelling;
    }

    public void setSelling(boolean selling) {
        isSelling = selling;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public OrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public int getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(int percentDiscount) {
        this.percentDiscount = percentDiscount;
    }
}