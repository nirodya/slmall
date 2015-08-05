/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Shops;
import java.util.List;
import java.util.Set;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class LoadProductManager {
    Session s;
    SessionFactory sf;

    public LoadProductManager() {
        
           // s=Connection.Connection.getSessionFactory().openSession();
        
        s=Connection.Connection.getSessionFactory().openSession();
        
    }
    public DB.Stock loadStock(int id){
        try {
            DB.Stock st=(DB.Stock) s.load(DB.Stock.class, id);
           // s.close();
            return st;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.SubCatogary loadSubcatogary(int id){
        try {
            DB.SubCatogary sctgry=(DB.SubCatogary) s.load(DB.SubCatogary.class, id);
            return sctgry;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.Catogaries loadCatogary(int id){
        try {
            DB.Catogaries sctgry=(DB.Catogaries) s.load(DB.Catogaries.class, id);
            return sctgry;
        } catch (Exception e) {
            return null;
        }
    }
    public List<DB.ShopsHasStock> loadShophasStock(Shops shp,int pagination){
        try {
            Criteria c=s.createCriteria(DB.ShopsHasStock.class);
            c.add(Restrictions.eq("shops", shp));
            
            
            c.setFirstResult(pagination);
            c.setMaxResults(6);
            List<DB.ShopsHasStock> lshp=c.list();
            return lshp;
        } catch (Exception e) {
            return null;
        }
    }
    
}
