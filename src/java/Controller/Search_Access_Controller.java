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
public class Search_Access_Controller {

    Session s;
    SessionFactory sf;

    public Search_Access_Controller() {
//        sf = Connection.Connection.getSessionFactory();
//        if (s==null) {
//        s = sf.openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }

    public DB.UserLogin searchLogin(String email) {
        try {
            Criteria c = s.createCriteria(DB.UserLogin.class);
            c.add(Restrictions.eq("email", email));
            DB.UserLogin ul = (DB.UserLogin) c.uniqueResult();
            return ul;
        } catch (Exception e) {
            return null;
        }
    }

    public DB.UserLogin systemLogin(String email, String pw) {
        try {
            Criteria c = s.createCriteria(DB.UserLogin.class);
            c.add(Restrictions.and(Restrictions.eq("email", email), Restrictions.eq("password", pw)));
            DB.UserLogin ul = (DB.UserLogin) c.uniqueResult();
            return ul;
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
       

    }
}
