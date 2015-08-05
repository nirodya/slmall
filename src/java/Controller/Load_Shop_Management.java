/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Load_Shop_Management {
    Session s;
    public Load_Shop_Management(){
//        if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }
    public DB.ShopType loadShopType(String tname){
        try {
            Criteria c=s.createCriteria(DB.ShopType.class);
            c.add(Restrictions.eq("typeName", tname));
            DB.ShopType st=(DB.ShopType) c.uniqueResult();
            DB.ShopType st1=(DB.ShopType) s.load(DB.ShopType.class, st.getIdshopType());
            return st1;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.Shops loadShops(int id){
        try {
            DB.Shops shp=(DB.Shops) s.load(DB.Shops.class, id);
            return shp;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
}
