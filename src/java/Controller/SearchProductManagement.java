/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.SubCatogary;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya
 */
public class SearchProductManagement {
    Session s;

    public SearchProductManagement() {
//        if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
        
    }
    public DB.Catogaries searchCategoryOrSave(String cat){
       // s=Connection.Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DB.Catogaries.class);
        c.add(Restrictions.eq("catogariName", cat));
        if (c.uniqueResult()==null) {
            DB.Catogaries ct=new Controller.ProductManagement().saveCatogary(cat);
           // s.flush();
          //  s.close();
            return ct;
        } else {
            DB.Catogaries ct=(DB.Catogaries) c.uniqueResult();
            //s.flush();
           // s.close();
            return ct;
        }
    }
    public List<DB.Catogaries> searchCatogaryAll(){
        //s=Connection.Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DB.Catogaries.class);
        List<DB.Catogaries> l=c.list();
      //  s.flush();
       // s.close();
        return l;
    }
    public List<DB.SubCatogary> searchSubCatogary(DB.Catogaries cat){
        Criteria c=s.createCriteria(DB.SubCatogary.class);
        c.add(Restrictions.eq("catogaries", cat));
        List<DB.SubCatogary> l=c.list();
        return l;
    }
    public List<DB.SubCatogary> searchSubCatogaryAll(){
       // s=Connection.Connection.getSessionFactory().openSession();
        Criteria c=s.createCriteria(DB.SubCatogary.class);
        List<DB.SubCatogary> l=c.list();
       // s.flush();
      //  s.close();
        return l;
    }
    public List<DB.Stock> searchStock(String type,String cat,int id){
       Session s1=Connection.Connection.getSessionFactory().openSession();
        List<DB.Stock> l;
        Criteria c=s1.createCriteria(DB.Stock.class);
        c.add(Restrictions.eq("status", 1));
        if (type.equals("name")) {
            
            
            //c.addOrder(Order.asc("productName"));
            c.addOrder(Order.desc("date"));
            c.setFirstResult(id);
            c.setMaxResults(6);
            l=c.list();
            //s1.flush();
            s1.close();
            return l;
        }else if (type.equals("catogary")) {
            Criteria c1=s1.createCriteria(DB.Catogaries.class);
            c1.add(Restrictions.eq("catogariName", cat));
            DB.Catogaries ctgry=(DB.Catogaries) c1.uniqueResult();
            c.add(Restrictions.eq("catogaries", ctgry));
            l=c.list();
            //s1.flush();
            s1.close();
            return l;
        }
       // s.flush();
       // s.close();
        return null;
    }
    public List<DB.Stock> advanceSearchStock(int cat,int subcat,String productName,int id){
        Session s2=Connection.Connection.getSessionFactory().openSession();
        SearchFilter sf=new SearchFilter();
        if (productName==null||productName.equals("null")) {
            Criteria c=s2.createCriteria(DB.Stock.class);
            c.add(Restrictions.eq("status", 1));
            List<DB.Stock> l=sf.filterStock(cat, subcat, c);
            c.addOrder(Order.desc("date"));
            c.setFirstResult(id);
            c.setMaxResults(6);
            l=c.list();
            //s2.flush();
            s2.close();
            return l;
        }else{
            Criteria c=s2.createCriteria(DB.Stock.class);
            c.add(Restrictions.eq("status", 1));
            c.add(Restrictions.like("productName", "%"+productName+"%"));
            List<DB.Stock> l=sf.filterStock(cat, subcat, c);
            c.addOrder(Order.desc("date"));
            c.setFirstResult(id);
            c.setMaxResults(6);
            l=c.list();
            //s2.flush();
            s2.close();
            return l;
        }
    }
    public List<DB.Stock> searchStockAll(int pagination,int id){
        if (pagination==0) {
            Session s2=Connection.Connection.getSessionFactory().openSession();
        Criteria c=s2.createCriteria(DB.Stock.class);
        c.add(Restrictions.eq("status", 1));
        List<DB.Stock> l=c.list();
        return l;
        }else{
            Session s2=Connection.Connection.getSessionFactory().openSession();
        Criteria c=s2.createCriteria(DB.Stock.class);
        c.addOrder(Order.desc("date"));
        c.setFirstResult(id);
            c.setMaxResults(6);
        List<DB.Stock> l=c.list();
        return l;
        }
        
    }
    public static void main(String[] args) {
       List<DB.SubCatogary> l= new SearchProductManagement().searchSubCatogaryAll();
        for (SubCatogary l1 : l) {
            System.out.println(l1.getSubCatogaryName());
        }
    }
    
    
}
