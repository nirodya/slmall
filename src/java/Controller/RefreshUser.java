/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.User;
import java.util.Set;
import org.hibernate.Session;

/**
 *
 * @author Nirodya
 */
public class RefreshUser {
    
    Session s;
    
    public RefreshUser() {
//        if (s==null) {
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        
        s=CreatingConnection.returnSession();
        
    }
    
    public DB.UserLogin refresh(String un,String pw){
        Controller.Search_Access_Controller sa = new Controller.Search_Access_Controller();
        DB.UserLogin ul = sa.systemLogin(un, pw);
        return ul;
    }
    
}
