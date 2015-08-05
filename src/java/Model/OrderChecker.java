/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.Orders;
import DB.Ownership;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "OrderChecker", urlPatterns = {"/OrderChecker"})
public class OrderChecker extends HttpServlet {

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
            HttpSession mehttpsess = request.getSession();
            Session messess = Connection.Connection.getSessionFactory().openSession();

            DB.User mesUser = (DB.User) mehttpsess.getAttribute("loguser");
            Criteria owcri = messess.createCriteria(DB.Ownership.class);
            owcri.add(Restrictions.eq("user", mesUser));
            List<Ownership> owlist = owcri.list();
            ArrayList ar = new ArrayList();
            for (Ownership ow : owlist) {

                Criteria mescriteria = messess.createCriteria(DB.Orders.class);
                mescriteria.add(Restrictions.eq("shops", ow.getShops()));
                mescriteria.add(Restrictions.eq("status", 0));
                List<DB.Orders> orderforshoplList = mescriteria.list();
                for (Orders orderforshoplList1 : orderforshoplList) {
                    ar.add(orderforshoplList1.getIdorders());
                }

            }

            out.write(ar.size());

            messess.close();
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
