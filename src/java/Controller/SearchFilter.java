/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
public class SearchFilter {

    Session s;

    public List<DB.Stock> filterStock(int cat, int subcat, Criteria c) {
        s = Connection.Connection.getSessionFactory().openSession();
        if (cat != 0) {
            DB.Catogaries loadedCatogaries = (DB.Catogaries) s.load(DB.Catogaries.class, cat);
            c.add(Restrictions.eq("catogaries", loadedCatogaries));
            if (subcat != 0) {
                DB.SubCatogary loadedSubCatogary = (DB.SubCatogary) s.load(DB.SubCatogary.class, subcat);
                c.add(Restrictions.eq("subCatogary", loadedSubCatogary));
            }
        }

        s.close();
        return c.list();
    }

    public static void main(String[] args) {
        Session s1 = Connection.Connection.getSessionFactory().openSession();
        Criteria c = s1.createCriteria(DB.Stock.class);
        new SearchFilter().filterStock(1, 0, c);
    }
}
