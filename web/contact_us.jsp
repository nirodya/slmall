<%-- 
    Document   : contact_us
    Created on : Jul 31, 2014, 11:14:46 AM
    Author     : Nirodya Gamage
--%>

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
               // background:transparent url(images/abtusback.jpg) no-repeat fixed top center;
               // -webkit-background-size: cover;
                //-moz-background-size: cover;
                //-o-background-size: cover;
               // background-size: cover;
                
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function (){
              nice = $("html").niceScroll(); 
              <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body id="bod">
        
        <div style="background-image: url('images/feed.jpg');background-size: 100%;" id="wrapper">
            <div>
            <%@include file="menu.jsp" %>
            <div id="middle" style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <h3 style="margin-left: auto;margin-right: auto;text-align: center;">Got any ideas? Tell us please.</h3>
                <form action="Feedback" id="twoform" class="well" >
                                <table border="0">
                                    
                                    <tbody>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input class="form-control" style="width: 200%;" type="text" name="name" value="" /></td>
                                            <input type="hidden" name="page" value="contact_us.jsp" />
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input class="form-control" style="width: 200%;" type="text" name="email" value="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Message:</td>
                                            <td><textarea class="form-control" style="width: 200%;" name="feedback" rows="4" cols="20">
                                                </textarea></td>
                                        </tr>
                                        <tr>
                                            <td><input class="btn btn-primary" type="submit" value="Send" /></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </form>
        </div>
            </div>
            </div>
            
        <%@include file="footer.jsp" %>
        
        </body>
</html>
