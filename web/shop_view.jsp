<%@page import="Controller.Subscription"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page import="DB.ShopsHasStock"%>
<%@page import="Controller.LoadProductManager"%>
<%@page import="Controller.Load_Shop_Management"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int shopid = Integer.parseInt(request.getParameter("shopid"));
    Load_Shop_Management lsm = new Load_Shop_Management();
    LoadProductManager lppm = new LoadProductManager();
    DB.Shops shp = lsm.loadShops(shopid);
    List<DB.ShopsHasStock> lshs;
    Session s = Connection.Connection.getSessionFactory().openSession();
    Criteria cc = s.createCriteria(DB.ShopsHasStock.class);
    cc.add(Restrictions.eq("shops", shp));
    List<DB.Shops> l = cc.list();
    s.close();
    int pages = l.size();
    int pagescount = pages % 6;
    int pageid = 0;

    if (request.getParameter("pageid") == null) {

        lshs = lppm.loadShophasStock(shp, 0);
    } else {
        pageid = Integer.parseInt(request.getParameter("pageid"));
        lshs = lppm.loadShophasStock(shp, Integer.parseInt(request.getParameter("pageid")));
    }
    Set<DB.Ownership> stow=shp.getOwnerships();
    boolean ucheck=false;
     if (request.getSession().getAttribute("loguser") != null) {
    
    DB.User us=(DB.User)request.getSession().getAttribute("loguser");
    for(DB.Ownership ow:stow){
        if(us.getIduser()!=ow.getUser().getIduser()){
            ucheck=false;
        }else{
            ucheck=true;
        }
    }
     }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <%@include file="menuhead.jsp" %>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>

            });
        </script>
    </head>
    <body>

        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <%                    
                if(ucheck){
                }else{
                if (sess.getAttribute("loguser") != null) {
                        Controller.Subscription sbscription = new Subscription();
                        if (sbscription.searchSubcription(user, shp)) {

                %>
                <div id="subscribe">
                    <button id="subsbut" style="margin-right: 0px;" class="btn btn-danger"><span class="glyphicon glyphicon-user"></span>&nbsp;Subscribe</button>
                </div>
                <script>
                    $('#subsbut').click(function () {

                        $.ajax({url: 'Subscribe?shopid=<%= shopid%>&user=<%= user.getIduser()%>', success: function (result) {
                                $('#subscribe').html(result);
                            }});
                    });
                </script>
                <%
                        }
                    }
                }
                %>
                <h1 style="width: 100%;text-align: center">Products of <%= shp.getSname() %></h1>
                <div style="width: 100%" class="row">
                    <%

                        for (ShopsHasStock shs : lshs) {
                            if (shs.getStock().getStatus() == 1) {
                    %>
                    <div style="width: 25%;height: 250px;float: left">
                        <div style="width: 80%;height: 250px;" class="panel panel-info">
                            <div class="panel-heading">
                                <a style="width: 100%;" href="view_products.jsp?pid=<%= shs.getStock().getIdstock()%>"><h3 class="panel-title"><%= shs.getStock().getProductName()%></h3></a>
                            </div>
                            <div class="panel-body">
                                <img style="width: 100%" height="100" src="<%= shs.getStock().getImage()%>" alt="<%= shs.getStock().getProductName()%>" />
                                <form action="DisableProductSeller" method="post">
                                    <input type="hidden" name="pid" value="<%= shs.getStock().getIdstock()%>" />
                                    <input class="btn btn-danger" type="submit" value="Remove" />
                                </form>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>
                </div>

                <div><a href="add_products.jsp">Add more products</a></div>
                <%
                    if (pagescount == 0) {
                        for (int i = 0; i < pages / 6; i++) {
                            if (i == 0) {
                %>
                <li style="display: inline"><a href="shop_view.jsp?shopid=<%= shopid%>&pageid=<%=i%>"><%= i + 1%></a></li>
                    <%
                        }
                    %>
                <li style="display: inline"><a href="shop_view.jsp?shopid=<%= shopid%>&pageid=<%=6 * i + 1%>"><%= i + 1%></a></li>
                    <%
                        }
                    } else {
                        int pp = (pages / 6) + 1;
                        for (int i = 0; i < pp; i++) {
                            if (i == 0) {
                    %>
                <li style="display: inline"><a href="shop_view.jsp?shopid=<%= shopid%>&pageid=<%=i%>"><%= i + 1%></a></li>
                    <%
                    } else {
                    %>
                <li style="display: inline"><a href="shop_view.jsp?shopid=<%= shopid%>&pageid=<%=6 * i + 1%>"><%= i + 1%></a></li>
                    <%
                                }
                            }
                        }
                    %>
                <%
                if(ucheck){
                    %>
                <div style="width: 100%" class="row">
                    <h4>Removed or disabled Products are below</h4>
                    <h5>You have to contact admin to activate product from our contact us page.</h5>
                    <%
                        for (ShopsHasStock shs : lshs) {
                            if (shs.getStock().getStatus() == 0) {
                    %>
                    <div style="width: 25%;height: 250px;float: left">
                        <div style="width: 80%;height: 250px;" class="panel panel-info">
                            <div class="panel-heading">
                                <a style="width: 100%;" href="view_products.jsp?pid=<%= shs.getStock().getIdstock()%>"><h3 class="panel-title"><%= shs.getStock().getProductName()%></h3></a>
                            </div>
                            <div class="panel-body">
                                <img style="width: 100%" height="100" src="<%= shs.getStock().getImage()%>" alt="<%= shs.getStock().getProductName()%>" />

                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %>
                </div>    
                <%
                }
                %>





            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
