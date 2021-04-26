package com.MyCart.Dao;
import com.MyCart.Entities.Product;
import com.MyCart.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.query.Query;


public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean flag = false;
        try {
            Session session = FactoryProvider.getFactory().openSession();
            Transaction txc = session.beginTransaction();
            session.save(product);
            txc.commit();
            session.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<Product> getProducts() {
        List<Product> list;
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        list = query.list();
        session.close();
        return list;
    }

    public List<Product> getProductsByCategoryId(int catId) {
        List<Product> list = null;
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId =: c");
        query.setParameter("c", catId);
        list = query.list();
        session.close();
        return list;
    }
}
