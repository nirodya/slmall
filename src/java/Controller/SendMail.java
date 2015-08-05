/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Nirodya Gamage
 */
public class SendMail {
    public static synchronized void emailSender(String to_Email_Address,String subject,String msg){
  final  String username="admin@slmall.web44.net";
   final String password="hpg62-451tu";
    Properties props=new Properties();
    
    props.put("mail.smtp.auth","true");
    //props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.host","http://mail.paulstamatiou.com/");
    props.put("mail.smtp.port","25");
    props.put("mail.debug","true");
    
    Session session=Session.getInstance(props, new javax.mail.Authenticator() { 
        protected PasswordAuthentication getPasswordAuthentication(){ 
            return new PasswordAuthentication(username, password);}});
    
        try {
         Message message=new MimeMessage(session);
         message.setFrom(new InternetAddress(username));
       message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to_Email_Address));
       message.setSubject(subject);
       message.setText(msg);
       Transport.send(message);
            System.out.println("Done");
         
            
            
        } catch (MessagingException e) {
        throw  new RuntimeException(e);
        }
    
    }
    public static void main(String[] args) {
        emailSender("gnirodya@yahoo.com", "paka", "hutta");
    }
}
