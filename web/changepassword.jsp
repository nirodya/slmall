<%
    if (request.getParameter("pw") != null) {
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
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
            });
            function confirmpw() {
                        alert('done');
                        var my_boolean = new Boolean();
                        my_boolean = true;
                        var rpw = document.getElementById('rpw').value;
                        var cpw = document.getElementById('cpw').value;
                        if (rpw !== cpw) {
                            document.getElementById('cpw').style.border = '1px solid red';
                            my_boolean = false;
                        }
                    }
                    
        </script>
    </head>
    <body>
        <div id="wrapper">

            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <%                    
                    Session changepasssess = Connection.Connection.getSessionFactory().openSession();
                    String un = request.getParameter("un");
                    String pw = request.getParameter("pw");
                    Criteria changepassc = changepasssess.createCriteria(DB.UserLogin.class);
                    changepassc.add(Restrictions.eq("email", un));
                    changepassc.add(Restrictions.eq("password", pw));
                    DB.UserLogin changeul = (DB.UserLogin) changepassc.uniqueResult();

                    changepasssess.close();
                %>
               
                <form onsubmit="confirmpw(this); return false;" action="changepw" method="post"  class="well" >
                    <input type="hidden" name="email" value="<%= changeul.getEmail() %>" />
                    <table>
                        <tr>
                            <td>New Password</td>
                            <td><input class="form-control" data-bv-emailaddress-message="The value is not a valid password" title="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))" x-moz-errormessage="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="" id="rpw" type="password" name="newpw" value="" /></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td><input class="form-control" required="" id="cpw" type="password" name="confirmpw" value="" /></td>
                        </tr>
                    </table>


                    <input class="btn btn-primary" type="submit" value="Change" />
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>