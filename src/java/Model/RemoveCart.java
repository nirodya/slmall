/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.CarttItems;
import DB.CartItems;
import DB.Shops;
import DB.ShopsHasStock;
import DB.Stock;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "RemoveCart", urlPatterns = {"/RemoveCart"})
public class RemoveCart extends HttpServlet {
    private Shops shop;

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
           HttpSession httpSession = request.getSession();
            if (httpSession.getAttribute("loguser") != null) {
                DB.User user = (DB.User) httpSession.getAttribute("loguser");
                if (httpSession.getAttribute("cart") != null) {
                    ArrayList<CarttItems> st = (ArrayList<CarttItems>) httpSession.getAttribute("cart");
                    int displayid = Integer.parseInt(request.getParameter("displayid"));
                    CarttItems carttItems = st.get(displayid);
                    //Cart_Management cm = new Cart_Management();
                    Session s = Connection.Connection.getSessionFactory().openSession();
                    Criteria c = s.createCriteria(DB.Cart.class);
                    c.add(Restrictions.eq("user", user));
                    DB.Cart crt = (DB.Cart) c.uniqueResult();
                    Set<DB.CartItems> sci = crt.getCartItemses();
                    for (CartItems sci1 : sci) {
                        if (sci1.getStock().getIdstock().equals(carttItems.getStock().getIdstock())) {
                            //DB.CartItems crtit = (DB.CartItems) s.load(DB.CartItems.class, sci1.getIdCartItems());
                            Criteria scrtit=s.createCriteria(DB.CartItems.class);
                            scrtit.add(Restrictions.eq("idCartItems", sci1.getIdCartItems()));
                            DB.CartItems crtit=(DB.CartItems) scrtit.uniqueResult();
                            Transaction t = s.beginTransaction();
                            s.delete(crtit);
                            t.commit();
                        }
                    }
                    st.remove(displayid);
                    
                    System.out.println("awa");

                    //DB.Orders order = cm.saveOreders(address, method, paymanetmethod, qty, shop, user);
                    response.sendRedirect("shoppingcart.jsp");
                    s.close();
                } 
            }else {
                if (httpSession.getAttribute("cart") != null) {
                    ArrayList<CarttItems> st = (ArrayList<CarttItems>) httpSession.getAttribute("cart");
                    int displayid = Integer.parseInt(request.getParameter("displayid"));
                    st.remove(displayid);
                }
                
               response.sendRedirect("shoppingcart.jsp");

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
