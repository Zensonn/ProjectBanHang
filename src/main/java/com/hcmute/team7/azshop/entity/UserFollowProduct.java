package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class UserFollowProduct implements Serializable {
    @EmbeddedId
    private UserFollowProductKey id = new UserFollowProductKey();
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false)
    private Date createdAt;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    public UserFollowProduct() {
    }

    public UserFollowProduct(UserFollowProductKey id, Date createdAt, Date updatedAt) {
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public UserFollowProductKey getId() {
        return id;
    }

    public void setId(UserFollowProductKey id) {
        this.id = id;
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
}
