<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page import="Controller.LoadProductManager"%>
<%@page import="Controller.Load_User_Cont"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
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
                                            
                                            if (sess.getAttribute("loguser") != null&&request.getParameter("uname")!=null) {
                                                int uname = Integer.parseInt(request.getParameter("uname"));
                                            String heading=request.getParameter("heading");
                                            String repage=request.getParameter("page");
                                            DB.User sendUser = null;
                                                sendUser = (DB.User) sess.getAttribute("loguser");

                                                Load_User_Cont load_User_Cont = new Load_User_Cont();
                                                DB.User recieveUser = load_User_Cont.loadUser(uname);
                                                
                                                
                                        %>
                                        <h3><%=heading %></h3>
                                        <div class="well">
                                            <div style="background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
                                                <form action="ChatSave" method="post">
                                                    <input type="hidden" name="sender" value="<%=sendUser.getIduser()%>" />
                                                    <input type="hidden" name="reciever" value="<%= recieveUser.getIduser()%>" />
                                                    <input type="hidden" name="page" value="<%= repage %>" />
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 10%;" >Subject:</td>
                                                            <td style="width: 90%"><input class="form-control" required style="width: 90%" type="text" name="subject" value="" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 10%">Message:</td>
                                                            <td style="width: 90%"><textarea class="form-control" required style="width: 90%" name="message" rows="10" cols="20">
                                                                </textarea></td>
                                                        </tr>
                                                    </table>
                                                    <div style="width: 100%;height: 100px;">
                                                        <input style="float: right;margin-right: 10%;" class="btn btn-primary" type="submit" value="Send" />
                                                    </div>
                                                </form>
                                                <%
                                                    } else {
                                                        sess.setAttribute("msg", "Please login first");
                                                        response.sendRedirect("login.jsp");
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    
            </div>
        </div>

    </body>
</html>
