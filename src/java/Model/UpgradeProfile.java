/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
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
@WebServlet(name = "UpgradeProfile", urlPatterns = {"/UpgradeProfile"})
public class UpgradeProfile extends HttpServlet {

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
            HttpSession ses=request.getSession();
            DB.User usr=(DB.User) ses.getAttribute("loguser");
            DB.UserLogin ul = null;
                        Set<DB.UserLogin> ulog = usr.getUserLogins();
                        for (DB.UserLogin ur : ulog) {
                            ul = ur;
                        }
            DB.UserRole ur=new Controller.Load_Access_Controller().loadUserRole("Shop_owner");
            DB.UserLogin ulogin=new Controller.UpdateAccessController().updatUserLogin(ul.getIduserLogin(), ul.getEmail(), ul.getPassword(), ur, ul.getUser());
            String sname=request.getParameter("sname");
            String stype=request.getParameter("stype");
            DB.ShopType shoptype=new Controller.Load_Shop_Management().loadShopType(stype);
            DB.Shops shops=new Controller.Shop_management().saveShop(sname, shoptype, 1);
            DB.Ownership ow=new Controller.Shop_management().saveOwnership(ulogin.getUser(), shops);
            response.sendRedirect("index.jsp");
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
