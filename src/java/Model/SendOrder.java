/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.CarttItems;
import DB.Chat;
import DB.Orders;
import DB.OrdersHasStock;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "SendOrder", urlPatterns = {"/SendOrder"})
public class SendOrder extends HttpServlet {

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
            Session s=Connection.Connection.getSessionFactory().openSession();
            int stid=Integer.parseInt(request.getParameter("stid"));
            int sid=Integer.parseInt(request.getParameter("sid"));
            int qty=Integer.parseInt(request.getParameter("qty"));
            int paymethod=Integer.parseInt(request.getParameter("paymethod"));
            String address=request.getParameter("address");
            DB.Stock stk=(DB.Stock) s.load(DB.Stock.class, stid);
            DB.Shops shop=(DB.Shops) s.load(DB.Shops.class, sid);
            DB.Paymanetmethod paymanetmethod=(DB.Paymanetmethod) s.load(DB.Paymanetmethod.class, paymethod);
            DB.User user=(DB.User) request.getSession().getAttribute("loguser");
            Transaction qt=s.beginTransaction();
            stk.setQty(stk.getQty()-qty);
            s.update(stk);
            qt.commit();
            
            Transaction t1 = s.beginTransaction();
                    DB.Orders or = new Orders();
                    or.setAddress(address);
                    or.setMessage(paymanetmethod.getMethod());
                    or.setPaymanetmethod(paymanetmethod);
                    or.setQty(qty);
                    or.setShops(shop);
                    or.setUser(user);
                    or.setStatus(0);
                    s.save(or);
                    t1.commit();
                    //cm.saveOredersHasStock(order, stk);
                    Transaction t2 = s.beginTransaction();
                    DB.OrdersHasStock ordersHasStock = new OrdersHasStock();
                    ordersHasStock.setOrders(or);
                    ordersHasStock.setStock(stk);
                    s.save(ordersHasStock);
                    t2.commit();
                    
                   
                    s.close();
                     // ArrayList<DB.Stock> ar=new ArrayList<>();
                        HttpSession httpSession = request.getSession();
                        if (httpSession.getAttribute("cart") != null) {
                            ArrayList<CarttItems> st = (ArrayList<CarttItems>) httpSession.getAttribute("cart");
                            if(st.size()!=0 ){
                                response.sendRedirect("shoppingcart.jsp");
                            }else{
                                response.sendRedirect("products.jsp");
                            }
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
