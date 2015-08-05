<%-- 
    Document   : login
    Created on : Jun 4, 2014, 5:42:37 PM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <link type="text/css" rel="stylesheet" href="Styles/stylelog.css"/>

        <script type="text/javascript" src="javascripts/loginextra.js"></script>
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <script>
            $.fn.gotof = function() { // has to be defined as a function, does not need to be inside a nested document ready function
               // alert("I am calling form jquery");
                $('#mailvalidationa').toggleClass('active');
            };

            $(document).ready(function() {
                 nice = $("html").niceScroll(); 
                 <%@include file="javascripts/menuscript.js"  %>
                $('#logbuttondiv').hide();
                var first = true;

                // Hide menu once we know its width
                $('#showmenu').click(function() {



                    var $menu = $('.menu');

                    if ($menu.is(':visible')) {

                    } else {
                        $menu.slideToggle("slow");
                        $('.log').slideToggle("slow");
                        $('#showmenudiv').hide();
                        $('#logbuttondiv').show();
                    }

                    /**   if ($menu.is(':visible')) {
                     // Slide away
                     
                     $menu.animate({left: -($menu.outerWidth() + 10)}, function() {
                     $menu.hide();
                     
                     });
                     
                     }
                     else {
                     // Slide in
                     
                     
                     $menu.show().css("left", -($menu.outerWidth() + 10)).animate({left: 0});
                     } **/
                });
                $('#logbutton').click(function() {
                    $('#logbuttondiv').hide();
                    $('#showmenudiv').show();
                    $('.menu').slideToggle("slow");
                    $('.log').slideToggle("slow");

                });

            });

        </script>
        <title>Shopping</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%
        if(sess.getAttribute("loguser")!=null){
            response.sendRedirect("index.jsp");
        }
        %>
        <div  class="container" >
            <div class="row vertical-center-row">
                <div id="hideme" class="col-lg-12">
                    <div class="row ">
                        <!--<div  class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4" >-->
                            <div class="log" >
                                <%
                                    HttpSession ses = request.getSession();
                                    if (ses.getAttribute("msg") != null) {
                                %>
                                <div style="color: red;">
                                    <%=ses.getAttribute("msg")%>
                                </div>
                                <%
                                ses.setAttribute("msg", null);
                                    }

                                %>
                                <form action="User_login" method="post" class="well ">
                                    <table style="margin: auto;"  border="0">

                                        <tbody>
                                            <tr class="inputs">
                                                <td>Username :</td>
                                                <td><input class="form-control" type="email" required="required" name="un" value="" class="span3" placeholder="Type username here...." /></td>
                                            </tr>
                                            <tr class="inputs">
                                                <td>Password :</td>
                                                <td><input class="form-control" type="password" required="required" name="pw" value="" class="span3" placeholder="Type password here...." /></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" name="remember" value="ON" />Remember Me</td>
                                                <td><a href="forgotpassword.jsp">Forgot your Password?</a></td>
                                            </tr>
                                            <tr>
                                                <td><input id="buttonlogin"  type="submit" value="Login" class="btn btn-primary" /></td>
                                                <td><input type="reset" value="Clear" class="btn btn-material-yellow-A200"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
                                </form>
                            </div>

                            <div class="menu" style="display: none; position: relative;"><form id="signupform" onsubmit="checkEmptiness(this);
                                    return false;" class="well " method="post" action="Saveuser">
                                    <table style="margin: auto;"  border="0">

                                        <tbody>
                                            <tr>
                                                <td>First Name :</td>
                                                <td><a class="has-spinner"><input class="form-control" required="required" id="fname" type="text" name="fname" value="" class="span3"  /><span class="spinner"><i class="icon-spin icon-refresh"></i></span></a></td>
                                                <td>Last Name :</td>
                                                <td><a class="has-spinner"><input class="form-control" required="required" id="lname"  type="text" name="lname" value="" class="span3"  /><span class="spinner"><i class="icon-spin icon-refresh"></i></span></a></td>
                                            </tr>
                                            <tr>
                                                <td>Email:</td>
                                                <td><a id="mailvalidationa" class="form-control" pattern="[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" required="required" placeholder="name@domain.com" data-bv-notempty="true" data-bv-emailaddress-message="The value is not a valid email address" title="Please enter the valid email format (e.g. name@domain.com)" x-moz-errormessage="Please enter the valid email format (e.g. name@domain.com)" class="has-spinner"><input  onblur="validation();" id="mailvalidation" type="email" name="email" value="" class="span3"  /><span class="spinner"><i class="icon-spin icon-refresh"></i></span></a><div id="validatetext"></div></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td><a class="has-spinner"><input class="form-control" required="required" data-bv-notempty="true" data-bv-emailaddress-message="The value is not a valid password" title="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))" x-moz-errormessage="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))"   id="rpw" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" type="password" name="rpw" value="" /><span class="spinner"><i class="icon-spin icon-refresh"></i></span></a></td>
                                            </tr>
                                            <tr>
                                                <td>Confirm Password:</td>
                                                <td><a class="has-spinner"><input class="form-control" required="required"  id="cpw" type="password" name="cpw" value="" /><span class="spinner"><i class="icon-spin icon-refresh"></i></span></a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><textarea readonly="" style="width: 100%" name="license" rows="6" cols="20">By clicking this button I agree to your terms and conditions:
                                                                                                                                I am aware that I may have to pay shipping cost after recieving the Item.
                                                                                                                                I agree to that SLMall site can change their rules and regulations whenever they want.
                                                                                                                                I agree that SLMall is not responsible for any kind of payment that I have paid.
                                                    </textarea></td>
                                                
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="checkbox" required="" name="agree" value="ON" />&nbsp;I agree to license agreement.  </td>
                                            </tr>
                                            <tr>
                                                <td><input id="buttonsignup" type="submit" value="Sign Up" class="btn btn-primary" /></td>
                                                <td>Want a bussiness account? Sign up from <a href="bussreg.jsp">here</a>.</td>

                                            </tr>

                                        </tbody>
                                    </table>

                                </form></div>
                            <div id="showmenudiv" >
                                Dont Have an Account?<br>
                                <input id="showmenu" class="btn btn-material-red-A400" type="submit" value="Sign up" />
                            </div>
                            <div id="logbuttondiv" >
                                Already Registered?<br>
                                Login for unlimited Shopping<br>
                                <a id="logbutton" href="#" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> login</a>
                            </div>
                        <!--</div>-->
                    </div>
                </div>
            </div>
        </div>


        <%@include file="footer.jsp" %>

    </body>
</html>
