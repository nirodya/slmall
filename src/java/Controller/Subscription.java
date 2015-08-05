/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Shops;
import DB.Subcription;
import DB.SubcriptionHasStock;
import DB.User;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Subscription {
    
    public DB.Subcription saveSubscription(Shops shps, User user){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            Transaction t=s.beginTransaction();
            DB.Subcription su=new Subcription();
            su.setShops(shps);
            su.setUser(user);
            s.save(su);
            t.commit();
            s.close();
            return su;
        } catch (Exception e) {
            return null;
        }
    }
    public void unSubscribe(Subcription su){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            Transaction t=s.beginTransaction();
            DB.Subcription sbp=(DB.Subcription) s.load(DB.Subcription.class, su);
            s.delete(sbp);
            s.close();
            t.commit();
        } catch (Exception e) {
        }
    }
    public boolean searchSubcription(User user,Shops shp){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            
            Criteria c=s.createCriteria(DB.Subcription.class);
            c.add(Restrictions.eq("user", user));
            c.add(Restrictions.eq("shops", shp));
            DB.Subcription sbp=(DB.Subcription) c.uniqueResult();
            s.close();
            if (sbp!=null) {
                return false;
            }else{
                return true;
            }
        } catch (Exception e) {
            return false;
        }
    }
    
    public DB.Subcription checkSubcriptionStatus(User user,Shops shp){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            
            Criteria c=s.createCriteria(DB.Subcription.class);
            c.add(Restrictions.eq("user", user));
            c.add(Restrictions.eq("shops", shp));
            DB.Subcription sbp=(DB.Subcription) c.uniqueResult();
            s.close();
            if (sbp!=null) {
                return sbp;
            }else{
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }
    
    public void processSubscribe(DB.Stock st,DB.Subcription sub){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s.createCriteria(DB.SubcriptionHasStock.class);
            c.add(Restrictions.eq("stock", st));
            c.add(Restrictions.eq("subcription", sub));
            DB.SubcriptionHasStock sbshs=(DB.SubcriptionHasStock) c.uniqueResult();
            if (sbshs==null) {
                Transaction t=s.beginTransaction();
                DB.SubcriptionHasStock subcriptionHasStock=new SubcriptionHasStock();
                subcriptionHasStock.setStock(st);
                subcriptionHasStock.setSubcription(sub);
                subcriptionHasStock.setUserStatus(1);
                s.save(subcriptionHasStock);
                t.commit();
                
            }
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Subcription> getSubcriptionFromUsers(DB.User u){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s.createCriteria(DB.Subcription.class);
            c.add(Restrictions.eq("user", u));
            List<DB.Subcription> l=c.list();
            s.close();
            return l;
            
        } catch (Exception e) {
            return null;
        }
    }
    public List<DB.Subcription> getSubscribedUsers(Shops shps){
        try {
            Session s=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s.createCriteria(DB.Subcription.class);
            c.add(Restrictions.eq("shops", shps));
            List<DB.Subcription> l=c.list();
            s.close();
            return l;
        } catch (Exception e) {
            return null;
        }
    }
    
}
