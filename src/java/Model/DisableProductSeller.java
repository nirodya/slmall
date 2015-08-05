/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.User_cont;
import DB.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "DisableProductSeller", urlPatterns = {"/DisableProductSeller"})
public class DisableProductSeller extends HttpServlet {
    private Integer iduser;

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
             int pid = Integer.parseInt(request.getParameter("pid"));
            Session s = Connection.Connection.getSessionFactory().openSession();
            DB.Stock st = (DB.Stock) s.load(DB.Stock.class, pid);
            Transaction t = s.beginTransaction();
            
                st.setStatus(0);
             
//            Set<DB.ShopsHasStock> shopsHasStocks = st.getShopsHasStocks();
//            for (DB.ShopsHasStock shs : shopsHasStocks) {
//                Set<DB.Ownership> ownerships = shs.getShops().getOwnerships();
//                for (DB.Ownership o : ownerships) {
//                    iduser = o.getUser().getIduser();
//                }
//            }

            s.update(st);
            t.commit();
            s.close();
            //new User_cont().saveChat("Your Product " + st.getProductName() + " has disabled by admin. Please contact admin for details", iduser, "Product deactivation", (User) request.getSession().getAttribute("loguser"));
            response.sendRedirect("shop_view.jsp?shopid="+pid);
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
