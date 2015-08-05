/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.SubCatogary;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "adminsubcatogarysave", urlPatterns = {"/adminsubcatogarysave"})
public class adminsubcatogarysave extends HttpServlet {

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
            String catid=request.getParameter("catid");
            String subcatname=request.getParameter("subcatname");
            Session s=Connection.Connection.getSessionFactory().openSession();
            Criteria catc=s.createCriteria(DB.Catogaries.class);
            catc.add(Restrictions.eq("idcatogaries", Integer.parseInt(catid)));
            DB.Catogaries ca=(DB.Catogaries) catc.uniqueResult();
            Criteria c=s.createCriteria(DB.SubCatogary.class);
            c.add(Restrictions.eq("catogaries", ca));
            List<DB.SubCatogary> subl=c.list();
            boolean b=true;
            for (SubCatogary subl1 : subl) {
                if (subl1.getSubCatogaryName().equals(subcatname)) {
                    b=false;
                }
            }
            if (b) {
                Transaction t=s.beginTransaction();
                SubCatogary sb=new SubCatogary();
                sb.setSubCatogaryName(subcatname);
                sb.setCatogaries(ca);
                s.save(sb);
                t.commit();
            }
            s.close();
            response.sendRedirect("subcatogarymanagement.jsp");
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
