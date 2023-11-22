package com.hcmute.team7.azshop.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class UserFollowStore implements Serializable {
    @EmbeddedId
    private UserFollowStoreKey id = new UserFollowStoreKey();
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

    public UserFollowStore() {
    }

    public UserFollowStore(UserFollowStoreKey id, Date createdAt, Date updatedAt) {
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public UserFollowStoreKey getId() {
        return id;
    }

    public void setId(UserFollowStoreKey id) {
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
