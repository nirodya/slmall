<%
    if (request.getSession().getAttribute("loguser") != null) {
%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        
        <%@include file="menuhead.jsp" %>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/material.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.2.2/css/material.min.css.map">
        <script src="javascripts/jquery.nicescroll.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body style="background-color: #eee;">
        <div id="wrapper">

            <%@page import="Controller.CarttItems"%>
            <%@page import="DB.Stock"%>
            <%@page import="java.util.ArrayList"%>
            <%@page import="java.util.List"%>
            <%@page import="org.hibernate.Session"%>
            <%@page import="org.hibernate.Criteria"%>
            <%@page import="java.util.Set"%>
            <%
                HttpSession sess = request.getSession();
                Session msess = Connection.Connection.getSessionFactory().openSession();
                System.out.println("donemenu");
            %>

            <div id="menu_upper_div">
                <div style="float: left;z-index: 1000;margin-left: 4%;">
                    <ul >
                        <%
                            DB.User user = null;
                            String urle = null;
                            if (sess.getAttribute("loguser") != null) {
                                user = (DB.User) sess.getAttribute("loguser");

                                Set<DB.UserLogin> ulog = user.getUserLogins();
                                for (DB.UserLogin ur : ulog) {
                                    urle = ur.getUserRole().getRoleName();
                                }
                                if (urle.equals("admin")) {
                        %>
                        <li style="padding-left: 2%;display: inline;float: left;"><a href="index.jsp">Go&nbsp;to&nbsp;Site</a></li>
                            <%
                                    }else {
                                        response.sendRedirect("index.jsp");
                                    }
                                }
                            %>

                    </ul>
                </div>
                <div style="float: right;z-index: 1000;margin-right: 4%;overflow: no-display">
                    <ul style="overflow: auto">
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
                        <li style="display: inline;padding-left: 2%;float: right;"><a href="logout">Logout</a></li>
                            <% } %>

                    </ul>
                </div>
            </div>

            <div id="menudiv" class="well">


                <%
                    if (sess.getAttribute("loguser") != null) {

                %>
                <a href="profile.jsp" id="logbut" style="float: right;width: auto;margin-right: 4%;text-align: center" class="btn btn-primary btn-warning"><span class="glyphicon glyphicon-off"></span><%="Welcome " + user.getFname()%></a>
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
                    <a id="productmenuitem" class="menu_link mousehandle" style="text-decoration: none;" href="adminsettings.jsp"><li class="menu_item" >Summery</li></a>
                    <a class="menu_link nosubmenu" style="text-decoration: none;" href="adminpanel.jsp"><li class="menu_item" >Dashboard</li></a>

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





            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <%
                Calendar cal = Calendar.getInstance();
            int dayOfTheWeek = cal.get(Calendar.DAY_OF_WEEK);
            cal.add(Calendar.DAY_OF_WEEK, Calendar.SUNDAY - dayOfTheWeek);
            Session slidesession=Connection.Connection.getSessionFactory().openSession();
            Criteria slidecriteria=slidesession.createCriteria(DB.Bidding.class);
            slidecriteria.add(Restrictions.eq("bidForDate", cal.getTime()));
            slidecriteria.addOrder(Order.desc("winingValue"));
            List<DB.Bidding> listbid= slidecriteria.list();
            DB.Bidding slidebid=listbid.get(0);
           
                    Criteria adc = slidesession.createCriteria(DB.FronAdImages.class);
                    adc.add(Restrictions.eq("bidding", slidebid));
                    
                    List<DB.FronAdImages> frontad=adc.list();
                    if(frontad.size()==0){
                        %>
                        <h2>No one takes the auction this week.</h2>
                        <span>Default Images will show.</span>
                <%
                    }else{
                    %>
                    <h2><%= slidebid.getUser().getFname() %> has won the bid for this week.</h2>
                    
                        <%
                        for(DB.FronAdImages fai:frontad){
                            %>
                    <div style="width: 25%;margin-left: auto;margin-right: auto;float: left;" class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Slide Image</h3>
                    </div>
                    <div  class="panel-body">
                        <img src="<%= fai.getImgPath() %>" height="200" style="width: 100%" alt="slide image" />
                        <form action="changeuserslideimages.jsp" method="post">
                        <input type="hidden" name="recid" value="<%= slidebid.getUser().getIduser() %>" />
                        <input type="hidden" name="fadid" value="<%= fai.getFronAdImagesId() %>" />
                        <input style="margin-left: auto;margin-right: auto" class="btn btn-primary" type="submit" value="Change Image" />
                        </form>
                    </div>
                </div>
                    
                    <%
                    }
                    }
                %>

               
            </div>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
<%
    }else{
    response.sendRedirect("login.jsp");
    }
%>