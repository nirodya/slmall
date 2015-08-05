/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Catogaries;
import DB.SubCatogary;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
public class UpdateProductManagement {
    

   
    
    public DB.Stock updateStock(int sid, Catogaries cat, String desc, Double dprice, String img, String pcode, String pname, Integer qty, Double sprice, SubCatogary subcat){
        try {
            Session ss=Connection.Connection.getSessionFactory().openSession();
            DB.Stock st= (DB.Stock) ss.load(DB.Stock.class, sid);
            Transaction t=ss.beginTransaction();
            st.setCatogaries(cat);
            st.setDescription(desc);
            st.setDiscountPrice(dprice);
            st.setImage(img);
            st.setProductCode(pcode);
            st.setProductName(pname);
            st.setQty(qty);
            st.setSellingPrice(sprice);
            st.setStatus(1);
            st.setSubCatogary(subcat);
            ss.update(st);
            t.commit();
            ss.close();
            return st;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        Session ss=Connection.Connection.getSessionFactory().openSession();
        DB.Stock st= (DB.Stock) ss.load(DB.Stock.class, 12);
            Transaction t=ss.beginTransaction();
            st.setProductCode("ho2892852");
            ss.update(st);
            t.commit();
    }
    
}
