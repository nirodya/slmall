/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ChatSave", urlPatterns = {"/ChatSave"})
public class ChatSave extends HttpServlet {

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
            HttpSession sess = request.getSession();
            DB.User sendUser = null;
            if (sess.getAttribute("loguser") != null) {
                sendUser = (DB.User) sess.getAttribute("loguser");
            } else {
                sess.setAttribute("msg", "Please login first");
                response.sendRedirect("login.jsp");
            }
            
            String page=request.getParameter("page");
            //System.out.println(request.getParameter("reciever"));
            int reciever=Integer.parseInt(request.getParameter("reciever"));
            //System.out.println(request.getParameter("reciever"));
            String subject=request.getParameter("subject");
            //System.out.println("sub");
            String message=request.getParameter("message");
            //System.out.println("mess");
            Controller.User_cont uc=new Controller.User_cont();
            //System.out.println("object");
            uc.saveChat(message, reciever, subject, sendUser);
            //System.out.println("save");
            response.sendRedirect(page);
            
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
