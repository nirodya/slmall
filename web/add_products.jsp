<%-- 
    Document   : add_products
    Created on : Oct 19, 2014, 8:59:38 AM
    Author     : Nirodya
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <title>SL Mall</title>
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <script type="text/javascript">


            function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function (oFREvent) {
                    document.getElementById("uploadPreview").src = oFREvent.target.result;
                };
            }
            ;

        </script>
        <script>
            $(document).ready(function (){
               nice = $("html").niceScroll(); 
               <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body>
        <%
            String shpid = null;
            String shpname = null;
            if (request.getParameter("shpid") != null) {
                shpid = request.getParameter("shpid");
                shpname = new Controller.Search_Shop_management().searchShopbyId(Integer.parseInt(shpid)).getSname();
            } else {
                response.sendRedirect("manage_shops.jsp");
            }
        %>
        <div id="wrapper">
            <%@include file="menu.jsp" %>

            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">


                <div style="width: 100%;" class="well">
                    <h3 style=" text-align: center; color: #0073FF; margin-left: auto;margin-right: auto;">Add products to <%=shpname%></h3>
                    <div style="width: 100%;height: 100%">
                    <div style="width: 25%;float: right;">
                        Preview<br>
                        <img id="uploadPreview"  width="100%" height="100%"/></div>
                    <form  action="SaveProducts" enctype="multipart/form-data" method="post">
                        <input type="hidden" name="shpid" value="<%=shpid%>" />
                        <table width="70%">
                            <tr>
                                <td width="30%">Product Name:</td>
                                <td ><input class="form-control" required="required" type="text" name="pname" value="" /></td>
                            </tr>
                            <tr>
                                <td>Product Code:</td>
                                <td><input class="form-control" required type="text" name="pcode" value="" /></td>
                            </tr>
                            <tr>
                                <td>Product Catogary:</td>
                                <td><select class="form-control" name="catogary">
                                        <%
                                            List<DB.Catogaries> srchprlist = new Controller.SearchProductManagement().searchCatogaryAll();
                                            for (DB.Catogaries cat : srchprlist) {
                                                if (cat.getCatogariName() != "Other") {
                                        %>
                                        <option><%=cat.getCatogariName()%></option>
                                        <% }
                                            }%>
                                        <option>Other</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Sub Catogary:</td>
                                <td>
                                    <select class="form-control" name="subcatogary" id="subcat">
                                        <%
                                            List<DB.SubCatogary> srchsubprlist = new Controller.SearchProductManagement().searchSubCatogaryAll();
                                            for (DB.SubCatogary cat : srchsubprlist) {
                                                if (cat.getSubCatogaryName()!= "Other") {
                                        %>
                                        <option value="<%=cat.getIdSubCatogary() %>" ><%=cat.getSubCatogaryName() %></option>
                                        <% }
                                            }%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Qty:</td>
                                <td><input class="form-control" required type="number" min="0.00" name="qty" value="" /></td>
                            </tr>
                            <tr>
                                <td>Selling Price:</td>
                                <td><input class="form-control" required type="number" min="0.00"  name="sprice" value="" />.00</td>
                            </tr>
                            <tr>
                                <td>Discount Price:</td>
                                <td><input class="form-control" required type="number" min="0.00" name="dprice" value="" />.00</td>
                            </tr>
                            <tr>
                                <td>About:</td>
                                <td><textarea class="form-control" name="about" required="required" rows="4" cols="20">
                                    </textarea></td>
                            </tr>
                            <tr>
                                <td>Image:</td>
                                <td><input  id="uploadImage" required="required" onchange="PreviewImage();" class="btn btn-file" type="file" accept="image/*" name="img" value=""  /></td>
                                
                            </tr>

                        </table>
                        <input class="btn btn-primary" type="submit" value="Save" />
                    </form>
                    </div>
                </div>



            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>