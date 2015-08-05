<%-- 
    Document   : index
    Created on : Jun 4, 2014, 8:22:10 AM
    Author     : Nirodya Gamage
--%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%
    Session hibsSession = Connection.Connection.getSessionFactory().openSession();
    HttpSession httpsess = request.getSession();
    if (httpsess.getAttribute("loguser") == null) {
        httpsess.setAttribute("msg", "Please log in again");
        response.sendRedirect("login.jsp");
    } else {
        DB.User us = (DB.User) httpsess.getAttribute("loguser");
        if(us.getStatus()==0 ){
            httpsess.setAttribute("msg", "Please activate your account");
        response.sendRedirect("login.jsp");
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
        <script type="text/javascript" src="javascripts/Update_shops.js"></script>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
                var j = $('#jqloop').attr("no");
                for (i1 = 0; i1 < j + 1; i1++) {
                    $('#second' + i1).hide();
                    $('#third' + i1).hide();
                    $('#second1' + i1).hide();
                    $('#second12' + i1).hide();
                    $('#third1' + i1).hide();
                }


                $('#intro').hide();
                $('#iconimage').hide();
                $('#newshop').hide();
                $('#styptextfield').hide();
                $('#introlink').click(function () {
                    $('#intro').show();
                    $('#iconimage').hide();
                });
                $('#intro').mousemove(function () {
                    $('#iconimage').show();
                });
                $('#iconimage').click(function () {
                    $('#htvid').get(0).pause();
                    $('#intro').hide();
                });
                $('#shopselect').change(function () {
                    // alert($( "#shopselect option:selected" ).text());
                    if ($("#shopselect option:selected").text() === "Register New Shop") {
                        $('#shopinfo').hide();
                        $('#newshop').show(1000);
                    } else {
                        $('#newshop').hide();
                        $('#shopinfo').show(1000);
                    }
                });
                $('#stypesave').change(function () {
                    if ($("#stypesave option:selected").text() === "Other") {

                        $('#styptextfield').show(1000);
                    } else {
                        $('#styptextfield').hide();
                    }
                });

                $('.command1').click(function () {
                    var i = $(this).attr("n");
                    $('#first' + i).hide();

                    $('#second' + i).show(500);

                    $('#third' + i).show(500);
                    $('#first1' + i).hide();
                    $(this).hide();
                    $('#second12' + i).show(500);

                    $('#third1' + i).show(500);
                });


            });

        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">


                <div id="intro" style="background: rgba(255, 255, 255, 0.8);
                     position:fixed;
                     width:100%;
                     height:100%;
                     top:0px;
                     left:0px;
                     z-index:1000;"><img id="iconimage" height="50" width="50" style="float: right;z-index: 1000; position: absolute;" src="images/imageedit_1_9313632339.gif" /><div style="width: 100%;height: 100%; margin: auto;margin-left: auto;margin-right: auto; opacity: 2;"><video id="htvid"  style="width: 100%; height: 100%;"  controls><source src="videos/The CW - TV Now - YouTube.mp4" type="video/mp4"><source src="videos/The CW - TV Now - YouTube.webm" type="video/webm" /></video></div></div>
                <div style="width: 100%;" class="well">
                    <h3 style=" text-align: center; color: #0073FF; margin-left: auto;margin-right: auto;">Manage Shops</h3>
                    <div id="items">
                        <table>
                            <tr>
                                <td>Registered Shops :</td>
                                <td><select id="shopselect" name="shops">
                                        <%
                                            
                                            Session ownsess=Connection.Connection.getSessionFactory().openSession();
                                            Criteria ownCriteria=ownsess.createCriteria(DB.Ownership.class);
                                            ownCriteria.add(Restrictions.eq("user", us));
                                            List<DB.Ownership> owl=ownCriteria.list();
                                            for (DB.Ownership ow : owl) {
                                                
                                        %>
                                        <option id="shpidforupdate" value="<%=ow.getShops().getIdShops()%>"><%=ow.getShops().getSname()%></option>

                                        <% }%>
                                        <option >Register New Shop</option>
                                    </select></td>
                            </tr>
                        </table>
                        <input type="hidden" id="upuid" name="upuid" value="<%=us.getIduser()%>" />
                        <table id="shopinfo" class="table table-striped">
                            <tr>
                                <th >Shop Name</th>
                                <th >Shop Type</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <%
                                int i = 0;
                                for (DB.Ownership ow : owl) {
                                    
                                    i++;
                                    if(ow.getShops().getStatus()!=0){
                            %>
                            <tr>

                                <td width="25%" id="first<%=i%>"><a href="shop_view.jsp?shopid=<%= ow.getShops().getIdShops() %>"><%=ow.getShops().getSname()%></a></td>
                            <input type="hidden" id="shpid<%=i%>" name="" value="<%=ow.getShops().getIdShops()%>" />
                            <td width="25%" id="second<%=i%>"><input type="text" required="required" id="sname<%=i%>" name="upfname" value="<%=ow.getShops().getSname()%>" /></td>




                            <td width="25%" id="first1<%=i%>"><%=ow.getShops().getShopType().getTypeName()%></td>
                            <td width="25%" id="second1<%=i%>"><input type="text" id="stype<%=i%>" name="upstype" value="<%=ow.getShops().getShopType().getTypeName()%>" /></td>
                            <td width="25%" id="second12<%=i%>"><select id="stypupdate<%=i%>" name="stype">
                                    <%
                                        
                                        Criteria c = hibsSession.createCriteria(DB.ShopType.class);
                                        List<DB.ShopType> lst = c.list();
                                        for (DB.ShopType s : lst) {
                                    %>
                                    <option><%=s.getTypeName()%></option>
                                    <% }%>
                                    <option>Other</option>
                                </select></td>

                            <td width="25%" n="<%=i%>"  class="command1"><a>update</a></td>
                            <td width="25%" id="third1<%=i%>"><input onclick="UpdateShopType()" class="btn btn-primary" type="submit" value="Save" /></td>
                            <td width="25%" ><form method="post" action="add_products.jsp"><input type="hidden" name="shpid" value="<%=ow.getShops().getIdShops()%>" /><input class="btn btn-primary" type="submit" value="Add Products" /></form></td>
                            </tr>
                            <% }}%>
                        </table>
                        <input type="hidden" id="jqloop" no="<%=i%>" name="" value="" />
                        <table id="newshop" class="table table-striped">
                            <tr>
                                <td>Shop Name:</td>
                                <td><input id="snameManual" type="text" name="sname" value="" /></td>
                            </tr>
                            <tr>
                                <td>Shop Type:</td>
                                <td><select id="stypesave" name="stype">
                                        <%
                                            Criteria c = hibsSession.createCriteria(DB.ShopType.class);
                                            List<DB.ShopType> lst = c.list();
                                            for (DB.ShopType s : lst) {
                                        %>
                                        <option><%=s.getTypeName()%></option>
                                        <% } %>
                                        <option>Other</option>
                                    </select></td>

                            </tr>
                            <tr id="styptextfield">
                                <td>Type Name:</td>
                                <td ><input id="othertype" type="text" name="otherstype" value="" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input class="btn btn-primary" onclick="SaveShops()" type="submit" value="Save" /></td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%
                                            
        }
        }%>