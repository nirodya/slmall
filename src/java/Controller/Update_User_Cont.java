/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
public class Update_User_Cont {

    Session s;
    SessionFactory sf;

    public Update_User_Cont() {
//        sf = Connection.Connection.getSessionFactory();
//        if (s==null) {
//           s = sf.openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }

    public DB.User updateFname(int id, String fname) {
        try {
            Transaction t = s.beginTransaction();
            DB.User u = (DB.User) s.load(DB.User.class, id);
            u.setFname(fname);
            s.update(u);
            t.commit();
            //s.flush();
            return u;
            //s.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.User updateLname(int id, String lname) {
        try {
            Transaction t = s.beginTransaction();
            DB.User u = (DB.User) s.load(DB.User.class, id);
            u.setLname(lname);
            s.update(u);
            t.commit();
            //s.flush();
            return u;
            //s.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public DB.User updateMobile(int id, int mobile) {
        try {
            Transaction t = s.beginTransaction();
            DB.User u = (DB.User) s.load(DB.User.class, id);
            u.setMobileNo(mobile);
            s.update(u);
            t.commit();
           // s.flush();
            return u;
            //s.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public DB.Address updateAddress(String adone, String adtwo, int adid, int cityid, int distid, int proid, int postid) {
        try {
            Transaction t = s.beginTransaction();
            DB.City c = (DB.City) s.load(DB.City.class, cityid);
            DB.District d = (DB.District) s.load(DB.District.class, distid);
            DB.Province p = (DB.Province) s.load(DB.Province.class, proid);
            DB.PostalCode pc = (DB.PostalCode) s.load(DB.PostalCode.class, postid);
            DB.Address ad = (DB.Address) s.load(DB.Address.class, adid);
            ad.setAddressOne(adone);
            ad.setAddressTwo(adtwo);
            ad.setCity(c);
            ad.setDistrict(d);
            ad.setPostalCode(pc);
            ad.setProvince(p);
            s.update(ad);
            t.commit();
            //s.flush();
            //s.close();
            return ad;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) {
        String ad1 = "abc";
                String ad2 = "abc";
                String city = "Homagama";
                String district = "Colombo";
                String province = "Western";
                //String postalcode = request.getParameter("postalcode");
                
                int upuid = 1;
                Update_User_Cont uuc=new Update_User_Cont();
                Controller.Search_User_Cont su=new Controller.Search_User_Cont();
                DB.User us=su.searchUser(upuid);
                System.out.println(us.getAddress().getIdaddress());
                DB.City c=su.searchCity(city);
                DB.District d=su.searchDistrict(district);
                DB.Province p=su.searchProvinceOnce(province);
                DB.PostalCode po=su.searchPostalCode(city);

                DB.Address add = uuc.updateAddress(ad1, ad2, us.getAddress().getIdaddress(), c.getIdcity(), d.getIddistrict(), p.getIdprovince(), po.getIdpostalCode());
                System.out.println(add.getAddressOne());
    }
}
