/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.Ownership;
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
@WebServlet(name = "DisableUser", urlPatterns = {"/DisableUser"})
public class DisableUser extends HttpServlet {

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
           int uid=Integer.parseInt(request.getParameter("uid"));
            Session s=Connection.Connection.getSessionFactory().openSession();
            DB.User st=(DB.User) s.load(DB.User.class, uid);
            Transaction t=s.beginTransaction();
            if (request.getParameter("type").equals("disable")) {
               
                Set<DB.Ownership> ows=st.getOwnerships();
                for (Ownership ow : ows) {
                    DB.Shops sh=(DB.Shops) s.get(DB.Shops.class, ow.getShops().getIdShops());
//                    Transaction t2=s.beginTransaction();
                    sh.setStatus(0);
                    s.update(sh);
                //    t2.commit();
                    Set<ShopsHasStock> stk=ow.getShops().getShopsHasStocks();
                    for (ShopsHasStock stk1 : stk) {
                        DB.Stock stock=(DB.Stock) s.load(DB.Stock.class, stk1.getStock().getIdstock());
                     //   Transaction t3=s.beginTransaction();
                        stock.setStatus(0);
                        s.update(stock);
                     //   t3.commit();
                    }
                }
                st.setStatus(2);
            }else if(request.getParameter("type").equals("enable")){
                
                Set<DB.Ownership> ows=st.getOwnerships();
                for (Ownership ow : ows) {
                    DB.Shops sh=(DB.Shops) s.get(DB.Shops.class, ow.getShops().getIdShops());
                 //   Transaction t2=s.beginTransaction();
                    sh.setStatus(1);
                    s.update(sh);
                   // t2.commit();
                    Set<ShopsHasStock> stk=ow.getShops().getShopsHasStocks();
                    for (ShopsHasStock stk1 : stk) {
                        DB.Stock stock=(DB.Stock) s.load(DB.Stock.class, stk1.getStock().getIdstock());
                    //    Transaction t3=s.beginTransaction();
                        stock.setStatus(1);
                        s.update(stock);
                      //  t3.commit();
                    }
                }
                st.setStatus(1);
            }
            s.update(st);
            t.commit();
            s.flush();
            s.clear();
            s.close();
            response.sendRedirect("usermanagement.jsp?type="+request.getParameter("utype"));
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
