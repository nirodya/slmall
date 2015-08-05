/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class Load_User_Cont {

    Session sl;
    SessionFactory sfl;

    public Load_User_Cont() {
//        sfl = Connection.Connection.getSessionFactory();
//        if (sl==null) {
//        sl = sfl.openSession();
//        }
        
        sl=Connection.Connection.getSessionFactory().openSession();
    }

    public DB.Province loadProvince(String province) {
        Criteria c = sl.createCriteria(DB.Province.class);
        c.add(Restrictions.eq("provinceName", province));
        DB.Province p = (DB.Province) c.uniqueResult();
        DB.Province p1 = (DB.Province) sl.load(DB.Province.class, p.getIdprovince());
        
        return p1;
    }

    public DB.City loadCity(String city) {
        Criteria c = sl.createCriteria(DB.City.class);
        c.add(Restrictions.eq("cityName", city));
        DB.City ci = (DB.City) c.uniqueResult();
        DB.City ci1 = (DB.City) sl.load(DB.City.class, ci.getIdcity());
        
        return ci1;
    }

    public DB.District loadDistrict(String district) {
        Criteria c = sl.createCriteria(DB.District.class);
        c.add(Restrictions.eq("districtName", district));
        DB.District d = (DB.District) c.uniqueResult();
        DB.District d1 = (DB.District) sl.load(DB.District.class, d.getIddistrict());
       
        return d1;
    }

    public DB.PostalCode loadPostalCode(String code) {
        Criteria c = sl.createCriteria(DB.PostalCode.class);
        c.add(Restrictions.eq("code", code));
        DB.PostalCode p = (DB.PostalCode) c.uniqueResult();
        DB.PostalCode p1 = (DB.PostalCode) sl.load(DB.PostalCode.class, p.getIdpostalCode());
       
        return p1;
    }

    public DB.Address loadAddress(String ad1) {
        Criteria c = sl.createCriteria(DB.Address.class);
        c.add(Restrictions.eq("addressOne", ad1));
        DB.Address a = (DB.Address) c.uniqueResult();
        DB.Address a1 = (DB.Address) sl.load(DB.Address.class, a.getIdaddress());
        
        return a1;
    }

    public DB.Address loadAddressForFirst(int ad1) {
        DB.Address a1 = (DB.Address) sl.load(DB.Address.class, ad1);
        //sl.flush();
        //sl.close();
        return a1;
    }
    public DB.User loadUser(int id){
        DB.User u=(DB.User) sl.load(DB.User.class, id);
        return u;
    }
    public static void main(String[] args) {
       DB.Address a2=new Load_User_Cont().loadAddressForFirst(1);
        System.out.println(a2.getAddressOne());
    }
}
