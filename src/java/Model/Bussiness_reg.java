/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import Controller.Access_Controller;
import Controller.Esender;
import Controller.Load_Shop_Management;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "Bussiness_reg", urlPatterns = {"/Bussiness_reg"})
public class Bussiness_reg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String bfname=request.getParameter("bfname");
            String blname=request.getParameter("blname");
            String sname=request.getParameter("sname");
            String stype=request.getParameter("stype");
            String tname=request.getParameter("tname");
            String badone=request.getParameter("badone");
            String badtwo=request.getParameter("badtwo");
            String city=request.getParameter("city");
            String district=request.getParameter("district");
            String province=request.getParameter("province");
            String pcode=request.getParameter("pcode");
            String email=request.getParameter("email");
            HttpSession sess=request.getSession();
            Controller.Search_User_Cont suc=new Controller.Search_User_Cont();
            DB.UserLogin ulogincheck=suc.emailValidation(email);
            if (ulogincheck!=null) {
                if (ulogincheck.getUserRole().getRoleName().equals("Shop_owner")) {
                    sess.setAttribute("msg", "You are already registered from this email.Please login with that email.");
                }
                else if (ulogincheck.getUserRole().getRoleName().equals("Shopper")) {
                    sess.setAttribute("msg", "You are already registered from this email in a regular account.<br> Would you like to upgrade your account to bussiness account?<br> click<a href='upgrade.jsp'>here</a> to upgrade");
                    //sess.setAttribute("upgrade", ulogincheck);
                }
                response.sendRedirect("bussreg.jsp");
            }else{
            DB.ShopType shopType;
            
            Controller.CryptWithMD5 crpt=new Controller.CryptWithMD5();
            String pw=crpt.cryptWithMD5(request.getParameter("pw"));
            
            Controller.Access_Controller acs=new Controller.Access_Controller();
            Controller.Load_Access_Controller lcs=new Controller.Load_Access_Controller();
            DB.UserRole ur=lcs.loadUserRole("Shop_owner");
            
            
            Controller.User_cont uc=new Controller.User_cont();
            
            Controller.Load_User_Cont luc=new Controller.Load_User_Cont();
            DB.Address ad=uc.saveAddress(badone, badtwo, luc.loadProvince(province), luc.loadDistrict(district), luc.loadCity(city), luc.loadPostalCode(pcode));
            
            DB.User u=uc.saveUser(bfname, blname, ad,0);
            DB.UserLogin ul = acs.saveUserLogin(email, pw, ur,u);
            Controller.Shop_management sm=new Controller.Shop_management();
            Controller.Load_Shop_Management  lsm=new Load_Shop_Management();
            if (stype.equals("Other")) {
                
                shopType=sm.saveSHopType(tname);
            } else {
                shopType=lsm.loadShopType(stype);
            }
            
            DB.Shops sh=sm.saveShop(sname, shopType,1);
            sm.saveOwnership(u, sh);
            String EmailMassage="Thank you for Registering in our site as a Seller. To activate your account, click or copy the link ang go from your browser.</br><a href=\"http://localhost:8080/Shopping_mall/activateUser?uid="+ul.getUser().getIduser()+"\"></a>";
            Esender.emailsender(email, "Activating account", EmailMassage);
            response.sendRedirect("index.jsp");
            }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
