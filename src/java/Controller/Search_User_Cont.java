/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Search_User_Cont {

    Session s;
    SessionFactory sf;

    public Search_User_Cont() {
//        sf = Connection.Connection.getSessionFactory();
//        if (s==null) {
//        s = sf.openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }
    
    public DB.User searchUser(int id){
        try {
            Criteria c=s.createCriteria(DB.User.class);
            c.add(Restrictions.eq("iduser", id));
            DB.User u=(DB.User) c.uniqueResult();
            return u;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.City searchCity(String city){
        try {
            Criteria c=s.createCriteria(DB.City.class);
            c.add(Restrictions.eq("cityName", city));
            DB.City cty=(DB.City) c.uniqueResult();
            return cty;
        } catch (Exception e) {
            return null;
        }
    }
    public List<DB.City> searchCityAll(){
        try {
            Criteria c=s.createCriteria(DB.City.class);
            List<DB.City> l=c.list();
            return l;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.District searchDistrict(String dist){
        try {
            Criteria c=s.createCriteria(DB.District.class);
            c.add(Restrictions.eq("districtName", dist));
            DB.District d=(DB.District) c.uniqueResult();
            return d;
        } catch (Exception e) {
            return null;
        }
    }
    public List<DB.District> searchDistrictAll(){
        try {
            Criteria c=s.createCriteria(DB.District.class);
            List<DB.District> l=c.list();
            return l;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public List<DB.Province> searchProvince(){
        try {
            Criteria c=s.createCriteria(DB.Province.class);
            List<DB.Province> l=c.list();
            return l;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.Province searchProvinceOnce(String prov){
        try {
            Criteria c=s.createCriteria(DB.Province.class);
            c.add(Restrictions.eq("provinceName", prov));
            DB.Province pr=(DB.Province) c.uniqueResult();
            return pr;
        } catch (Exception e) {
            return null;
        }
    }
    
    public DB.PostalCode searchPostalCode(String city){
        try {
            Load_User_Cont uc=new Load_User_Cont();
            DB.City cit=uc.loadCity(city);
            Criteria c=s.createCriteria(DB.PostalCode.class);
            c.add(Restrictions.eq("city", cit));
            DB.PostalCode pst=(DB.PostalCode) c.uniqueResult();
            
            return pst;
        } catch (Exception e) {
            return null;
        }
    }
    public DB.UserLogin emailValidation(String email){
        try {
            Criteria c=s.createCriteria(DB.UserLogin.class);
            c.add(Restrictions.eq("email", email));
            DB.UserLogin ul=(DB.UserLogin) c.uniqueResult();
            return ul;
        } catch (Exception e) {
            return null;
        }
    }
    public List<DB.Chat> searchChat(int recId){
        try {
            Session s1=Connection.Connection.getSessionFactory().openSession();
            Criteria c=s1.createCriteria(DB.Chat.class);
            c.add(Restrictions.eq("recieverId", recId));
            c.addOrder(Order.desc("date"));
            List<DB.Chat> l=c.list();
            //s1.close();
            return l;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static void main(String[] args) {
        Search_User_Cont su=new Search_User_Cont();
        System.out.println(su.searchPostalCode("Homagama").getCode());
    }
}
