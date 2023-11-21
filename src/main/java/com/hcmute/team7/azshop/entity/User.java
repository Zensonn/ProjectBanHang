package com.hcmute.team7.azshop.entity;

import com.hcmute.team7.azshop.entity.TypeData.Role;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "nvarchar(255)", nullable = false)
    private String userName;
    @Column(columnDefinition = "nvarchar(255)", nullable = false)
    private String fullName;
    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private String phone;
    private String code;
    private Boolean isEmailActive = false;
    @Column(nullable = false)
    private String password;
    @Enumerated(EnumType.STRING)
    private Role role;
    @Column(columnDefinition = "nvarchar(1000)")
    private String addresses;
    private String avatar;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @OneToOne(mappedBy = "user")
    private Store store;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Transaction> transactions;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Cart> carts;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Orders> orders;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Review> reviews;
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    public User() {
    }

    public User(String userName, String fullName, String email, String code) {
        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.code = code;
    }

    public User(String userName, String fullName, String email, String code, Boolean isEmailActive, String password, Role role) {
        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.code = code;
        this.isEmailActive = isEmailActive;
        this.password = password;
        this.role = role;
    }

    public User(Long id, String userName, String fullName, String email, String phone, String code, Boolean isEmailActive, String password, Role role, String addresses, String avatar, Date createdAt, Date updatedAt, Store store, Set<Transaction> transactions, Set<Cart> carts, Set<Orders> orders, Set<Review> reviews) {
        this.id = id;
        this.userName = userName;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.code = code;
        this.isEmailActive = isEmailActive;
        this.password = password;
        this.role = role;
        this.addresses = addresses;
        this.avatar = avatar;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.store = store;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Boolean getEmailActive() {
        return isEmailActive;
    }

    public void setEmailActive(Boolean emailActive) {
        isEmailActive = emailActive;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getAddresses() {
        return addresses;
    }

    public void setAddresses(String addresses) {
        this.addresses = addresses;
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

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
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

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }
}
