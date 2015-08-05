<%-- 
    Document   : profile
    Created on : Jun 27, 2014, 7:18:45 PM
    Author     : Nirodya Gamage
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession httpsess = request.getSession();
    if (httpsess.getAttribute("loguser") == null) {
        httpsess.setAttribute("msg", "Please log in again");
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <script type="text/javascript" src="javascripts/search_postal_code.js"></script>
        <%@include file="menuhead.jsp" %>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <!--<script type="text/javascript" src="javascripts/Update_user.js"></script>-->
        <script type="text/javascript">
            var xmlhttp;
function updateFname() {
    //alert('called');
    var fname = document.getElementById("fname").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
                //alert(xmlhttp.responseText);
//                document.getElementById('first').value = xmlhttp.responseText;
//                document.getElementById('second').value = xmlhttp.responseText;
//                $('#second').hide();
//                $('#third').hide();
//                $('#first').show(1000);
//                $('#command').show(1000);
    location.reload();
//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("fname=" + fname + "&upuid=" + upid+"&reqtype=upfname");
}

function updateLname() {
    //alert('called');
    var lname = document.getElementById("lname").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
                //alert(xmlhttp.responseText);
//                document.getElementById('first1').value = xmlhttp.responseText;
//                document.getElementById('second1').value = xmlhttp.responseText;
//                $('#second1').hide();
//                $('#third1').hide();
//                $('#first1').show(1000);
//                $('#command1').show(1000);
            location.reload();

//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("lname=" + lname + "&upuid=" + upid+"&reqtype=uplname");
}
function updateMobile() {
    //alert('called');
    var mobile = document.getElementById("mobile").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
       // alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
//            alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
              //  alert(xmlhttp.responseText);
//                document.getElementById('first2').value = xmlhttp.responseText;
//                document.getElementById('second2').value = xmlhttp.responseText;
//                $('#second2').hide();
//                $('#third2').hide();
//                $('#first2').show(1000);
//                $('#command2').show(1000);
location.reload();
//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("mobile=" + mobile + "&upuid=" + upid+"&reqtype=upmobile");
}
function updateAddress() {
    //alert('called');
    var ad1 = document.getElementById("ad1").value;
    var ad2 = document.getElementById("ad2").value;
    
    var e=document.getElementById("city");
    var city=e.options[e.selectedIndex].value;
    //alert(city);
    
    var e1=document.getElementById("district");
    var district=e1.options[e1.selectedIndex].value;
   // alert(district);
    
    var e2=document.getElementById("province");
    var province=e2.options[e.selectedIndex].value;
    //alert(province);
    
    var postalcode = document.getElementById("postalcode").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
                //alert(xmlhttp.responseText);
//                document.getElementById('first3').value = xmlhttp.responseText;
//                document.getElementById('second3').value = xmlhttp.responseText;
//                $('#second3').hide();
//                $('#third3').hide();
//                $('#first3').show(1000);
//                $('#command3').show(1000);
        location.reload();
//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("ad1=" + ad1+"&ad2="+ad2+"&city="+city+"&district="+district+"&province="+province +"&postalcode="+postalcode+ "&upuid=" + upid+"&reqtype=upad");
}


        </script>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
                $('#second').hide();
                $('#third').hide();
                $('#second1').hide();
                $('#third1').hide();
                $('#second2').hide();
                $('#third2').hide();
                $('#second3').hide();
                $('#third3').hide();
                $('#command').click(function () {
                    $('#first').hide();
                    $('#command').hide();
                    $('#second').show(1000);
                    $('#third').show(1000);
                });
                $('#command1').click(function () {
                    $('#first1').hide();
                    $('#command1').hide();
                    $('#second1').show(1000);
                    $('#third1').show(1000);
                });
                $('#command2').click(function () {
                    $('#first2').hide();
                    $('#command2').hide();
                    $('#second2').show(1000);
                    $('#third2').show(1000);
                });
                $('#command3').click(function () {
                    $('#first3').hide();
                    $('#command3').hide();
                    $('#second3').show(1000);
                    $('#third3').show(1000);
                });
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 98px;width: 80%;margin-left: auto;margin-right: auto;">

                <%
                    DB.User profileuser;
                    Controller.Search_User_Cont suc;
                    if (request.getParameter("uid") != null) {
                        suc = new Controller.Search_User_Cont();
                        profileuser = suc.searchUser(Integer.parseInt(request.getParameter("uid")));
                    } else {
                        DB.User senduser = (DB.User) sess.getAttribute("loguser");
                        suc = new Controller.Search_User_Cont();
                        profileuser = suc.searchUser(senduser.getIduser());
                    }
                    List<DB.City> l = suc.searchCityAll();
                    List<DB.District> ldist = suc.searchDistrictAll();
                    List<DB.Province> lprovince = suc.searchProvince();
                %>
                <input type="hidden" id="upuid" name="upuid" value="<%=profileuser.getIduser()%>" />
                <table class="table table-striped">
                    <tr>
                        <th colspan="3">Account Information</th>
                    </tr>
                    <tr>
                        <td>First Name:</td>
                        <td width="100px" id="first"><%=profileuser.getFname()%></td>
                        <td width="100px" id="second"><input type="text" id="fname" name="upfname" value="<%=profileuser.getFname()%>" /></td>
                        <%
                        if (request.getParameter("uid") == null) {
                        %>
                        <td width="100px" id="command"><a>update</a></td>
                        <td width="100px" id="third"><input onclick="updateFname()" class="btn btn-primary" type="submit" value="Save" /></td>
                        <% } %>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td width="100px" id="first1"><%=profileuser.getLname()%></td>
                        <td width="100px" id="second1"><input type="text" id="lname" name="upfname" value="<%=profileuser.getLname()%>" /></td>
                        <%
                        if (request.getParameter("uid") == null) {
                        %>
                        <td width="100px" id="command1"><a>update</a></td>
                        <td width="100px" id="third1"><input onclick="updateLname()" class="btn btn-primary" type="submit" value="Save" /></td>
                        <% } %>
                    </tr>
                    <tr>
                        <td>Mobile No:</td>
                        <td width="100px" id="first2"><%=profileuser.getMobileNo()%></td>
                        <td width="100px" id="second2"><input id="mobile" type="number" max="999999999" min="010000000" name="upfname" value="<%=profileuser.getMobileNo()%>" /></td>
                        <%
                        if (request.getParameter("uid") == null) {
                        %>
                        <td width="100px" id="command2"><a>update</a></td>
                        <td width="100px" id="third2"><input onclick="updateMobile()" class="btn btn-primary" type="submit" value="Save" /></td>
                        <% } %>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td width="100px" id="first3"><%=profileuser.getAddress().getAddressOne()%><br>
                            <%=profileuser.getAddress().getAddressTwo()%><br>
                            <%=profileuser.getAddress().getCity().getCityName()%><br>
                            <%=profileuser.getAddress().getDistrict().getDistrictName()%><br>
                            <%=profileuser.getAddress().getProvince().getProvinceName()%><br>
                            <%=profileuser.getAddress().getPostalCode().getCode()%><br>
                        </td>
                        <td width="100px" id="second3">Address One:<input id="ad1" type="text" name="upfname" value="<%=profileuser.getAddress().getAddressOne()%>" /><br>
                            Address Two:<input id="ad2" type="text" name="upfname" value="<%=profileuser.getAddress().getAddressTwo()%>" /><br>
                            City:<select id="city" onchange="searchPostalCode();"  name="upcity">
                                <%
                                    for (DB.City cty : l) {
                                %>
                                <option   ><%=cty.getCityName()%></option>
                                <%}%>
                            </select><br>
                            District:<select id="district" name="upcity">
                                <%
                                    for (DB.District dist : ldist) {
                                %>
                                <option ><%=dist.getDistrictName()%></option>
                                <%}%>
                            </select><br>
                            Province:<select id="province"  name="upcity">
                                <%
                                    for (DB.Province pro : lprovince) {
                                %>
                                <option ><%=pro.getProvinceName()%></option>
                                <%}%>
                            </select><br>
                            Postal Code:<input id="postalcode" type="text" name="upfname" value="<%=profileuser.getAddress().getPostalCode().getCode()%>" /></td>
                        <%
                        if (request.getParameter("uid") == null) {
                        %>
                        <td width="100px" id="command3"><a>update</a></td>
                        <td width="100px" id="third3"><input onclick="updateAddress()" class="btn btn-primary" type="submit" value="Save" /></td>
                        <% } %>
                    </tr>


                </table>
                    <%
        if (!urle.equals("Shop_owner")) {
            %>
            <a href="upgrade.jsp">Upgrade your profile as a Seller.</a>
                <%
        }
        %>
            </div>



        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<% }%>
