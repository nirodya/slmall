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
public class Load_Access_Controller {
    Session sc;
    SessionFactory sfc;
    public Load_Access_Controller(){
//        sfc=Connection.Connection.getSessionFactory();
//        if (sc==null) {
//        sc=sfc.openSession();
//        }
        
        sc=Connection.Connection.getSessionFactory().openSession();
    }
    public DB.UserRole loadUserRole(String rolename){
        Criteria c=sc.createCriteria(DB.UserRole.class);
        c.add(Restrictions.eq("roleName", rolename));
        DB.UserRole ur=(DB.UserRole) c.uniqueResult();
        DB.UserRole ur1=(DB.UserRole) sc.load(DB.UserRole.class, ur.getIduserRole());
        return ur1;
    }
    public DB.UserLogin loadUserLogin(String email){
        Criteria c=sc.createCriteria(DB.UserLogin.class);
        c.add(Restrictions.eq("email", email));
        DB.UserLogin ul=(DB.UserLogin) c.uniqueResult();
        DB.UserLogin ul1=(DB.UserLogin) sc.load(DB.UserLogin.class, ul.getIduserLogin());
        sc.close();
        return ul1;
    }
    public static void main(String[] args) {
        Load_Access_Controller la=new Load_Access_Controller();
        Controller.Access_Controller acs=new Controller.Access_Controller();
        Controller.User_cont uc = new Controller.User_cont();
            Controller.Load_User_Cont luc=new Controller.Load_User_Cont();    
        DB.UserLogin ul2=la.loadUserLogin("nirodya@yahoo.com");
        DB.UserRole ur=la.loadUserRole("Shopper");
        System.out.println(ul2.getIduserLogin());
        System.out.println(ur.getIduserRole());
    }
        
}
