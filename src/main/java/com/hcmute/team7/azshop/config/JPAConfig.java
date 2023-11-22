package com.hcmute.team7.azshop.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAConfig {
    private static EntityManagerFactory emf;

    public static EntityManager getEntityManager() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("default");
        }
        return emf.createEntityManager();
    }

    public static void shutdown() {
        if (emf != null) {
            emf.close();
        }
    }
}

