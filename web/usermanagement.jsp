<%
    if (request.getSession().getAttribute("loguser") != null) {
%>

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
                                    }else{
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


                <h1>Dashboard&nbsp;<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></h1>
                <div style="width: 100%" class="row">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>User ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Status</th>
                            <th>View profile</th>
                            <th>Disable User</th>
                        </tr>
                        <%
                            Session s = Connection.Connection.getSessionFactory().openSession();
                            String type = request.getParameter("type");
                            if (type.equals("buyer")) {
                                Criteria c = s.createCriteria(DB.UserRole.class);
                                c.add(Restrictions.eq("roleName", "Shopper"));

                                DB.UserRole ur = (DB.UserRole) c.uniqueResult();
                                Set<DB.UserLogin> userset = ur.getUserLogins();
                                for (DB.UserLogin ul : userset) {
                        %>
                        <tr >
                            <td style="vertical-align: middle"><%= ul.getUser().getIduser()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getFname()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getLname()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getStatus()%></td>
                            <td><a href="profile.jsp?uid=<%= ul.getUser().getIduser() %>"><input class="btn btn-flat btn-success" type="submit" value="View profile" /></a></td>
                            <%
                            if(ul.getUser().getStatus()==2){
                                %>
                            <td>
                                <form action="DisableUser" mrthod="post">
                                    <input type="hidden" name="uid" value="<%= ul.getUser().getIduser()%>" />
                                    <input type="hidden" name="type" value="enable" />
                                    <input type="hidden" name="utype" value="buyer" />
                                    <input class="btn btn-flat btn-warning" type="submit" value="Enable User" />
                                </form>
                                </td>
                            <%
                            }else{
                                %>
                            <td> <form action="DisableUser" mrthod="post">
                                    <input type="hidden" name="uid" value="<%= ul.getUser().getIduser()%>" />
                                    <input type="hidden" name="type" value="disable" />
                                    <input type="hidden" name="utype" value="buyer" />
                                    <input class="btn btn-flat btn-warning" type="submit" value="Disable User" />
                                </form></td>
                            <%
                            }
                            %>
                        </tr>
                        <%
                                }
                            }else if (type.equals("seller")) {
                                Criteria c = s.createCriteria(DB.UserRole.class);
                                c.add(Restrictions.eq("roleName", "Shop_owner"));

                                DB.UserRole ur = (DB.UserRole) c.uniqueResult();
                                Set<DB.UserLogin> userset = ur.getUserLogins();
                                for (DB.UserLogin ul : userset) {
                        %>
                        <tr >
                            <td style="vertical-align: middle"><%= ul.getUser().getIduser()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getFname()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getLname()%></td>
                            <td style="vertical-align: middle"><%= ul.getUser().getStatus()%></td>
                            <td><a target="_blank" href="profile.jsp?uid=<%= ul.getUser().getIduser() %>"><input class="btn btn-flat btn-success" type="submit" value="View profile" /></a></td>
                            <%
                            if(ul.getUser().getStatus()==2){
                                %>
                            <td>
                                <form action="DisableUser" mrthod="post">
                                    <input type="hidden" name="uid" value="<%= ul.getUser().getIduser()%>" />
                                    <input type="hidden" name="type" value="enable" />
                                    <input type="hidden" name="utype" value="seller" />
                                    <input class="btn btn-flat btn-warning" type="submit" value="Enable User" />
                                </form>
                                </td>
                            <%
                            }else{
                                %>
                            <td> <form action="DisableUser" mrthod="post">
                                    <input type="hidden" name="uid" value="<%= ul.getUser().getIduser()%>" />
                                    <input type="hidden" name="type" value="disable" />
                                    <input type="hidden" name="utype" value="seller" />
                                    <input class="btn btn-flat btn-warning" type="submit" value="Disable User" />
                                </form></td>
                            <%
                            }
                            %>
                            
                        </tr>
                        <%
                                }
                            }
                            s.close();
                        %>
                    </table>
                    <div style="width: 25%;margin-left: auto;margin-right: auto" class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Key for status</h3>
                        </div>
                        <div class="panel-body">
                            <span>0 - Need email confirmation</span><br>
                            <span>1 - Activated</span><br>
                            <span>2 - Deactivated</span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%
    }else{
        request.getSession().setAttribute("msg", "Please Login first");
        response.sendRedirect("login.jsp");
    }
%>