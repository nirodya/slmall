/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Nirodya Gamage
 */
public class ManualDBSearch {
    public ResultSet returnSearchResult(String query){
        try {
            Statement s=Database.nirodya().createStatement();
            ResultSet rs=s.executeQuery(query);
            return rs;
        } catch (Exception e) {
            return null;
        }
        
    }
}
