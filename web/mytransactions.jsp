
<%
if(request.getSession().getAttribute("loguser")!=null){
    %>
<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />

        <%@include file="menuhead.jsp" %>

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

                <table class="table table-striped table-hover ">
                    <thead>
                        <tr>
                            <th>Shop</th>
                            <th>Ordered Item</th>
                            <th>Qty</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            HttpSession orderhttpsess = request.getSession();
                            Session orderssess = Connection.Connection.getSessionFactory().openSession();

                            DB.User orderUser = (DB.User) orderhttpsess.getAttribute("loguser");
                            
                            Criteria orderwcri = orderssess.createCriteria(DB.Orders.class);
                            orderwcri.add(Restrictions.eq("user", orderUser));
                            List<Orders> owlist = orderwcri.list();
                            
                            
                                //out.write("0");
                                
                                
                                for (Orders orderforshoplList1 : owlist) {
                                   // out.write(Integer.toString(orderforshoplList1.getStatus()));
                                    
                                    if (orderforshoplList1.getStatus().intValue()==0) {
                                       // out.write("1");
                        %>
                        <tr>
                            <td><%= orderforshoplList1.getShops().getSname() %></td>
                            <td><%
                                Set<DB.OrdersHasStock> ordersHasStocks = orderforshoplList1.getOrdersHasStocks();
                                for (DB.OrdersHasStock stockor : ordersHasStocks) {
                                    out.write(stockor.getStock().getProductName());
                                }
                                %></td>
                            <td><%= orderforshoplList1.getQty()%></td>
                            <td><%= orderforshoplList1.getPaymanetmethod().getMethod()%></td>
                            <td>Processing</td>
                            <td><button id="vieworder<%= orderforshoplList1.getIdorders()%>" class="btn btn-primary" data-toggle="modal" data-target="#complete-dialog">View</button></td>
                    <script>
                        $('#vieworder<%= orderforshoplList1.getIdorders() %>').click(function (){
                            
                            $.ajax({url: "showorder.jsp?oid=<%= orderforshoplList1.getIdorders() %>&type=custo",success: function (result) {
                        $('#orderspinner').hide();
                        $('#ordercontent').show();
                        $('#ordercontent').html(result);
                    }});
                        });
                    </script>
                    </tr>
                    <%
                    } else {
                                        //out.write("2");
                    %>
                    <tr class="info">
                        <td><%= orderforshoplList1.getShops().getSname()%></td>
                        <td><%
                            Set<DB.OrdersHasStock> ordersHasStocks = orderforshoplList1.getOrdersHasStocks();
                            for (DB.OrdersHasStock stockor : ordersHasStocks) {
                                out.write(stockor.getStock().getProductName());
                            }
                            %></td>
                        <td><%= orderforshoplList1.getQty()%></td>
                        <td><%= orderforshoplList1.getPaymanetmethod().getMethod()%></td>
                        <td>Delivered</td>
                        <td><button class="btn btn-primary" data-toggle="modal" data-target="#complete-dialog">View</button></td>
                    </tr>
                    <%
                                }
                            }

                        

                        orderssess.close();

                    %>



                    </tbody>
                </table>
                <div style="width: 80%; margin-left: 10%;margin-right: 10%" id="complete-dialog" class="modal fade" tabindex="-1">
                    <!--<div  class="modal-dialog">-->
                    <div style="height: 100%" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Dialog</h4>
                        </div>
                        <div style="height: 100%" id="ordercontent"></div>
                        <div id="orderspinner" style="height: auto;" >
                            <!--                            <p>Fore aut non quem incididunt, varias reprehenderit deserunt quem offendit,
                                                            cillum proident ne reprehenderit, quem ad laborum, quo possumus praetermissum,
                                                            si ne illustriora, hic appellat coniunctione, do labore aliqua quo probant. In
                                                            probant voluptatibus quo mentitum est laboris. Quorum mandaremus graviterque.
                                                            Mentitum id velit, dolor aut litteris, ea varias illustriora, ita commodo ita
                                                            ingeniis, iis nulla appellat incurreret, aut irure amet summis pariatur ita ubi
                                                            quis dolore veniam proident, consequat sed ingeniis.</p>
                                                       <h1>Animated SVG Loaders</h1>-->

                            <!-- DIVIDER -->

                            <svg version="1.1" 
                                 class="svg-divider" 
                                 xmlns="http://www.w3.org/2000/svg" 
                                 xmlns:xlink="http://www.w3.org/1999/xlink" 
                                 x="0px"
                                 y="0px" 
                                 viewBox="0 0 80 3"  
                                 xml:space="preserve"
                                 >
                            <rect 
                                x="1" 
                                fill="#c6c3b9" 
                                width="16" 
                                height=".2"
                                >
                            <animate 
                                attributeName="x" 
                                attributeType="XML"
                                values="1; 64; 1"
                                begin="0s" dur="1.5s" repeatCount="indefinite" />
                            </rect>
                            </svg>


                            <!-- SPINNER #1 -->
                            <svg version="1.1" 
                                 class="svg-loader" 
                                 xmlns="http://www.w3.org/2000/svg" 
                                 xmlns:xlink="http://www.w3.org/1999/xlink" 
                                 x="0px" 
                                 y="0px"
                                 viewBox="0 0 80 80" 
                                 xml:space="preserve">

                            <path
                                id="spinner" 
                                fill="#D43B11" 
                                d="M40,72C22.4,72,8,57.6,8,40C8,22.4,
                                22.4,8,40,8c17.6,0,32,14.4,32,32c0,1.1-0.9,2-2,2
                                s-2-0.9-2-2c0-15.4-12.6-28-28-28S12,24.6,12,40s12.6,
                                28,28,28c1.1,0,2,0.9,2,2S41.1,72,40,72z"
                                >

                            <animateTransform
                                attributeType="xml"
                                attributeName="transform"
                                type="rotate"
                                from="0 40 40"
                                to="360 40 40"
                                dur="0.6s"
                                repeatCount="indefinite"
                                />
                            </path>
                            </svg>

                            <!-- SPINNER #2 -->
                            <svg version="1.1" 
                                 class="svg-loader" 
                                 xmlns="http://www.w3.org/2000/svg" 
                                 xmlns:xlink="http://www.w3.org/1999/xlink" 
                                 x="0px"
                                 y="0px" 
                                 viewBox="0 0 80 80" 
                                 xml:space="preserve">

                            <path 
                                fill="#D43B11" 
                                d="M10,40c0,0,0-0.4,0-1.1c0-0.3,0-0.8,0-1.3c0-0.3,0-0.5,0-0.8c0-0.3,0.1-0.6,0.1-0.9c0.1-0.6,0.1-1.4,0.2-2.1
                                c0.2-0.8,0.3-1.6,0.5-2.5c0.2-0.9,0.6-1.8,0.8-2.8c0.3-1,0.8-1.9,1.2-3c0.5-1,1.1-2,1.7-3.1c0.7-1,1.4-2.1,2.2-3.1
                                c1.6-2.1,3.7-3.9,6-5.6c2.3-1.7,5-3,7.9-4.1c0.7-0.2,1.5-0.4,2.2-0.7c0.7-0.3,1.5-0.3,2.3-0.5c0.8-0.2,1.5-0.3,2.3-0.4l1.2-0.1
                                l0.6-0.1l0.3,0l0.1,0l0.1,0l0,0c0.1,0-0.1,0,0.1,0c1.5,0,2.9-0.1,4.5,0.2c0.8,0.1,1.6,0.1,2.4,0.3c0.8,0.2,1.5,0.3,2.3,0.5
                                c3,0.8,5.9,2,8.5,3.6c2.6,1.6,4.9,3.4,6.8,5.4c1,1,1.8,2.1,2.7,3.1c0.8,1.1,1.5,2.1,2.1,3.2c0.6,1.1,1.2,2.1,1.6,3.1
                                c0.4,1,0.9,2,1.2,3c0.3,1,0.6,1.9,0.8,2.7c0.2,0.9,0.3,1.6,0.5,2.4c0.1,0.4,0.1,0.7,0.2,1c0,0.3,0.1,0.6,0.1,0.9
                                c0.1,0.6,0.1,1,0.1,1.4C74,39.6,74,40,74,40c0.2,2.2-1.5,4.1-3.7,4.3s-4.1-1.5-4.3-3.7c0-0.1,0-0.2,0-0.3l0-0.4c0,0,0-0.3,0-0.9
                                c0-0.3,0-0.7,0-1.1c0-0.2,0-0.5,0-0.7c0-0.2-0.1-0.5-0.1-0.8c-0.1-0.6-0.1-1.2-0.2-1.9c-0.1-0.7-0.3-1.4-0.4-2.2
                                c-0.2-0.8-0.5-1.6-0.7-2.4c-0.3-0.8-0.7-1.7-1.1-2.6c-0.5-0.9-0.9-1.8-1.5-2.7c-0.6-0.9-1.2-1.8-1.9-2.7c-1.4-1.8-3.2-3.4-5.2-4.9
                                c-2-1.5-4.4-2.7-6.9-3.6c-0.6-0.2-1.3-0.4-1.9-0.6c-0.7-0.2-1.3-0.3-1.9-0.4c-1.2-0.3-2.8-0.4-4.2-0.5l-2,0c-0.7,0-1.4,0.1-2.1,0.1
                                c-0.7,0.1-1.4,0.1-2,0.3c-0.7,0.1-1.3,0.3-2,0.4c-2.6,0.7-5.2,1.7-7.5,3.1c-2.2,1.4-4.3,2.9-6,4.7c-0.9,0.8-1.6,1.8-2.4,2.7
                                c-0.7,0.9-1.3,1.9-1.9,2.8c-0.5,1-1,1.9-1.4,2.8c-0.4,0.9-0.8,1.8-1,2.6c-0.3,0.9-0.5,1.6-0.7,2.4c-0.2,0.7-0.3,1.4-0.4,2.1
                                c-0.1,0.3-0.1,0.6-0.2,0.9c0,0.3-0.1,0.6-0.1,0.8c0,0.5-0.1,0.9-0.1,1.3C10,39.6,10,40,10,40z"
                                >

                            <animateTransform
                                attributeType="xml"
                                attributeName="transform"
                                type="rotate"
                                from="0 40 40"
                                to="360 40 40"
                                dur="0.6s"
                                repeatCount="indefinite"
                                />
                            </path>
                            </svg>

                            <!-- SPINNER #3 -->

                            <svg version="1.1" 
                                 class="svg-loader" 
                                 xmlns="http://www.w3.org/2000/svg" 
                                 xmlns:xlink="http://www.w3.org/1999/xlink" 
                                 x="0px"
                                 y="0px" 
                                 viewBox="0 0 80 80" 
                                 xml:space="preserve"
                                 >
                            <path 
                                fill="#D43B11" 
                                d="M10,40c0,0,0-0.4,0-1.1c0-0.3,0-0.8,0-1.3c0-0.3,0-0.5,0-0.8c0-0.3,0.1-0.6,0.1-0.9c0.1-0.6,0.1-1.4,0.2-2.1
                                c0.2-0.8,0.3-1.6,0.5-2.5c0.2-0.9,0.6-1.8,0.8-2.8c0.3-1,0.8-1.9,1.2-3c0.5-1,1.1-2,1.7-3.1c0.7-1,1.4-2.1,2.2-3.1
                                c1.6-2.1,3.7-3.9,6-5.6c2.3-1.7,5-3,7.9-4.1c0.7-0.2,1.5-0.4,2.2-0.7c0.7-0.3,1.5-0.3,2.3-0.5c0.8-0.2,1.5-0.3,2.3-0.4l1.2-0.1
                                l0.6-0.1l0.3,0l0.1,0l0.1,0l0,0c0.1,0-0.1,0,0.1,0c1.5,0,2.9-0.1,4.5,0.2c0.8,0.1,1.6,0.1,2.4,0.3c0.8,0.2,1.5,0.3,2.3,0.5
                                c3,0.8,5.9,2,8.5,3.6c2.6,1.6,4.9,3.4,6.8,5.4c1,1,1.8,2.1,2.7,3.1c0.8,1.1,1.5,2.1,2.1,3.2c0.6,1.1,1.2,2.1,1.6,3.1
                                c0.4,1,0.9,2,1.2,3c0.3,1,0.6,1.9,0.8,2.7c0.2,0.9,0.3,1.6,0.5,2.4c0.1,0.4,0.1,0.7,0.2,1c0,0.3,0.1,0.6,0.1,0.9
                                c0.1,0.6,0.1,1,0.1,1.4C74,39.6,74,40,74,40c0.2,2.2-1.5,4.1-3.7,4.3s-4.1-1.5-4.3-3.7c0-0.1,0-0.2,0-0.3l0-0.4c0,0,0-0.3,0-0.9
                                c0-0.3,0-0.7,0-1.1c0-0.2,0-0.5,0-0.7c0-0.2-0.1-0.5-0.1-0.8c-0.1-0.6-0.1-1.2-0.2-1.9c-0.1-0.7-0.3-1.4-0.4-2.2
                                c-0.2-0.8-0.5-1.6-0.7-2.4c-0.3-0.8-0.7-1.7-1.1-2.6c-0.5-0.9-0.9-1.8-1.5-2.7c-0.6-0.9-1.2-1.8-1.9-2.7c-1.4-1.8-3.2-3.4-5.2-4.9
                                c-2-1.5-4.4-2.7-6.9-3.6c-0.6-0.2-1.3-0.4-1.9-0.6c-0.7-0.2-1.3-0.3-1.9-0.4c-1.2-0.3-2.8-0.4-4.2-0.5l-2,0c-0.7,0-1.4,0.1-2.1,0.1
                                c-0.7,0.1-1.4,0.1-2,0.3c-0.7,0.1-1.3,0.3-2,0.4c-2.6,0.7-5.2,1.7-7.5,3.1c-2.2,1.4-4.3,2.9-6,4.7c-0.9,0.8-1.6,1.8-2.4,2.7
                                c-0.7,0.9-1.3,1.9-1.9,2.8c-0.5,1-1,1.9-1.4,2.8c-0.4,0.9-0.8,1.8-1,2.6c-0.3,0.9-0.5,1.6-0.7,2.4c-0.2,0.7-0.3,1.4-0.4,2.1
                                c-0.1,0.3-0.1,0.6-0.2,0.9c0,0.3-0.1,0.6-0.1,0.8c0,0.5-0.1,0.9-0.1,1.3C10,39.6,10,40,10,40z"
                                >
                            <animateTransform
                                attributeType="xml"
                                attributeName="transform"
                                type="rotate"
                                from="0 40 40"
                                to="360 40 40"
                                dur="0.8s"
                                repeatCount="indefinite"
                                />
                            </path>
                            <path 
                                fill="#D43B11" 
                                d="M62,40.1c0,0,0,0.2-0.1,0.7c0,0.2,0,0.5-0.1,0.8c0,0.2,0,0.3,0,0.5c0,0.2-0.1,0.4-0.1,0.7
                                c-0.1,0.5-0.2,1-0.3,1.6c-0.2,0.5-0.3,1.1-0.5,1.8c-0.2,0.6-0.5,1.3-0.7,1.9c-0.3,0.7-0.7,1.3-1,2.1c-0.4,0.7-0.9,1.4-1.4,2.1
                                c-0.5,0.7-1.1,1.4-1.7,2c-1.2,1.3-2.7,2.5-4.4,3.6c-1.7,1-3.6,1.8-5.5,2.4c-2,0.5-4,0.7-6.2,0.7c-1.9-0.1-4.1-0.4-6-1.1
                                c-1.9-0.7-3.7-1.5-5.2-2.6c-1.5-1.1-2.9-2.3-4-3.7c-0.6-0.6-1-1.4-1.5-2c-0.4-0.7-0.8-1.4-1.2-2c-0.3-0.7-0.6-1.3-0.8-2
                                c-0.2-0.6-0.4-1.2-0.6-1.8c-0.1-0.6-0.3-1.1-0.4-1.6c-0.1-0.5-0.1-1-0.2-1.4c-0.1-0.9-0.1-1.5-0.1-2c0-0.5,0-0.7,0-0.7
                                s0,0.2,0.1,0.7c0.1,0.5,0,1.1,0.2,2c0.1,0.4,0.2,0.9,0.3,1.4c0.1,0.5,0.3,1,0.5,1.6c0.2,0.6,0.4,1.1,0.7,1.8
                                c0.3,0.6,0.6,1.2,0.9,1.9c0.4,0.6,0.8,1.3,1.2,1.9c0.5,0.6,1,1.3,1.6,1.8c1.1,1.2,2.5,2.3,4,3.2c1.5,0.9,3.2,1.6,5,2.1
                                c1.8,0.5,3.6,0.6,5.6,0.6c1.8-0.1,3.7-0.4,5.4-1c1.7-0.6,3.3-1.4,4.7-2.4c1.4-1,2.6-2.1,3.6-3.3c0.5-0.6,0.9-1.2,1.3-1.8
                                c0.4-0.6,0.7-1.2,1-1.8c0.3-0.6,0.6-1.2,0.8-1.8c0.2-0.6,0.4-1.1,0.5-1.7c0.1-0.5,0.2-1,0.3-1.5c0.1-0.4,0.1-0.8,0.1-1.2
                                c0-0.2,0-0.4,0.1-0.5c0-0.2,0-0.4,0-0.5c0-0.3,0-0.6,0-0.8c0-0.5,0-0.7,0-0.7c0-1.1,0.9-2,2-2s2,0.9,2,2C62,40,62,40.1,62,40.1z"
                                >
                            <animateTransform
                                attributeType="xml"
                                attributeName="transform"
                                type="rotate"
                                from="0 40 40"
                                to="-360 40 40"
                                dur="0.6s"
                                repeatCount="indefinite"
                                />
                            </path>
                            </svg>
                            <style type="text/css">
                                
                                h1{
                                    font-size: 8vmin;
                                    font-weight: lighter;
                                }

                                .svg-loader{
                                    height: 20vmin;
                                    padding: 3vmin 20vmin;
                                    vertical-align: top;
                                }
                            </style>

                        </div>
                        
                        
                    </div>
                    <!--</div>-->
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

<%
}else{
    request.getSession().setAttribute("msg", "Please Login First");
    response.sendRedirect("login.jsp");
}
%>
