/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Stock;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

/**
 *
 * @author Nirodya Gamage
 */
public class ShoppingCart {

    Session s;

    public ShoppingCart() {
//        if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }

        s = CreatingConnection.returnSession();
    }

    public ArrayList<CarttItems> addToShoppingCart(DB.Stock st, HttpServletRequest request, HttpServletResponse response, int qty) {
        try {
            HttpSession ses = request.getSession();
            if (ses.getAttribute("cart") != null) {
                System.out.println("not null cart");
                ArrayList<CarttItems> ar = (ArrayList<CarttItems>) ses.getAttribute("cart");
                
                for (CarttItems citems : ar) {
                    if (st.getIdstock()==citems.getStock().getIdstock()) {
                        System.out.println("cart if");
                        citems.setQty(citems.getQty()+qty);
                    }else{
                        Controller.CarttItems ci = new Controller.CarttItems(qty, st);
                        System.out.println("cart else");
                        ar.add(ci);
                        System.out.println("cart else");
                    }
                    System.out.println("cart loop");
                }
               return ar;
            } else {
                System.out.println("cart null");
                ArrayList<CarttItems> ar = new ArrayList<>();
                Controller.CarttItems ci = new Controller.CarttItems(qty, st);
                ar.add(ci);
                return ar;
            }

        } catch (Exception e) {
            return null;
        }
    }

}
