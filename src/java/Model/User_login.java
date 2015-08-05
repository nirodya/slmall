/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.Cart_Management;
import Controller.CarttItems;
import Controller.CryptWithMD5;
import DB.CartItems;
import DB.Ownership;
import DB.ShopsHasStock;
import DB.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "User_login", urlPatterns = {"/User_login"})
public class User_login extends HttpServlet {

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
            HttpSession sess = request.getSession();

            if (request.getParameter("un") == null && request.getParameter("pw") == null) {
                if (sess.getAttribute("loguser") != null) {
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            }
            String un = request.getParameter("un");
            CryptWithMD5 crpt = new CryptWithMD5();
            String pw = crpt.cryptWithMD5(request.getParameter("pw"));
            Controller.Search_Access_Controller sa = new Controller.Search_Access_Controller();
            DB.UserLogin ul = sa.systemLogin(un, pw);
            if (ul == null) {
                sess.setAttribute("msg", "Login Error. Please Enter correct username and Password and try again.");
                response.sendRedirect("login.jsp");
            } else if (ul.getUser().getStatus() == 2) {
                sess.setAttribute("msg", "Your profile has been deactivated by admin. Please contact system administrator.");
                response.sendRedirect("login.jsp");
            } //                else if (ul.getPassword().equals(pw) && ul.getEmail().equals(un)) {
            //
            //                Set<DB.User> l = ul.getUsers();
            //
            //                for (User user : l) {
            //                    sess.setAttribute("loguser", user);
            //                }
            //                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            //                rd.forward(request, response);
            //
            //            } 
            else {
                // Set<DB.User> l = ul.getUsers();

                DB.User usr = ul.getUser();
                DB.UserRole ur = ul.getUserRole();
                sess.setAttribute("userdetun", un);
                sess.setAttribute("userdetpw", pw);
                Cookie usercookie = new Cookie("unpw", un + "-" + pw);
                usercookie.setMaxAge(60 * 60 * 24);

                response.addCookie(usercookie);
                // for (User user : l) {
                sess.setAttribute("loguser", usr);
                Cart_Management cm = new Cart_Management();
                DB.Cart crt = cm.loadCart(usr);
                if (crt != null) {
                    List<DB.CartItems> ci = cm.laodCartItems(crt);
                    ArrayList<CarttItems> ar = null;
                    boolean check=true;
                   // int count=0;
                    if (sess.getAttribute("cart") != null) {
                        ar = (ArrayList<CarttItems>) sess.getAttribute("cart");
                        DB.Cart crtat = cm.saveCart(usr);
                        Iterator<CarttItems> it = ar.iterator();
                        while (it.hasNext()) {
                            CarttItems ar1=it.next();
                            Set<DB.Ownership> ow=usr.getOwnerships();
                            
                            int shp=0;
                            Set<DB.ShopsHasStock> setshps=ar1.getStock().getShopsHasStocks();
                            for (ShopsHasStock setshp : setshps) {
                                shp=setshp.getShops().getIdShops();
                            }
                            for (Ownership ow1 : ow) {
                                System.out.println("AWAAAA");
                                if (ow1.getShops().getIdShops()==shp) {
                                    System.out.println("AWAAAAA1");
                                    it.remove();
                                    check=false;
                                }
                            }
                            if (check) {
                                System.out.println("AWAAAAA11");
                                cm.saveCartItems(crtat, ar1.getStock(), ar1.getQty());
                            }
                            
                        }

                    } else {
                        ar = new ArrayList();
                    }

                    for (CartItems ci1 : ci) {
                        Controller.CarttItems cit = new CarttItems(ci1.getQty(), ci1.getStock());
                        
                            ar.add(cit);
                        
                        
                    }
                    //cm.closeSession();
                    sess.setAttribute("cart", ar);
                } else {

                    if (sess.getAttribute("cart") != null) {
                        ArrayList<CarttItems> ar = (ArrayList<CarttItems>) sess.getAttribute("cart");
                        DB.Cart crtat = cm.saveCart(usr);

                        for (CarttItems ar1 : ar) {
                            Set<DB.Ownership> ow=usr.getOwnerships();
                            boolean check=true;
                            int shp=0;
                            Set<DB.ShopsHasStock> setshps=ar1.getStock().getShopsHasStocks();
                            for (ShopsHasStock setshp : setshps) {
                                shp=setshp.getShops().getIdShops();
                            }
                            for (Ownership ow1 : ow) {
                                System.out.println("AWAAAA2");
                                if (ow1.getShops().getIdShops()==shp) {
                                    System.out.println("AWAAAA3");
                                    check=false;
                                }
                            }
                            if (check) {
                                System.out.println("AWAAAA4");
                                cm.saveCartItems(crtat, ar1.getStock(), ar1.getQty());
                            }
                        }
                    }
                }
                sess.setAttribute("role", ur);
                // }
                if (sess.getAttribute("currentpage") != null) {
                    response.sendRedirect(sess.getAttribute("currentpage").toString());
                } else {
                    response.sendRedirect("index.jsp");
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
