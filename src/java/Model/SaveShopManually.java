/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.ShopType;
import DB.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya
 */
@WebServlet(name = "SaveShopManually", urlPatterns = {"/SaveShopManually"})
public class SaveShopManually extends HttpServlet {

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
            HttpSession ss = request.getSession();
            DB.User us = (DB.User) ss.getAttribute("loguser");
            String stype = request.getParameter("stype");
            String sname = request.getParameter("sname");
            Controller.Search_Shop_management shm = new Controller.Search_Shop_management();
            Controller.Load_Shop_Management lsm = new Controller.Load_Shop_Management();
            Controller.Shop_management sm = new Controller.Shop_management();
            DB.ShopType sht = null;
            List<DB.ShopType> l = shm.searchShopTypeAll();
            for (ShopType l1 : l) {
                if (l1.getTypeName().equals(stype)) {
                    sht = lsm.loadShopType(stype);
                }
            }
            if (sht == null) {
                sht = sm.saveSHopType(stype);
            }
            DB.Shops shops = sm.saveShop(sname, sht,1);
            DB.Ownership owner = sm.saveOwnership(us, shops);
            DB.UserLogin ul=new Controller.RefreshUser().refresh(ss.getAttribute("userdetun").toString(),ss.getAttribute("userdetpw").toString());
             DB.User usr=ul.getUser();
                DB.UserRole ur=ul.getUserRole();
                    
               // for (User user : l) {
                    ss.setAttribute("loguser", usr);
                    ss.setAttribute("role", ur);
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
