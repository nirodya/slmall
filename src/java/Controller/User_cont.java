/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.Address;
import DB.Chat;
import DB.User;
import java.util.Date;
import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
public class User_cont {

    Session s;
    SessionFactory sf;

    public User_cont() {
//        sf = Connection.Connection.getSessionFactory();
//        if (s==null) {
//           s = sf.openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
            s.setFlushMode(FlushMode.ALWAYS);
        

    }

    public DB.User saveUser(String fname, String lname, DB.Address address,int stat) {
        try {
            Transaction ts = s.beginTransaction();
            DB.User u = new DB.User();
            u.setAddress(address);
            u.setFname(fname);
            u.setLname(lname);
            u.setStatus(stat);
            //u.setUserLogin(ul);
            
            s.save(u);
            ts.commit();
           // s.flush();
            //s.close();
            return u;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public DB.Address saveAddress(String ad1, String ad2, DB.Province province, DB.District district, DB.City city, DB.PostalCode pcode) {
        try {
            Transaction t = s.beginTransaction();
            DB.Address a = new Address();
            a.setAddressOne(ad1);
            a.setAddressTwo(ad2);
            a.setCity(city);
            a.setDistrict(district);
            a.setPostalCode(pcode);
            a.setProvince(province);
            s.save(a);
            t.commit();
            //s.flush();
            return a;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int saveProvince(String provincename) {
        try {
            Transaction t = s.beginTransaction();
            DB.Province p = new DB.Province();
            p.setProvinceName(provincename);
            s.save(p);
            t.commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }

    public int saveDistrict(String disname, DB.Province province) {
        try {
            Transaction t = s.beginTransaction();
            DB.District d = new DB.District();
            d.setDistrictName(disname);
            s.save(d);
            t.commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }

    public int saveCity(String city, DB.District dist) {
        try {
            Transaction t = s.beginTransaction();
            DB.City c = new DB.City();
            c.setCityName(city);
            c.setDistrict(dist);
            s.save(c);
            t.commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }

    public int savePostal_Code(String code, DB.City cty) {
        try {
            Transaction t = s.beginTransaction();
            DB.PostalCode p = new DB.PostalCode();
            p.setCity(cty);
            p.setCode(code);
            s.save(p);
            t.commit();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }
    public DB.Chat saveChat(String mess, Integer resid, String subject, User sender){
        try {
            Transaction t=s.beginTransaction();
            DB.Chat c=new Chat();
            c.setMessage(mess);
            c.setRecieverId(resid);
            c.setStatus(0);
            c.setSubject(subject);
            c.setUser(sender);
            c.setDate(new Date());
            s.save(c);
            t.commit();
            s.flush();
            
            s.clear();
            return c;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        
        
    }

}
