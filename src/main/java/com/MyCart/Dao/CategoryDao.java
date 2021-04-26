/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MyCart.Dao;

import com.MyCart.Entities.Category;
import com.MyCart.helper.FactoryProvider;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
       private SessionFactory factory;
       
       public CategoryDao(SessionFactory factory) {
           this.factory = factory;
       }
       public int saveCategory(Category cat) {     //dave the category to DB
           Session session = this.factory.openSession();
           Transaction tx = session.beginTransaction();
           int catid = (int)session.save(cat);
           tx.commit();
           session.close();
           return catid;
       }
       public Category getCategoryById(int catId) {
           Category cat = null;
           Session session = this.factory.openSession();
           Query query = session.createQuery("from Category where categoryId =: c");
           query.setParameter("c", catId);
           cat = (Category)query.uniqueResult();
           session.close();
           return cat;
       }
       public List<Category> getCategories() {
           List<Category> list;
           Session session = this.factory.openSession();
           Query query = session.createQuery("from Category");
           list = query.list();
           session.close();
           return list;
       }
}
