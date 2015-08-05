/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
public class UpdateAccessController {
    Session s;

    public UpdateAccessController() {
//    if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=Connection.Connection.getSessionFactory().openSession();
    }
    
    public DB.UserLogin updatUserLogin(int ulid,String email,String pw,DB.UserRole url,DB.User u){
        try {
            DB.UserLogin ul=(DB.UserLogin) s.load(DB.UserLogin.class, ulid);
            Transaction t=s.beginTransaction();
            ul.setEmail(email);
            ul.setPassword(pw);
            ul.setUser(u);
            ul.setUserRole(url);
            s.update(ul);
            t.commit();
            return ul;
        } catch (Exception e) {
            return null;
        }
    }
}
