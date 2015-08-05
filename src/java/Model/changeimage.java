/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "changeimage", urlPatterns = {"/changeimage"})
public class changeimage extends HttpServlet {
    private String recid;
    private String fadid;
    private String mes;
    private String heding;
    private String path;
    private String des;

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
            if (request.getSession().getAttribute("loguser")!=null) {
                try {
                 FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<Object> items = upload.parseRequest(request);
                for (Object elements : items) {
                    FileItem fileitem = (FileItem) elements;
                    if (fileitem.isFormField()) {
                        if (fileitem.getFieldName().equals("recid")) {
                            recid = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("fadid")) {
                            fadid = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("mes")) {
                            mes = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("des")) {
                            des = fileitem.getString();
                        }
                    } else {
                        
                        path = "upload_images/" + recid + System.currentTimeMillis() + ".jpg";
                        File savedfile = new File(request.getServletContext().getRealPath("/") + path);
                        fileitem.write(savedfile);
                        
                        
                    }
                    
                }
                Session s=Connection.Connection.getSessionFactory().openSession();
                    DB.FronAdImages fadi=(DB.FronAdImages) s.load(DB.FronAdImages.class, Integer.parseInt(fadid));
                    Transaction t=s.beginTransaction();
                    fadi.setAdDescription(des);
                    fadi.setImgPath(path);
                    s.update(fadi);
                    t.commit();
                    s.close();
                    Controller.User_cont uc=new Controller.User_cont();
            //System.out.println("object");
            uc.saveChat(mes, Integer.parseInt(recid), "Change slider Image", (User) request.getSession().getAttribute("loguser"));
            response.sendRedirect("slidemanager.jsp");
            } catch (Exception e) {
            }
            } else {
                response.sendRedirect("index.jsp");
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
