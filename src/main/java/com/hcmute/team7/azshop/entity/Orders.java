package com.hcmute.team7.azshop.entity;

import com.hcmute.team7.azshop.entity.TypeData.Status;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(columnDefinition = "nvarchar(1000)", nullable = false)
    private String address;
    @Column(nullable = false)
    private String phone;
    @Enumerated(EnumType.STRING)
    private Status status;
    private Boolean isPaid = false;
    @Column(nullable = false)
    private Double amountFromUser;
    @Column(nullable = false)
    private Double amountFromStore;
    @Column(nullable = false)
    private Double amountToStore;
    @Column(nullable = false)
    private Double amountToGD;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;
    @OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
    private Set<OrderItem> orderItems;
    @OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
    private List<Review> reviews;
    @OneToOne
    @JoinColumn(name = "delivery_id")
    private Delivery delivery;

    public Orders() {
    }

    public Orders(Long id, String address, String phone, Status status, Boolean isPaid, Double amountFromUser, Double amountFromStore, Double amountToStore, Double amountToGD, Date createdAt, Date updatedAt, User user, Store store, Set<OrderItem> orderItems, List<Review> reviews, Delivery delivery) {
        this.id = id;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.isPaid = isPaid;
        this.amountFromUser = amountFromUser;
        this.amountFromStore = amountFromStore;
        this.amountToStore = amountToStore;
        this.amountToGD = amountToGD;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user = user;
        this.store = store;
        this.orderItems = orderItems;
        this.reviews = reviews;
        this.delivery = delivery;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Boolean getPaid() {
        return isPaid;
    }

    public void setPaid(Boolean paid) {
        isPaid = paid;
    }

    public Double getAmountFromUser() {
        return amountFromUser;
    }

    public void setAmountFromUser(Double amountFromUser) {
        this.amountFromUser = amountFromUser;
    }

    public Double getAmountFromStore() {
        return amountFromStore;
    }

    public void setAmountFromStore(Double amountFromStore) {
        this.amountFromStore = amountFromStore;
    }

    public Double getAmountToStore() {
        return amountToStore;
    }

    public void setAmountToStore(Double amountToStore) {
        this.amountToStore = amountToStore;
    }

    public Double getAmountToGD() {
        return amountToGD;
    }

    public void setAmountToGD(Double amountToGD) {
        this.amountToGD = amountToGD;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public Delivery getDelivery() {
        return delivery;
    }

    public void setDelivery(Delivery delivery) {
        this.delivery = delivery;
    }
}
