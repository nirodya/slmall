/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import DB.Orders;
import DB.OrdersHasStock;
import DB.Ownership;
import DB.Paymanetmethod;
import DB.Shops;
import DB.Stock;
import DB.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Shop_management {
    Session s;
    public Shop_management(){
//        if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }
    
    public DB.Shops saveShop(String sname,DB.ShopType stype,int stat){
        try {
            Transaction t=s.beginTransaction();
            DB.Shops shop=new DB.Shops();
            shop.setSname(sname);
            shop.setShopType(stype);
            shop.setStatus(stat);
            s.save(shop);
            t.commit();
            return shop;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.ShopType saveSHopType(String type){
        try {
            Criteria c=s.createCriteria(DB.ShopType.class);
            c.add(Restrictions.eq("typeName", type));
            DB.ShopType st=(DB.ShopType) c.uniqueResult();
            if (st==null) {
                Transaction t=s.beginTransaction();
                DB.ShopType sh=new DB.ShopType();
                sh.setTypeName(type);
                s.save(sh);
                t.commit();
                return sh;
            } else {
                return new Controller.Load_Shop_Management().loadShopType(type);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.Ownership saveOwnership(DB.User user,DB.Shops shop){
        try {
            Transaction t=s.beginTransaction();
            DB.Ownership ow=new Ownership();
            ow.setShops(shop);
            ow.setUser(user);
            s.save(ow);
            t.commit();
            return ow;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.Orders saveOreders(String address, String messeage, Paymanetmethod paymethod, Integer qty, Shops shop, User user){
        try {
            Transaction t=s.beginTransaction();
            DB.Orders or=new Orders();
            or.setAddress(address);
            or.setMessage(messeage);
            or.setPaymanetmethod(paymethod);
            or.setQty(qty);
            or.setShops(shop);
            or.setUser(user);
            s.save(or);
            t.commit();
            return or;
            
        } catch (Exception e) {
            return null;
        }
    }
    public DB.OrdersHasStock saveOredersHasStock(Orders order, Stock stock){
        try {
            Transaction t=s.beginTransaction();
            DB.OrdersHasStock ordersHasStock=new OrdersHasStock();
            ordersHasStock.setOrders(order);
            ordersHasStock.setStock(stock);
            s.save(ordersHasStock);
            t.commit();
            return ordersHasStock;
        } catch (Exception e) {
            return null;
        }
    }
    public static void main(String[] args) {
        
    }
    
}
