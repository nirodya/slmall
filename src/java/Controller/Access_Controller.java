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
public class Access_Controller {

    Session sa;
    SessionFactory saf;

    public Access_Controller() {
    //   saf = Connection.Connection.getSessionFactory();
//        
//            sa = saf.openSession();
       
     sa=Connection.Connection.getSessionFactory().openSession();
        
    }

    public DB.UserLogin saveUserLogin(String email, String pw, DB.UserRole urid,DB.User u) {
        try {
            // sa = saf.openSession();
            Transaction t = sa.beginTransaction();
            DB.UserLogin ul = new DB.UserLogin();
            ul.setEmail(email);
            ul.setPassword(pw);
            ul.setUserRole(urid);
            ul.setUser(u);
            sa.save(ul);
            
            //sa.flush();
            t.commit();
           // sa.close();
            return ul;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int saveUserRole(String rolename) {
        try {
           //  sa = saf.openSession();
            Transaction t = sa.beginTransaction();
            DB.UserRole ur = new DB.UserRole();
            ur.setRoleName(rolename);
            sa.save(ur);
            t.commit();
          //  sa.close();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
          //  sa.close();
            return 2;
        }
    }

    public int saveUseCase(String usecasename) {
        try {
           // sa = saf.openSession();
            Transaction t = sa.beginTransaction();
            DB.UseCase uc = new DB.UseCase();
            uc.setUsecaseName(usecasename);
            sa.save(uc);
            t.commit();
          //  sa.close();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }

    public int saveInterfaces(String interfacename) {
        try {
           // sa = saf.openSession();
            Transaction t = sa.beginTransaction();
            DB.Interfaces in = new DB.Interfaces();
            in.setInterfaceName(interfacename);
            sa.save(in);
            //sa.close();
            t.commit();
            return 1;
        } catch (Exception e) {
            return 2;
        }
    }
    
}
