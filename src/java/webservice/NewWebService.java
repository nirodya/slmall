/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webservice;

import Controller.CryptWithMD5;
import Controller.Esender;
import Controller.LoadProductManager;
import Controller.SearchProductManagement;
import DB.Stock;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Nirodya
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     *
     * @return
     */
    @WebMethod(operationName = "Login")
    public String Login(@WebParam(name = "un") String un, @WebParam(name = "pw") String pw) {
        //TODO write your implementation code here:
        CryptWithMD5 crpt = new CryptWithMD5();
        String cryptpw = crpt.cryptWithMD5(pw);
        Controller.Search_Access_Controller sa = new Controller.Search_Access_Controller();
        DB.UserLogin ul = sa.systemLogin(un, cryptpw);
        JSONObject jo = new JSONObject();
        if (ul == null) {
            return jo.toJSONString();
        } else if (ul.getUser().getStatus() == 2) {
            jo.put("uid", ul.getUser().getIduser());
            jo.put("fname", ul.getUser().getFname());
            jo.put("lname", ul.getUser().getLname());
            jo.put("mobile", ul.getUser().getMobileNo());
            jo.put("urole", ul.getUserRole().getIduserRole());
            return jo.toJSONString();
        } else {
            jo.put("uid", ul.getUser().getIduser());
            jo.put("fname", ul.getUser().getFname());
            jo.put("lname", ul.getUser().getLname());
            jo.put("mobile", ul.getUser().getMobileNo());
            jo.put("urole", ul.getUserRole().getIduserRole());
            return jo.toJSONString();
        }

    }

    /**
     * Web service operation
     *
     * @param fname
     * @param lname
     */
    @WebMethod(operationName = "Signup")
    public boolean Signup(@WebParam(name = "fname") String fname, @WebParam(name = "lname") String lname, @WebParam(name = "email") String email, @WebParam(name = "pw") String pw) {
        //TODO write your implementation code here:
        Controller.CryptWithMD5 crpt = new CryptWithMD5();
        String cryptpw = crpt.cryptWithMD5(pw);
        Controller.Access_Controller acs = new Controller.Access_Controller();
        Controller.Load_Access_Controller lcs = new Controller.Load_Access_Controller();
        Controller.User_cont uc = new Controller.User_cont();
        Controller.Load_User_Cont luc = new Controller.Load_User_Cont();
        DB.Address ad = uc.saveAddress("N/A", "N/A", luc.loadProvince("N/A"), luc.loadDistrict("N/A"), luc.loadCity("N/A"), luc.loadPostalCode("N/A"));

        DB.User usr = uc.saveUser(fname, lname, ad, 0);
        DB.UserLogin ul = acs.saveUserLogin(email, cryptpw, lcs.loadUserRole("Shopper"), usr);
        String EmailMassage = "Thank you for Registering in our site as a Buyer. To activate your account, click or copy the link and go from your browser.</br><a href=\"http://localhost:8080/Shopping_mall/activateUser?uid=" + ul.getUser().getIduser() + "\"></a>";
        Esender.emailsender(email, "Activating account", EmailMassage);
        return false;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getLatestProducts")
    public String getLatestProducts(@WebParam(name = "id") int id) {
        //TODO write your implementation code here:
        Controller.SearchProductManagement spm = new Controller.SearchProductManagement();
        List<DB.Stock> plist = spm.searchStock("name", null, id);
        double dpercentage = 0.00;
        double roundedpercentage = 0.00;
        JSONArray ar = new JSONArray();
        for (Stock st : plist) {
            dpercentage = ((st.getSellingPrice() - st.getDiscountPrice()) / st.getSellingPrice()) * 100;
            roundedpercentage = Math.round(dpercentage);
            JSONObject job = new JSONObject();
            job.put("sid", st.getIdstock());
            job.put("pname", st.getProductName());
            job.put("image", st.getImage());
            job.put("percentage", roundedpercentage);
            job.put("price", st.getDiscountPrice());
            job.put("description", st.getDescription());
            ar.add(job);
        }
        return ar.toJSONString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getCatogaries")
    public String getCatogaries() {
        Controller.SearchProductManagement spm = new Controller.SearchProductManagement();
        List<DB.Catogaries> l = spm.searchCatogaryAll();
        JSONArray ar = new JSONArray();
        l.forEach(e -> {
            JSONObject job = new JSONObject();
            job.put("catid", e.getIdcatogaries());
            job.put("cat", e.getCatogariName());
            ar.add(job);
        });
        return ar.toJSONString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getSubCatogaries")
    public String getSubCatogaries(@WebParam(name = "id") int id) {
        Controller.LoadProductManager loadProductManager = new LoadProductManager();
        DB.Catogaries c = loadProductManager.loadCatogary(id);
        List<DB.SubCatogary> catogarys = new Controller.SearchProductManagement().searchSubCatogary(c);
        JSONArray ar = new JSONArray();
        catogarys.forEach(e -> {
            JSONObject job = new JSONObject();
            job.put("subcatid", e.getIdSubCatogary());
            job.put("subcat", e.getSubCatogaryName());
            ar.add(job);
        });
        return ar.toJSONString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getProductsBySubCat")
    public String getProductsBySubCat(@WebParam(name = "subCatId") int subCatId, @WebParam(name = "catId") int catId, @WebParam(name = "id") int id) {
        //TODO write your implementation code here:
        SearchProductManagement spm = new SearchProductManagement();
        List<DB.Stock> l = spm.advanceSearchStock(catId, subCatId, null, id);
        JSONArray ar = new JSONArray();
        l.forEach(st -> {
            double dpercentage = 0.00;
            double roundedpercentage = 0.00;
            dpercentage = ((st.getSellingPrice() - st.getDiscountPrice()) / st.getSellingPrice()) * 100;
            roundedpercentage = Math.round(dpercentage);
            JSONObject job = new JSONObject();
            job.put("sid", st.getIdstock());
            job.put("pname", st.getProductName());
            job.put("image", st.getImage());
            job.put("percentage", roundedpercentage);
            job.put("price", st.getDiscountPrice());
            job.put("description", st.getDescription());
            ar.add(job);
        });
        return ar.toJSONString();
    }
}
