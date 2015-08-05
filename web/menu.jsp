
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
                        if(user.getStatus()==0){
                            %>
            <li style="padding-left: 2%;display: inline;float: left;">Please activate your Profile!</li>
                            <%
                        }
        }
            %>
            
        </ul>
    </div>
    <div style="float: right;z-index: 1000;margin-right: 4%;width: 50%">
        <ul style="list-style-type: none;margin: 0;padding: 0;">
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
        <li style="padding-left: 2%;display: inline;display: inline-block;float: right;"><a href="shoppingcart.jsp"><i class="icon-large  icon-shopping-cart" ></i>Shopping&nbsp;Cart&nbsp;Rs:<%=d %>0</a></li>
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
                        <li style="display: inline;display: inline-block;padding-left: 2%;float: right;"><a id="mess" href="Messages.jsp">Messages<span class="badge"><%@include file="messageschecker.jsp" %></span></a></li>
        <%
        if (urle.equals("Shop_owner")) {
        %>
         <script>
            
                //alert("done");
               
                   
                   
              setInterval(function (){
                   $.ajax({url: 'OrderChecker.jsp', success: function (result) {
                           
                          $('#ord').html('Orders<span class="badge">'+result+'');
                          
                        }});
              },1000);
            
        </script>
        <li style="display: inline;display: inline-block;padding-left: 2%;float: right;"><a id="ord" href="vieworder.jsp">Orders<span class="badge"><%@include file="OrderChecker.jsp" %></span></a></li>
        <% } %>
        <li style="display: inline;display: inline-block;padding-left: 2%;float: right;"><a href="logout">Logout</a></li>
        <li style="display: inline;display: inline-block;padding-left: 2%;float: right;"><a href="mytransactions.jsp">My transactions</a></li>
        
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
            <a href="products.jsp?cat=<%= c.getIdcatogaries() %>"><li class="submenu"><%=c.getCatogariName()%></li></a>
                    <% }%>
        </ul>
    </div>
</div>

<%
msess.close();
%>


