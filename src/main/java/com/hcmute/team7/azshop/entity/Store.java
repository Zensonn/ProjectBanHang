package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(columnDefinition = "nvarchar(255)", unique = true, nullable = false)
    private String name;
    @Column(columnDefinition = "nvarchar(1000)", nullable = false)
    private String bio;
    private Boolean isActive = false;
    private String avatar;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
    private Set<Product> products;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
    private Set<Transaction> transactions;
    @OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
    private Set<Cart> carts;
    @OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
    private Set<Orders> orders;
    @OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
    private List<Review> reviews;

    public Store() {
    }

    public Store(Long id, String name, String bio, Boolean isActive, String avatar, Date createdAt, Date updatedAt, Set<Product> products, User user, Set<Transaction> transactions, Set<Cart> carts, Set<Orders> orders, List<Review> reviews) {
        this.id = id;
        this.name = name;
        this.bio = bio;
        this.isActive = isActive;
        this.avatar = avatar;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.products = products;
        this.user = user;
        this.transactions = transactions;
        this.carts = carts;
        this.orders = orders;
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

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(Set<Transaction> transactions) {
        this.transactions = transactions;
    }

    public Set<Cart> getCarts() {
        return carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}
