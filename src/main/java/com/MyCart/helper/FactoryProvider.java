package com.MyCart.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory sessionFactory;
    
    public static SessionFactory getFactory() {
        try {
            if(sessionFactory == null) {
              Configuration config = new Configuration();
              config.configure("hibernate.cfg.xml");
              sessionFactory = config.buildSessionFactory();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sessionFactory;
    }
}
