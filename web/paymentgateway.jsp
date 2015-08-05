<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page import="DB.CartItems"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <script src="javascripts/jQuery.print.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
               
                    $('.print').click(function (){
     $.print("#printable");                
    });
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <%                    if (sess.getAttribute("cart") != null && sess.getAttribute("loguser") != null) {
                        int displayid = Integer.parseInt(request.getParameter("displayid"));
                        String address = request.getParameter("address");
                        int sid = Integer.parseInt(request.getParameter("sid"));
                        int qty = Integer.parseInt(request.getParameter("qty"));
                        String method = request.getParameter("method");

                        ArrayList<CarttItems> st = (ArrayList<CarttItems>) sess.getAttribute("cart");
                        CarttItems carttItems = st.get(displayid);
                %>
                <div style="width: 60%;margin-left: auto;margin-right: auto;" id="printable" class="well">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Descriptions</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <ul style="list-style: none">
                                        <li><%= carttItems.getStock().getProductName()%></li>
                                        <li>Price : <%= carttItems.getStock().getDiscountPrice()%>0</li>
                                        <li>Quantity : <%= Integer.parseInt(request.getParameter("qty")) %></li>
                                        <li>Payment Method : <%= method %></li>
                                    </ul>
                                </td>
                                <td><%= Integer.parseInt(request.getParameter("qty")) * carttItems.getStock().getDiscountPrice()%></td>

                            </tr>
                            <tr>
                                <td><h4>Item Total :</h4></td>
                                <td><h4><%= Integer.parseInt(request.getParameter("qty")) * carttItems.getStock().getDiscountPrice()%></h4></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                            <form style="float: left;" method="post" action="ProcessCheckout">
                    <input type="hidden" name="displayid" value="<%= displayid%>" />
                    <input type="hidden" name="address" value="<%= address%>" />
                    <input type="hidden" name="sid" value="<%= sid%>" />
                    <input type="hidden" name="qty" value="<%= qty%>" />
                    <input type="hidden" name="method" value="<%= method%>" />
                    <input class="btn btn-primary" type="submit" value="Checkout" />
                </form>
                <input style="float: left;"  class="btn btn-primary print" type="submit" value="Print" />
                <%
                if(method!="delivery"){
                    %>
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                    <input type="hidden" name="cmd" value="_xclick">
                    <input type="hidden" name="business" value="nirodyagamage@gmail.com">
                    <input type="hidden" name="lc" value="US">
                    <input type="hidden" name="item_name" value="abcdef">
                    <input type="hidden" name="amount" value="<%= carttItems.getStock().getDiscountPrice()%>">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="button_subtype" value="services">
                    <input type="hidden" name="no_note" value="0">
                    <input type="hidden" name="shipping" value="40.00">
                    <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
                    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form>
                <%
                }
                %>
                
                <%
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                %>

            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
