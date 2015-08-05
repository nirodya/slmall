<%-- 
    Document   : bussreg
    Created on : Jul 28, 2014, 10:13:25 AM
    Author     : Nirodya Gamage
--%>

<%@page import="Controller.User_cont"%>
<%@page import="Controller.Access_Controller"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>-->
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script type="text/javascript" src="javascripts/jquery.nicescroll.js"></script>


        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
                if ($("#stother option:selected").text() === 'Other') {

                    $('#stype').show();
                } else {
                    $('#stype').hide();
                }
                $('#stother').change(function () {

                    if ($("#stother option:selected").text() === 'Other') {

                        $('#stype').show(1000);
                    } else {
                        $('#stype').hide(1000);
                    }
                });
            });
           
    function myFunction() {
    var pass1 = document.getElementById("pw").value;
    var pass2 = document.getElementById("cpw").value;
    var ok = true;
    if (pass1 !== pass2) {
        //alert("Passwords Do not match");
        document.getElementById("pw").style.borderColor = "#E34234";
        document.getElementById("cpw").style.borderColor = "#E34234";
        ok = false;
        alert("Passwords not Match!!!");
    }
    else {
        
    }
    return ok;
}

        </script>
        <title>Shop</title>
    </head>
    <body>
        <%
            Controller.Search_User_Cont suc = new Controller.Search_User_Cont();
            List<DB.City> l = suc.searchCityAll();
            List<DB.District> ldist = suc.searchDistrictAll();
            List<DB.Province> lprovince = suc.searchProvince();
            Controller.Search_Shop_management ssm = new Controller.Search_Shop_management();
            List<DB.ShopType> lst = ssm.searchShopTypeAll();
        %>

        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">

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
                    <form action="Bussiness_reg" onsubmit="return myFunction()" class="well">
                        <table style="width: 100%" class="table-condensed table-hover">

                            <tr>
                                <td style="width: 20%">First Name:</td>
                                <td style="width: 80%"><input required="" class="form-control" type="text" name="bfname" /></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input required="" class="form-control" type="text" name="blname" /></td>
                            </tr>
                            <tr>
                                <td>Shop Name:</td>
                                <td><input required="" class="form-control" type="text" name="sname" /></td>
                            </tr>
                            <tr>
                                <td>Shop Type:</td>
                                <td><select required="" class="form-control" id="stother" name="stype">
                                        <%                                                            for (DB.ShopType st : lst) {
                                        %>
                                        <option><%=st.getTypeName()%></option>
                                        <% } %>
                                        <option >Other</option>
                                    </select></td>
                            </tr>
                            <tr id="stype">
                                <td>Enter Type:</td>
                                <td><input required="" class="form-control" type="text" name="tname" value="" /></td>
                            </tr>
                            <tr>
                                <td>Address One:</td>
                                <td><input required="" class="form-control" type="text" name="badone" /></td>
                            </tr>
                            <tr>
                                <td>Address Two:</td>
                                <td><input required="" class="form-control" type="text" name="badtwo" /></td>
                            </tr>
                            <tr>
                                <td>City:</td>
                                <td><select required="" class="form-control" name="city">
                                        <%
                                            for (DB.City cty : l) {
                                                if (cty.getCityName().equals("N/A")) {
                                                } else {
                                        %>
                                        <option   ><%
                                        out.write(cty.getCityName());
                                    }%></option>
                                            <%}%>

                                    </select></td>
                            </tr>
                            <tr>
                                <td>District:</td>
                                <td><select required="" class="form-control" name="district">
                                        <%
                                            for (DB.District dist : ldist) {
                                                if (dist.getDistrictName().equals("N/A")) {
                                                } else {
                                        %>
                                        <option ><%=dist.getDistrictName()%><%}%></option>
                                        <%}%>

                                    </select></td>
                            </tr>
                            <tr>
                                <td>Province:</td>
                                <td><select required="" class="form-control" name="province">
                                        <%
                                            for (DB.Province pro : lprovince) {
                                                if (pro.getProvinceName().equals("N/A")) {
                                                } else {

                                        %>
                                        <option ><%=pro.getProvinceName()%><%}%></option>
                                        <%}%>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Postal Code:</td>
                                <td><input required="" class="form-control" type="number" name="pcode" value="" /></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input style="width: 100%" required="" class="form-control" type="email" name="email" /></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input data-bv-notempty="true" data-bv-emailaddress-message="The value is not a valid password" title="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))" x-moz-errormessage="Please enter the valid password format (e.g. Password (UpperCase, LowerCase and Number))" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="" class="form-control" id="pw" type="password" name="pw" /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password:</td>
                                <td><input required="" class="form-control" id="cpw" type="password" name="cpw" /></td>
                            </tr>
                             <tr>
                                 <td></td>
                                                <td><textarea readonly="" style="width: 100%" name="license" rows="8" cols="20">By clicking this button I agree to your terms and conditions:
                                                                                                                                I am aware that I may have to pay shipping cost after recieving the Item.
                                                                                                                                I agree to that SLMall site can change their rules and regulations whenever they want.
                                                                                                                                I agree that SLMall is not responsible for any kind of payment that I have paid.
                                                                                                                                I agree that I can only register in this site only countable items.
                                                                                                                                I am aware that SLMall is taking 1% percent of every card payment that I recieve.
                                                    </textarea></td>
                                                
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="checkbox" required="" name="agree" value="ON" />&nbsp;I agree to license agreement.  </td>
                                            </tr>
                            <tr>

                                <td><input class="btn btn-primary btn-raised" type="submit" name="pcode" value="Register" /></td>
                            </tr>

                        </table>
                                    
                    </form>
                </div>


            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>

</html>
