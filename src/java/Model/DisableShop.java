/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.ShopsHasStock;
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
@WebServlet(name = "DisableShop", urlPatterns = {"/DisableShop"})
public class DisableShop extends HttpServlet {

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
            int pid=Integer.parseInt(request.getParameter("sid"));
            Session s=Connection.Connection.getSessionFactory().openSession();
            DB.Shops st=(DB.Shops) s.get(DB.Shops.class, pid);
            Transaction t=s.beginTransaction();
            if (request.getParameter("type").equals("disable")) {
                Set<DB.ShopsHasStock> stks=st.getShopsHasStocks();
                for (ShopsHasStock stk : stks) {
                    DB.Stock stock=(DB.Stock) s.get(DB.Stock.class, stk.getStock().getIdstock());
                    stock.setStatus(0);
                    s.update(stock);
                }
                st.setStatus(0);
            }else if(request.getParameter("type").equals("enable")){
                Set<DB.ShopsHasStock> stks=st.getShopsHasStocks();
                for (ShopsHasStock stk : stks) {
                    DB.Stock stock=(DB.Stock) s.get(DB.Stock.class, stk.getStock().getIdstock());
                    stock.setStatus(1);
                    s.update(stock);
                }
                st.setStatus(1);
            }
            s.update(st);
            t.commit();
            s.flush();
            s.clear();
            s.close();
            response.sendRedirect("shopmanagement.jsp");
            
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
