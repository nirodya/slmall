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

/**
 *
 * @author Nirodya Gamage
 */
@WebServlet(name = "Update_user_servelet", urlPatterns = {"/Update_user_servelet"})
public class Update_user_servelet extends HttpServlet {

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
            String reqtype = request.getParameter("reqtype");
            System.out.println(reqtype);
            Controller.Update_User_Cont uuc = new Controller.Update_User_Cont();
            if (reqtype.equals("upfname")) {
                System.out.println("in");
                String user = request.getParameter("fname");
                System.out.println(user + " " + request.getParameter("upuid"));
                int upuid = Integer.parseInt(request.getParameter("upuid"));

                DB.User updateduser = uuc.updateFname(upuid, user);
                System.out.println(updateduser.getFname());
                out.write(updateduser.getFname());
            }
            if (reqtype.equals("uplname")) {
                String user = request.getParameter("lname");
                System.out.println(user + " " + request.getParameter("upuid"));
                int upuid = Integer.parseInt(request.getParameter("upuid"));

                DB.User updateduser = uuc.updateLname(upuid, user);
                System.out.println(updateduser.getLname());
                out.write(updateduser.getLname());
            }
            if (reqtype.equals("upmobile")) {
                String user = request.getParameter("mobile");
                System.out.println(user + " " + request.getParameter("upuid"));
                int upuid = Integer.parseInt(request.getParameter("upuid"));

                DB.User updateduser = uuc.updateMobile(upuid, Integer.parseInt(user));
                System.out.println(updateduser.getMobileNo());
                out.write(updateduser.getMobileNo());
            }
            if (reqtype.equals("upad")) {
                String ad1 = request.getParameter("ad1");
                String ad2 = request.getParameter("ad2");
                String city = request.getParameter("city");
                String district = request.getParameter("district");
                String province = request.getParameter("province");
                String postalcode = request.getParameter("postalcode");
                
                int upuid = Integer.parseInt(request.getParameter("upuid"));
                
                Controller.Search_User_Cont su=new Controller.Search_User_Cont();
                DB.User us=su.searchUser(upuid);
                
                DB.City c=su.searchCity(city);
                DB.District d=su.searchDistrict(district);
                DB.Province p=su.searchProvinceOnce(province);
                DB.PostalCode po=su.searchPostalCode(city);
                System.out.println(city);
                System.out.println(c.getIdcity());
                System.out.println(d.getIddistrict());
                System.out.println(p.getIdprovince());
                System.out.println(po.getIdpostalCode());
                DB.Address add = uuc.updateAddress(ad1, ad2, us.getAddress().getIdaddress(), c.getIdcity(), d.getIddistrict(), p.getIdprovince(), po.getIdpostalCode());
                out.write(add.getAddressOne());
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
