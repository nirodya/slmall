/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
public class Update_Shop_Management {
    Session s;

    public Update_Shop_Management() {
//     if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }
    public DB.Shops updateShops(String sname,DB.ShopType stype,int shpid){
        try {
            Transaction t=s.beginTransaction();
            DB.Shops shps=(DB.Shops) s.load(DB.Shops.class, shpid);
            shps.setShopType(stype);
            shps.setSname(sname);
            s.update(shps);
            t.commit();
            return shps;
        } catch (Exception e) {
            return null;
        }
    }
    
    
}
