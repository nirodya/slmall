/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.CryptWithMD5;
import Controller.Esender;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "Saveuser", urlPatterns = {"/Saveuser"})
public class Saveuser extends HttpServlet {

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
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            Controller.CryptWithMD5 crpt = new CryptWithMD5();
            String pw = crpt.cryptWithMD5(request.getParameter("cpw"));
            Controller.Access_Controller acs = new Controller.Access_Controller();
            Controller.Load_Access_Controller lcs = new Controller.Load_Access_Controller();

            // DB.UserLogin u=lcs.loadUserLogin(email);
            Controller.User_cont uc = new Controller.User_cont();
            Controller.Load_User_Cont luc = new Controller.Load_User_Cont();
            DB.Address ad = uc.saveAddress("N/A", "N/A", luc.loadProvince("N/A"), luc.loadDistrict("N/A"), luc.loadCity("N/A"), luc.loadPostalCode("N/A"));

            DB.User usr = uc.saveUser(fname, lname, ad,0);
            DB.UserLogin ul = acs.saveUserLogin(email, pw, lcs.loadUserRole("Shopper"), usr);
            String EmailMassage="Thank you for Registering in our site as a Buyer. To activate your account, click or copy the link ang go from your browser.</br><a href=\"http://localhost:8080/Shopping_mall/activateUser?uid="+ul.getUser().getIduser()+"\"></a>";
            Esender.emailsender(email, "Activating account", EmailMassage);
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
