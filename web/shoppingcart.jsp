<%-- 
    Document   : contact_us
    Created on : Jul 31, 2014, 11:14:46 AM
    Author     : Nirodya Gamage
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>

        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.min.js"></script>
        <title>Shop</title>
        <style type="text/css">
            #bod{
                font-family: 'Lato', sans-serif;


            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body id="bod">

        <div id="wrapper">
            <div>
                <%@include file="menu.jsp" %>
                <div id="middle" style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                    <%
                        // ArrayList<DB.Stock> ar=new ArrayList<>();
                        HttpSession httpSession = request.getSession();
                        if (httpSession.getAttribute("cart") != null) {
                            ArrayList<CarttItems> st = (ArrayList<CarttItems>) httpSession.getAttribute("cart");
                            if(st.size()!=0 ){

                    %>
                    <h3 style="margin-left: auto;margin-right: auto;text-align: center;">Your Shopping Cart</h3>
                    <div style="width: 100%;" class="well">

                        <%                            DB.Stock nstl;
                            int qty;
                            int cont=0;
                            for (CarttItems cItems : st) {
                                qty = cItems.getQty();
                                nstl = cItems.getStock();

                        %>

                        <div style="background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                            <%                                Session hs = Connection.Connection.getSessionFactory().openSession();
                                Criteria c = hs.createCriteria(DB.ShopsHasStock.class);
                                c.add(Restrictions.eq("stock", nstl));
                                List<DB.ShopsHasStock> shsl = c.list();
                                for (DB.ShopsHasStock shs : shsl) {
                            %>
                            <div  class="well-small">
                                <span style="float: right">
                                <a href="RemoveCart?displayid=<%= cont %>" class="label label-danger">Remove</a>
                                </span>
                            </div>
                            <div style="text-align: center" class="well-small">
                                <span style="width: 100%;"><%=shs.getShops().getSname()%></span>
                            </div>
                            <%
                                }
                                hs.close();
                            %>
                            <div style="width: 90%;height: 150px;margin-left: 5%;margin-right: 5%;">
                                <table width="100%" style="text-align: center">

                                    <tr>
                                        <td width="10%" height="100" ><img height="100" width="100" src="<%=nstl.getImage()%>" style="border-radius: 5px;border: 1px solid #BBBBBB;" alt="<%=nstl.getProductName()%>" /></td>
                                        <td width="30%"><h4><%=nstl.getProductName()%></h4></td>
                                        <td width="30%"><h5>qty</h5><h4><%=qty%></h4></td>
                                        <td width="30%"><h5>price</h5><h4><%=qty * nstl.getDiscountPrice()%></h4></td>
                                        <td><form action="processCheckout.jsp" method="post"><input type="hidden" name="count" value="<%= cont %>" /><input class="btn btn-danger" type="submit" value="Buy Now" /></form></td>
                                    </tr>
                                </table>



                            </div>
                        </div>
                        <br>
                        <%
                        cont++;
                            }
                        %>
                        <div style="width: 100%;height: 200px;">
                            <form action="processCheckout.jsp" method="post" target="_top">
                            <div style="float: left;">
                                <input required="" type="checkbox" name="under" value="ON" />&nbsp;<span>I understand that I may have to pay Shipping cost after recieve the Item</span>
                            </div>
                            <div style="width: 40%;height: 150px;float: right;background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                                <table style="width: 100%;text-align: center;">
                                    <tr>
                                        <td><h3>Sub Total:</h3></td>
                                        <td><h4><%=d%></h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                                <input type="hidden" name="cmd" value="_xclick">
                                                <input type="hidden" name="business" value="nirodyagamage@gmail.com">
                                                <input type="hidden" name="lc" value="US">
                                                <input type="hidden" name="item_name" value="abcdef">
                                                <input type="hidden" name="amount" value="<%=d%>">
                                                <input type="hidden" name="currency_code" value="USD">
                                                <input type="hidden" name="button_subtype" value="services">
                                                <input type="hidden" name="no_note" value="0">
                                                <input type="hidden" name="shipping" value="40.00">
                                                <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
                                                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                            </form>
                                        </td>
                                        <td><input class="btn btn-primary" type="submit" value="Continue Shopping" /></td>

                                        
                                        <!--<td><form action="ProcessCheckout" method="post"><input class="btn btn-primary" type="submit" value="Checkout" /></form></td>-->


                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <%
                            }else {
                    %>
                    <h3 style="margin-left: auto;margin-right: auto;text-align: center;">OOps!! your shopping cart is empty.Fill your shopping cart from <a href="products.jsp">here</a></h3>
                    <%
                        }
                    %><%
                    } else {
                    %>
                    <h3 style="margin-left: auto;margin-right: auto;text-align: center;">OOps!! your shopping cart is empty.Fill your shopping cart from <a href="products.jsp">here</a></h3>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>

    </body>
</html>
