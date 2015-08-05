/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya
 */
public class ProductManagement {
    Session s;

    public ProductManagement() {
       
            //s=Connection.Connection.getSessionFactory().openSession();
        
        s=Connection.Connection.getSessionFactory().openSession();
        
    }
    public DB.Catogaries saveCatogary(String catname){
        Transaction t=s.beginTransaction();
        DB.Catogaries c=new DB.Catogaries();
        c.setCatogariName(catname);
        s.save(c);
        t.commit();
        return c;
    }
    public DB.Stock saveStock(int qty,double sprice,double disprice,String pname,String pcode,String imgpath,String des,DB.Catogaries cat,DB.SubCatogary scat){
        Transaction t=s.beginTransaction();
        DB.Catogaries ct=(DB.Catogaries) s.load(DB.Catogaries.class, cat.getIdcatogaries());
        DB.SubCatogary sct=(DB.SubCatogary) s.load(DB.SubCatogary.class, scat.getIdSubCatogary());
        DB.Stock st=new DB.Stock();
        st.setCatogaries(ct);
        st.setSubCatogary(sct);
        st.setDate(new Date());
        st.setDescription(des);
        st.setDiscountPrice(disprice);
        st.setImage(imgpath);
        st.setProductCode(pcode);
        st.setProductName(pname);
        st.setQty(qty);
        st.setStatus(1);
        st.setSellingPrice(sprice);
        s.save(st);
        t.commit();
        return st;
    }
    public DB.ShopsHasStock saveShopHasStock(DB.Shops shp,DB.Stock stock){
        Transaction t=s.beginTransaction();
        DB.ShopsHasStock shs=new DB.ShopsHasStock();
        shs.setShops(shp);
        shs.setStock(stock);
        s.save(shs);
        t.commit();
        return shs;
    }
    public void done(){
        DB.SubCatogary sctgry=(DB.SubCatogary) s.load(DB.SubCatogary.class, Integer.parseInt("1"));
        DB.Catogaries ct=(DB.Catogaries) s.load(DB.Catogaries.class, 1);
        saveStock(1500, 1000, 500, null, null, null, null, ct, sctgry);
    }
    public static void main(String[] args) {
        Controller.SearchProductManagement spm=new Controller.SearchProductManagement();
                Controller.LoadProductManager lpm=new Controller.LoadProductManager();
                System.out.println("1");
                Controller.ProductManagement pm=new Controller.ProductManagement();
                 System.out.println("2");
                DB.Catogaries catog=spm.searchCategoryOrSave("Electronics");
                 System.out.println("3");
                DB.SubCatogary sbctgry=lpm.loadSubcatogary(Integer.parseInt("1"));
                
                 System.out.println("4");
        //Controller.ProductManagement pm=new Controller.ProductManagement();
        pm.done();
    }
    
    
}
