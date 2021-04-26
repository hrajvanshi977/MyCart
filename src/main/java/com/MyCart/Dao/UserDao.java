package com.MyCart.Dao;

import com.MyCart.Entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import java.util.*;
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "from User where user_email =: e and user_password =: p";
            Session session = this.factory.openSession();
            
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user = (User)q.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public int getNumberOfUsers() {
        List<User> list = null;
        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("from User");
            list = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(list == null) return 0;
        return list.size();
    }
}
