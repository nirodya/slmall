<%-- 
    Document   : upgrade
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));
    Controller.LoadProductManager lpm = new Controller.LoadProductManager();
    DB.Stock stockview = lpm.loadStock(pid);

    Session hs = Connection.Connection.getSessionFactory().openSession();
    Criteria stc = hs.createCriteria(DB.ShopsHasStock.class);
    stc.add(Restrictions.eq("stock", stockview));
    List<DB.ShopsHasStock> shsl = stc.list();
    Set<DB.Ownership> stow = null;
    DB.User stuser = null;
    DB.Shops stshop = null;
    for (DB.ShopsHasStock shs : shsl) {
        stshop = shs.getShops();
        stow = shs.getShops().getOwnerships();
    }
    for (DB.Ownership fstow : stow) {
        stuser = fstow.getUser();
    }
    hs.close();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <link rel="stylesheet" href="Styles/productstyle.css">
        <%@include file="menuhead.jsp" %>

        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/zoom/ZoomPic.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <title>SL Mall</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
                $("#zoomimg").ZoomPic();
            <%@include file="javascripts/menuscript.js"  %>




                $.ajax({url: 'suggestions.jsp?catogary=<%=stockview.getCatogaries().getCatogariName()%>&&govalue=' + $('#govalue').val(), success: function (result) {
                        $('#suggestions').animate({}, 3000, function () {
                            $('.otherdiv').fadeOut(1000, 'swing');
                            $('#suggestions').html(result);
                        });
                    }});

            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>

            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">

                <div class="log" >
                    <div id="zoomimg" class="well">
                        <center><h3><%=stockview.getProductName()%></h3></center>
                        <div width="100%" >
                            <img id="pimg" style="float: left;" src="<%=stockview.getImage()%>" width="40%" height="400px" />
                            <form method="post" action="AddToCart">
                                <table style="float: right;width: 30%;margin-left: 5%;margin-right: 15%;text-align: center;" class="table table-striped">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><h4>Rs:</h4></td>
                                        <td><h4><%=stockview.getDiscountPrice()%>0</h4></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><h5>Value Rs:</h5></td>
                                        <td><h5><%=stockview.getSellingPrice()%>0</h5></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><h5>Quantity:</h5></td>
                                        <td><h5><%=stockview.getQty()%></h5></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><h5>Qty</h5></td>
                                        <td><h5><input required type="number" min="1" max="<%=stockview.getQty()%>" name="qty" value="" /></h5></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <%
                                                if (user != null) {
                                                    if (user.getIduser() != stuser.getIduser()) {
                                            %>
                                            <input type="hidden" name="pid" value="<%=stockview.getIdstock()%>" />
                                            <input class="btn btn-primary" type="submit" value="Add to cart" />
                                            <%
                                                    }
                                                }else if(user==null){
                                                    %>
                                             <input type="hidden" name="pid" value="<%=stockview.getIdstock()%>" />
                                            <input class="btn btn-primary" type="submit" value="Add to cart" />
                                            <%
                                                }
                                            %>


                                        </td>
                                    </tr>
                                </table>
                            </form>


                        </div>
                        <div style="clear: both;width: 100%;">
                            <%=stockview.getDescription()%>
                        </div>
                        <%
                            if (user != null) {
                                if (user.getIduser() != stuser.getIduser()) {
                        %>
                        <form method="post" action="SendMessage.jsp">
                            <input name="page" type="hidden" value="view_products.jsp?pid=<%=stockview.getIdstock()%>" />
                            <input name="heading" type="hidden" value="Ask a question from owner" />
                            <% Set<DB.ShopsHasStock> shopsHasStocks = stockview.getShopsHasStocks();
                                for (DB.ShopsHasStock shs : shopsHasStocks) {
                                    Set<DB.Ownership> ownerships = shs.getShops().getOwnerships();
                                    for (DB.Ownership o : ownerships) {
                            %>
                            <input name="uname" type="hidden" value="<%= o.getUser().getIduser()%>" />

                            <input class="btn btn-primary" type="submit" value="Send Message to owner" />
                            <%

                                    }
                                }
                            %>


                        </form>
                        <%
                                }
                            }
                        %>

                        <%
                            if (user != null) {
                                if (user.getIduser() == stuser.getIduser()) {
                        %>
                        <a href="update_products.jsp?shpid=<%= stshop.getIdShops()%>&pid=<%= pid%>"><button class="btn btn-primary">Update Product</button></a>
                        <%
                                }
                            }
                        %>
                    </div>
                    <h4>You may also like</h4>
                    <div id="suggestions" class="well" style="overflow: scroll; white-space: nowrap;overflow-y: hidden;margin: 0 auto;">
                        <input id="govalue" type="hidden" name="govalue" value="0" />
                    </div>
                    <br>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
