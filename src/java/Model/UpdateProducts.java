/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "UpdateProducts", urlPatterns = {"/UpdateProducts"})
public class UpdateProducts extends HttpServlet {
    

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
            try {
                int pid=0;
                String subcatogary=null;
            String pname = null;
            String pcode = null;
            String catogary = null;
            int qty = 0;
            double sprice = 0;
            double dprice = 0;
            int shpid=0;
            String about = null;
            String path = null;
            try {
            FileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            List<Object> items=upload.parseRequest(request);
                for (Object elements : items) {
                    FileItem fileitem=(FileItem) elements;
                    if (fileitem.isFormField()) {
                        if (fileitem.getFieldName().equals("pname")) {
                            pname=fileitem.getString();
                        }
                        else if (fileitem.getFieldName().equals("pcode")) {
                            pcode=fileitem.getString();
                        }
                        else if (fileitem.getFieldName().equals("shpid")) {
                            shpid=Integer.parseInt(fileitem.getString());
                        }
                        else if (fileitem.getFieldName().equals("pid")) {
                            pid=Integer.parseInt(fileitem.getString());
                        }
                        else if (fileitem.getFieldName().equals("catogary")) {
                            catogary=fileitem.getString();
                        }
                        else if (fileitem.getFieldName().equals("qty")) {
                            qty=Integer.parseInt(fileitem.getString());
                        }
                        else if (fileitem.getFieldName().equals("sprice")) {
                            sprice=Double.parseDouble(fileitem.getString());
                        }
                        else if (fileitem.getFieldName().equals("dprice")) {
                            dprice=Double.parseDouble(fileitem.getString());
                        }
                        else if (fileitem.getFieldName().equals("about")) {
                            about=fileitem.getString();
                        }
                        else if (fileitem.getFieldName().equals("subcatogary")) {
                            subcatogary=fileitem.getString();
                        }
                    } else {
                        path="upload_images/"+pname+System.currentTimeMillis()+".jpg";
                        File savedfile=new File(request.getServletContext().getRealPath("/")+path);
                        fileitem.write(savedfile);
                    }
                }
                System.out.println(subcatogary);
                //Controller.SearchProductManagement spm=new Controller.SearchProductManagement();
               // Controller.LoadProductManager lpm=new Controller.LoadProductManager();
                System.out.println("1");
                Controller.UpdateProductManagement pm=new Controller.UpdateProductManagement();
                 System.out.println("2");
                 Session s=Connection.Connection.getSessionFactory().openSession();
                 Criteria c=s.createCriteria(DB.Catogaries.class);
                 c.add(Restrictions.eq("catogariName", catogary));
                 DB.Catogaries catog=(DB.Catogaries) c.uniqueResult();
                DB.SubCatogary sbctgry=(DB.SubCatogary) s.load(DB.SubCatogary.class, Integer.parseInt(subcatogary));
                 System.out.println("3");
               // DB.SubCatogary sbctgry=lpm.loadSubcatogary(Integer.parseInt(subcatogary));
                 System.out.println("4");
                 s.close();
                DB.Stock stk=pm.updateStock(pid, catog, about, dprice, path, pcode, pname, qty, sprice, sbctgry);
//                 System.out.println("5");
//                Controller.Load_Shop_Management lsm=new Controller.Load_Shop_Management();
//                 System.out.println("6");
//                DB.Shops loadedshop=lsm.loadShops(shpid);
//                 System.out.println("7");
//                DB.ShopsHasStock shphsstk=pm.saveShopHasStock(loadedshop, stk);
//                 System.out.println("8");
                response.sendRedirect("manage_shops.jsp");
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            } catch (Exception e) {
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
