/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Cart;
import DB.CartItems;
import DB.Orders;
import DB.OrdersHasStock;
import DB.Paymanetmethod;
import DB.Shops;
import DB.Stock;
import DB.User;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.DB2390Dialect;

/**
 *
 * @author Nirodya Gamage
 */
public class Cart_Management {

    private final Session s;

    public Cart_Management() {
        s = Connection.Connection.getSessionFactory().openSession();
    }

    public DB.Cart loadCart(User user) {
        try {
            Criteria c = s.createCriteria(DB.Cart.class);
            c.add(Restrictions.eq("user", user));
            DB.Cart crt = (DB.Cart) c.uniqueResult();
            return crt;
        } catch (Exception e) {
            return null;
        }
    }

    public List<DB.CartItems> laodCartItems(DB.Cart cart) {
        try {
            Criteria c = s.createCriteria(DB.CartItems.class);
            c.add(Restrictions.eq("cart", cart));
            List<DB.CartItems> l = c.list();
            return l;
        } catch (Exception e) {
            return null;
        }
    }
    public void closeSession(){
        s.close();
    }

    public void removeCart(int cartid) {
        try {
            DB.Cart c = (DB.Cart) s.load(DB.Cart.class, cartid);
            Transaction t = s.beginTransaction();
            s.delete(c);
            t.commit();
        } catch (Exception e) {
        }
    }

    public void removeCartItem(int crt) {
        try {
            DB.CartItems crtit = (DB.CartItems) s.load(DB.CartItems.class, crt);
            Transaction t = s.beginTransaction();
            s.delete(crtit);
            t.commit();
        } catch (Exception e) {
        }
    }

    public DB.Cart saveCart(User user) {
        try {
            Criteria cr=s.createCriteria(DB.Cart.class);
            cr.add(Restrictions.eq("user", user));
            DB.Cart ca=(DB.Cart) cr.uniqueResult();
            DB.Cart c;
            if (ca==null) {
                Transaction t = s.beginTransaction();
            c = new Cart();
            c.setDate(new Date());
            c.setUser(user);
            s.save(c);
            t.commit();
            }else{
                c=ca;
            }
            
            return c;
        } catch (Exception e) {
            return null;
        }
    }

    public DB.CartItems saveCartItems(Cart cart, Stock stock, Integer qty) {
        try {
            Transaction t = s.beginTransaction();
            DB.CartItems ci = new CartItems();
            ci.setCart(cart);
            ci.setStock(stock);
            ci.setQty(qty);
            s.save(ci);
            t.commit();
            return ci;
        } catch (Exception e) {
            return null;
        }
    }

    public DB.CartItems updateCartQty(int cid, Integer qty) {
        try {
            Transaction t = s.beginTransaction();
            DB.CartItems ct = (DB.CartItems) s.load(DB.CartItems.class, cid);
            ct.setQty(qty);
            s.update(ct);
            t.commit();
            return ct;
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

}
