<%-- 
    Document   : upgrade
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>
<%
HttpSession upsess=request.getSession();
if(upsess.getAttribute("loguser")==null){
    response.sendRedirect("login.jsp");
    upsess.setAttribute("currentpage", "upgrade.jsp");
    upsess.setAttribute("msg", "Please login first");
}else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
         <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function (){
               nice = $("html").niceScroll(); 
               <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <%
    Controller.Search_Shop_management ssm=new Controller.Search_Shop_management();
    List<DB.ShopType> lst=ssm.searchShopTypeAll();
    %>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">

                <div  class="container" >
                    <div class="row vertical-center-row">
                        <div id="hideme" class="col-lg-12">
                            <div class="row ">
                                <div  class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4" >
                                    <div class="log" >
                                        <h3>Upgrade profile to Bussiness account</h3>
                                        <form method="post" action="UpgradeProfile">
                                            <table width="50%">
                                                <tr>
                                                    <td>Shop Name:</td>
                                                    <td><input type="text" required name="sname" value="" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Shop Type:</td>
                                                    <td>
                                                        <select required name="stype">
                                                            <%
                                                        for(DB.ShopType st:lst){
                                                        %>
                                                        <option><%=st.getTypeName() %></option>
                                                        <% } %>
                                                        <option >Other</option>
                                                        </select>
                                                    </td>
                                                    
                                                </tr>
                                            </table>
                                                        <input type="submit" class="btn btn-primary" value="Upgrade" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
<% } %>