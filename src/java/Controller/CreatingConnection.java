/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Nirodya Gamage
 */
public class CreatingConnection {
    static Session s;
    static SessionFactory sf;
    public static Session returnSession(){
        System.out.println("inside method");
        if (s==null) {
            sf=Connection.Connection.getSessionFactory();
             s=sf.openSession();
            //if (s==null) {
             
                
                System.out.println("inside");
            //}
             
             
        }
        else{
            
            if (!s.isDirty()) {
                s.clear();
                System.out.println("inside else");
                s=sf.openSession();
            }else{
              //  s=sf.openSession();
            }
        }
       
//        if (s.isOpen()) {
//            s=Connection.Connection.getSessionFactory().getCurrentSession();
//        }else{
//            s=Connection.Connection.getSessionFactory().openSession();
//        }
        return s;
    }
    
}
