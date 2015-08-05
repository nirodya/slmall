<%-- 
    Document   : contact_us
    Created on : Jul 31, 2014, 11:14:46 AM
    Author     : Nirodya Gamage
--%>
<%@page import="Controller.Cart_Management"%>
<%
    HttpSession httpSession = request.getSession();
    if (httpSession.getAttribute("loguser") != null) {
        DB.User statuser=(DB.User)httpSession.getAttribute("loguser");
        if(statuser.getStatus()!=0){
%>

<%@page import="java.util.ArrayList"%>
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
                
<%@page import="Controller.CarttItems"%>
<%@page import="DB.Stock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.Set"%>
<%
    Session msess = Connection.Connection.getSessionFactory().openSession();
    HttpSession sess = request.getSession();
    Cookie[] cookies=request.getCookies();
    if(cookies!=null){
        String cookun=null;
        String cookpw=null;
        for (int i = 0; i < cookies.length; i++) {
                    Cookie name_cookie = cookies[i];
                    if (name_cookie.getName().equals("unpw")) {
                        cookun=name_cookie.getValue().split("-")[0];
                        cookpw=name_cookie.getValue().split("-")[1];
                    }

    }
        System.out.println("HEY HERES COOK"+cookun+cookpw);
        if(cookun!=null&&cookpw!=null){
            
            Criteria cookc = msess.createCriteria(DB.UserLogin.class);
            cookc.add(Restrictions.and(Restrictions.eq("email", cookun), Restrictions.eq("password", cookpw)));
            DB.UserLogin cookul = (DB.UserLogin) cookc.uniqueResult();
            
            if(cookul!=null){
                if(cookul.getUser().getStatus()!=2){
                    sess.setAttribute("loguser", cookul.getUser());
                }
            }
           // cooksess.close();
        }
    }
    
    System.out.println("donemenu");
%>

<div id="menu_upper_div">
    <div style="float: left;z-index: 1000;margin-left: 4%;">
        <ul>
            <%
            DB.User user = null;
            String urle = null;
        if (sess.getAttribute("loguser") != null) {
            user = (DB.User) sess.getAttribute("loguser");
            
                        Set<DB.UserLogin> ulog = user.getUserLogins();
                        for (DB.UserLogin ur : ulog) {
                            urle = ur.getUserRole().getRoleName();
                        }
                        if(urle.equals("admin")){
                            %>
                            <li style="padding-left: 2%;display: inline;float: left;"><a href="adminpanel.jsp">Admin Panel</a></li>
            <%
                        }
        }
            %>
            
        </ul>
    </div>
    <div style="float: right;z-index: 1000;margin-right: 4%;">
    <ul >
        <%
    double d=0.00;
        if(sess.getAttribute("cart")!=null){
            System.out.println("donemenu1");
        ArrayList<CarttItems> ar=(ArrayList<CarttItems>)sess.getAttribute("cart");
        DB.Stock st;
        CarttItems ci;
        System.out.println("donemenu2");
        
        for(int i=0;i<ar.size();i++){
            System.out.println(ar.get(i).toString());
            ci=ar.get(i);
            st=ci.getStock();
            d+=st.getDiscountPrice()*ci.getQty();
        }
//        for(DB.Stock st:ar){
//            d+=st.getDiscountPrice();
//            System.out.println("donemenufinal");
//        }
        System.out.println("donemenu2");
        }
        %>
        <li style="padding-left: 1%;display: inline;float: right;"><a href="shoppingcart.jsp"><i class="icon-large  icon-shopping-cart" ></i>Shopping&nbsp;Cart&nbsp;Rs:<%=d %>0</a></li>
        <%
        if (sess.getAttribute("loguser") != null) {
        %>
        <script>

                            //alert("done");



                            setInterval(function () {
                                $.ajax({url: 'messageschecker.jsp', success: function (result) {

                                        $('#mess').html('Messages<span class="badge">' + result + '');

                                    }});
                            }, 1000);

                        </script>
                        <li style="display: inline;padding-left: 2%;float: right;"><a id="mess" href="Messages.jsp">Messages<span class="badge"><%@include file="messageschecker.jsp" %></span></a></li>
        <%
        if (urle.equals("Shop_owner")) {
        %>
         <script>
            
                //alert("done");
               
                   
                   
              setInterval(function (){
                   $.ajax({url: 'OrderChecker.jsp', success: function (result) {
                           
                          $('#ord').html('Orders('+result+')');
                          
                        }});
              },1000);
            
        </script>
        <li style="display: inline;padding-left: 2%;float: right;"><a id="ord" href="vieworder.jsp">Orders(<%@include file="OrderChecker.jsp" %>)</a></li>
        <% } %>
        <li style="display: inline;padding-left: 2%;float: right;"><a href="logout">Logout</a></li>
        <% } %>
        
    </ul>
    </div>
</div>

<div id="menudiv" class="well">
    
    
    <%                
        if (sess.getAttribute("loguser") != null) {
            
    %>
    <a href="profile.jsp" id="logbut" style="float: right;width: auto;margin-right: 4%;" class="btn btn-primary btn-warning"><span class="glyphicon glyphicon-off"></span><%="Welcome " + user.getFname()%></a>
        <%
        } else {
        %>
    <a href="login.jsp" id="logbut" style="float: right;width: 100px;" class="btn btn-primary btn-warning"><span  class="glyphicon glyphicon-off"></span> login</a>
    <%
        }
    %>

    <ul id="menu" >

        <a class="menu_link nosubmenu" style="text-decoration: none;" href="contact_us.jsp"><li class="menu_item" >Contact&nbsp;Us</li></a>
        <a class="menu_link nosubmenu" style="text-decoration: none;" href="about_us.jsp"><li class="menu_item" >About</li></a>
                <%                if (sess.getAttribute("loguser") != null) {
                        
                        
                        
                        if (urle.equals("Shop_owner")) {
                %>
        <a class="menu_link nosubmenu" style="text-decoration: none;" href="manage_shops.jsp"><li class="menu_item" >Manage Shops</li></a>
       
                <%
                        }
                    }
                %>
        <a id="productmenuitem" class="menu_link mousehandle" style="text-decoration: none;" href="products.jsp"><li class="menu_item" >Products</li></a>
        <a class="menu_link nosubmenu" style="text-decoration: none;" href="index.jsp"><li class="menu_item" >Home</li></a>

    </ul>

    <a href="index.jsp"  style="margin-top: 0px;float: left;text-decoration: none;"><img style="" src="images/small-9879-1588758.png"/></a><br>
    <a id="introlink" style="float: left;text-decoration: none;cursor: pointer;">Whats this site?</a><br>
    <br>



    <div id="catogaries" class="mousehandle">
        <ul id="catogaryul">
            <%
                
                Criteria cri = msess.createCriteria(DB.Catogaries.class);
                List<DB.Catogaries> mlist = cri.list();
                for (DB.Catogaries c : mlist) {
                    System.out.println("donemenufinal");
            %>
            <a href="#"><li class="submenu"><%=c.getCatogariName()%></li></a>
                    <% }%>
        </ul>
    </div>
</div>





                <div id="middle" style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                    <%
                        // ArrayList<DB.Stock> ar=new ArrayList<>();
                        if (httpSession.getAttribute("cart") != null) {
                            ArrayList<CarttItems> st = (ArrayList<CarttItems>) httpSession.getAttribute("cart");
                            if (st.size() != 0) {

                    %>
                    <h3 style="margin-left: auto;margin-right: auto;text-align: center;">Your Shopping Cart</h3>
                    <div style="width: 100%;" class="well">

                        <%                            DB.Stock nstl;
                        int count;
                        if(request.getParameter("count")!=null){
                            count=Integer.parseInt(request.getParameter("count"));
                        }else{
                            count=(st.size() - 1);
                        }
                            int qty;
                            CarttItems cItems = st.get(count);

                            qty = cItems.getQty();
                            nstl = cItems.getStock();

                        %>
                        <form action="paymentgateway.jsp" method="post">
                        <div style="height: fit-content">
                        <div style="background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                            <%                                Session hs = Connection.Connection.getSessionFactory().openSession();
                                Criteria c = hs.createCriteria(DB.ShopsHasStock.class);
                                c.add(Restrictions.eq("stock", nstl));
                                List<DB.ShopsHasStock> shsl = c.list();
                                for (DB.ShopsHasStock shs : shsl) {
                            %>
                            
                            <div style="text-align: center" class="well-small">
                                <span style="width: 100%;"><%=shs.getShops().getSname()%></span>
                                <input type="hidden" name="sid" value="<%= shs.getShops().getIdShops() %>" />
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
                                        <td width="30%"><h5>qty</h5><h4><input class="form-control" type="number" name="qty" min="0" max="<%= nstl.getQty() %>" value="<%=qty%>" /></h4></td>
                                        <td width="30%"><h5>price</h5><h4><%=qty * nstl.getDiscountPrice()%></h4></td>
                                    </tr>
                                </table>



                            </div>
                        </div>
                        <br>

                        <div style="width: 100%;height: 200px;">
                            <div style="width: 40%;height: 250px;float: left;background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                                <table style="width: 100%;text-align: center;">
                                    <tr>
                                        <td>Address:</td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="2">
                                            
                                            <textarea style="width: 90%;height: 150px;" name="address" rows="4" cols="20">
                                                <%= user.getAddress().getAddressOne()%>,
                                                <%= user.getAddress().getAddressTwo()%>,
                                                <%= user.getAddress().getCity().getCityName()%>,
                                                <%= user.getAddress().getDistrict().getDistrictName()%>,
                                                <%= user.getAddress().getProvince().getProvinceName()%>.
                                                <%= user.getAddress().getPostalCode().getCode()%>.
                                            </textarea>
                                        </td>
                                    <tr>
                                        <td>
                                            
                                                <input type="hidden" name="displayid" value="<%= st.size() - 1%>" />
                                                
                                                <input required="method" type="radio" name="method" value="delivery" />
                                                <input class="btn btn-primary" type="submit" value="Pay at delivery" />
                                            
                                        </td>
                                        <td>
                                            <input required="" type="radio" name="method" value="Card_Payment" />
                                            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                        </td>
                                    </tr>
                                    
                                    </tr>

                                </table>
                                                
                            </div>
                                               
                            <div style="width: 40%;height: 250px;float: right;background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                                <table style="width: 100%;text-align: center;">
                                    <tr>
                                        <td><h3>Sub Total:</h3></td>
                                        <td><h4><%=d%></h4></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input class="btn btn-primary" type="submit" value="Continue Shopping" /></td>

                                        
                                    

                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                                                 </form>
                    <%
                        } else {
                                Cart_Management cm=new Cart_Management();
                                DB.Cart crt=cm.loadCart(user);
                                cm.removeCart(crt.getIdcart());
                                
                                httpSession.setAttribute("cart", null);
                            response.sendRedirect("products.jsp");
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
        </div>

        <%@include file="footer.jsp" %>

    </body>
</html>

<%
        }else{
        httpSession.setAttribute("msg", "Please login and activate your account");
        
        response.sendRedirect("login.jsp");
        }
    } else {
        httpSession.setAttribute("msg", "Please login first");
        httpSession.setAttribute("reloadpage", "shoppingcart.jsp");
        response.sendRedirect("login.jsp");

    }
%>

