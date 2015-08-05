/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.FronAdImages;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "uploadslideimages", urlPatterns = {"/uploadslideimages"})
public class uploadslideimages extends HttpServlet {
    private String bid;
    private String heding;
    private String heding1;
    private String heding2;
    private String heding3;
    private String heding4;
    private String pname;
    private String path;
    private String path1;
    private String path2;
    private String path3;
    private String path4;

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
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<Object> items = upload.parseRequest(request);
                for (Object elements : items) {
                    FileItem fileitem = (FileItem) elements;
                    if (fileitem.isFormField()) {
                        if (fileitem.getFieldName().equals("bid")) {
                            bid = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("heding")) {
                            heding = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("heding1")) {
                            heding1 = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("heding2")) {
                            heding2 = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("heding3")) {
                            heding3 = fileitem.getString();
                        } else if (fileitem.getFieldName().equals("heding4")) {
                            heding4 = fileitem.getString();
                        } 
                    } else {
                        if(fileitem.getFieldName().equals("image")){
                        path = "upload_images/" + heding + System.currentTimeMillis() + ".jpg";
                        File savedfile = new File(request.getServletContext().getRealPath("/") + path);
                        fileitem.write(savedfile);
                        } else if(fileitem.getFieldName().equals("image1")){
                        path1 = "upload_images/" + heding1 + System.currentTimeMillis() + ".jpg";
                        File savedfile1 = new File(request.getServletContext().getRealPath("/") + path1);
                        fileitem.write(savedfile1);
                        }else if(fileitem.getFieldName().equals("image2")){
                        path2 = "upload_images/" + heding2 + System.currentTimeMillis() + ".jpg";
                        File savedfile2 = new File(request.getServletContext().getRealPath("/") + path2);
                        fileitem.write(savedfile2);
                        }else if(fileitem.getFieldName().equals("image3")){
                        path3 = "upload_images/" + heding3 + System.currentTimeMillis() + ".jpg";
                        File savedfile3 = new File(request.getServletContext().getRealPath("/") + path3);
                        fileitem.write(savedfile3);
                        }else if(fileitem.getFieldName().equals("image4")){
                        path4 = "upload_images/" + heding4 + System.currentTimeMillis() + ".jpg";
                        File savedfile4 = new File(request.getServletContext().getRealPath("/") + path4);
                        fileitem.write(savedfile4);
                        }
                        
                    }
                }
                Session s=Connection.Connection.getSessionFactory().openSession();
                DB.Bidding b=(DB.Bidding) s.load(DB.Bidding.class, Integer.parseInt(bid));
                Transaction t=s.beginTransaction();
                DB.FronAdImages adImages=new FronAdImages();
                adImages.setAdDescription(heding);
                adImages.setBidding(b);
                adImages.setImgPath(path);
                s.save(adImages);
                t.commit();
                Transaction t1=s.beginTransaction();
                DB.FronAdImages adImages1=new FronAdImages();
                adImages1.setAdDescription(heding1);
                adImages1.setBidding(b);
                adImages1.setImgPath(path1);
                s.save(adImages1);
                t1.commit();
                Transaction t2=s.beginTransaction();
                DB.FronAdImages adImages2=new FronAdImages();
                adImages2.setAdDescription(heding2);
                adImages2.setBidding(b);
                adImages2.setImgPath(path2);
                s.save(adImages2);
                t2.commit();
                Transaction t3=s.beginTransaction();
                DB.FronAdImages adImages3=new FronAdImages();
                adImages3.setAdDescription(heding3);
                adImages3.setBidding(b);
                adImages3.setImgPath(path3);
                s.save(adImages3);
                t3.commit();
                Transaction t4=s.beginTransaction();
                DB.FronAdImages adImages4=new FronAdImages();
                adImages4.setAdDescription(heding4);
                adImages4.setBidding(b);
                adImages4.setImgPath(path4);
                s.save(adImages4);
                t4.commit();
                s.close();
                response.sendRedirect("uploadimages.jsp?bid=4");
            } catch (Exception e) {
                e.printStackTrace();
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
