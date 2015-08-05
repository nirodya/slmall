/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Search_Shop_management {
    Session s;
    public Search_Shop_management(){
//       if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
       
        s=Connection.Connection.getSessionFactory().openSession();
    }
    public List<DB.ShopType> searchShopTypeAll(){
        try {
           // s=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s.createCriteria(DB.ShopType.class);
            List<DB.ShopType> l=c.list();
           // s.close();
            return l;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.Shops searchShopbyId(int id){
        try {
            // s=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s.createCriteria(DB.Shops.class);
            c.add(Restrictions.eq("idShops", id));
            DB.Shops sh=(DB.Shops) c.uniqueResult();
            //s.close();
            return sh;
        } catch (Exception e) {
            return null;
        }
    }
}
