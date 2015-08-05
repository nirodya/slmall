/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.Cart_Management;
import Controller.CarttItems;
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
import org.hibernate.Session;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

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
            String pid = request.getParameter("pid");
            int qty = Integer.parseInt(request.getParameter("qty"));
//            Controller.LoadProductManager lpm=new Controller.LoadProductManager();
//            DB.Stock st=lpm.loadStock(Integer.parseInt(pid));
            Session s = Connection.Connection.getSessionFactory().openSession();
            DB.Stock st = (DB.Stock) s.load(DB.Stock.class, Integer.parseInt(pid));
            if(st.getQty()>qty){
                
            //ArrayList<CarttItems> ar=new Controller.ShoppingCart().addToShoppingCart(st,request,response,qty);
            HttpSession ses = request.getSession();
            ArrayList<CarttItems> ar;
            boolean cartlog = true;
            Controller.CarttItems ci = new Controller.CarttItems(qty, st);
            if (ses.getAttribute("cart") != null) {
                System.out.println("not null cart");
                ar = (ArrayList<CarttItems>) ses.getAttribute("cart");

                for (int i = 0; i < ar.size(); i++) {
                    CarttItems citems = ar.get(i);

                    if (st.getIdstock() == citems.getStock().getIdstock()) {
                        System.out.println("cart if");
                        if (ses.getAttribute("loguser") != null) {
                            DB.User u = (DB.User) ses.getAttribute("loguser");
                            Controller.Cart_Management cm = new Cart_Management();
                            DB.Cart crt = cm.loadCart(u);
                            Set<DB.CartItems> crtitemsset=crt.getCartItemses();
                            for (DB.CartItems crtit : crtitemsset) {
                                if (crtit.getStock().getIdstock().equals(st.getIdstock())) {
                                    cm.updateCartQty(crtit.getIdCartItems(), citems.getQty() + qty);
                                }
                            }
                            cm.closeSession();
                        }

                        citems.setQty(citems.getQty() + qty);
                        cartlog = false;
                    }
                    System.out.println("cart loop");
                }
                if (cartlog) {
                    if (ses.getAttribute("loguser") != null) {
                        DB.User u = (DB.User) ses.getAttribute("loguser");
                        Controller.Cart_Management cm = new Cart_Management();
                        DB.Cart crt = cm.loadCart(u);
                        cm.saveCartItems(crt, st, qty);
                        cm.closeSession();
                    }
                    System.out.println("cart else");
                    ar.add(ci);
                    cartlog = false;
                    System.out.println("cart else");
                }

            } else {
                System.out.println("cart null");
                ar = new ArrayList();
                if (ses.getAttribute("loguser") != null) {
                    DB.User u = (DB.User) ses.getAttribute("loguser");
                    Controller.Cart_Management cm = new Cart_Management();
                    DB.Cart crt = cm.saveCart(u);
                    cm.saveCartItems(crt, st, qty);
                    cm.closeSession();
                }
                ar.add(ci);

            }
            ses.setAttribute("cart", ar);
            System.out.println("done cart");

            }
            response.sendRedirect("products.jsp");
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
