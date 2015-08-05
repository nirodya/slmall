<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page import="org.hibernate.criterion.Order"%>
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
                $('#tabs').niceScroll();
                $('#loading-img').hide();
                $('#outboxdiv').hide();

            <%@include file="javascripts/menuscript.js"  %>
                setInterval(function () {
                    $.ajax({url: 'showmsg.jsp?size=' + $('.msg-row-all').length, success: function (result) {

                            $('#msgdiv').append(result);

                        }});
                }, 1000);
            });
            function overChangeColor(id) {
                //alert($('#msg-row'+id).attr("clicked"));
                if ($('#msg-row' + id).attr("clicked") === "no") {
                    $('#msg-row' + id).css("background-color", "rgb(245, 245, 245)");
                    //$('#msg-row'+id).css("background-color","rgb(255, 255, 255)");
                }
            }
            function leaveChangeColor(id) {
                //alert(id);
                if ($('#msg-row' + id).attr("clicked") === "no") {
                    $('#msg-row' + id).css("background-color", "rgb(255, 255, 255)");
                }
                //$('#msg-row'+id).css("background-color","rgb(255, 255, 255)");
            }
            function clickChangeColor(id) {
                //alert(id);
                $('#loading-img').show();
                $('.msg-row-all').css("background-color", "rgb(255, 255, 255)");
                $('.msg-row-all').attr("clicked", "no");

                $('#msg-row' + id).css("background-color", "rgb(220, 220, 220)");
                $('#msg-row' + id).attr("clicked", "yes");
                $.ajax({url: "ViewMessage.jsp?chatid=" + id, success: function (result) {
                        $('#loading-img').hide();
                        $('#msg').html(result);
                    }});
            }
            function butclickChangeColor(id) {
                $('.inoutchooser').css("background", "rgb(255, 255, 255)");
                $('.inoutchooser').attr("clicked", "no");
                $('#msg-row' + id).css("background", "rgb(220, 220, 220)");
                $('#msg-row' + id).attr("clicked", "yes");
                var m = $('#msg-row' + id);

                if (m.attr('id') === "msg-row0") {

                    $('#outboxdiv').hide();
                    $('#inboxdiv').show(500);
                }
                else if (m.attr('id') === "msg-rowab") {

                    $('#inboxdiv').hide();
                    $('#outboxdiv').show(500);
                }
            }
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">

                
                                        <div style="width: 100%;">
                                            <div clicked="no" onmouseover="overChangeColor(0)" onclick="butclickChangeColor(0)" onmouseout="leaveChangeColor(0)" id="msg-row0" class="inoutchooser">inbox</div>
                                            <div clicked="no" onmouseover="overChangeColor('ab')" onclick="butclickChangeColor('ab')" onmouseout="leaveChangeColor('ab')" id="msg-rowab" class="inoutchooser">Outbox</div>
                                        </div><br>
                                        <div id="tabs" style="width: 100%;height: 300px;border-radius: 5px;border: 1px solid #BBBBBB;">
                                            <%
                                                DB.User inboxUser = (DB.User) sess.getAttribute("loguser");
                                                int recId = inboxUser.getIduser();
                                                Controller.Search_User_Cont suc = new Controller.Search_User_Cont();
                                                List<DB.Chat> inboxList = suc.searchChat(recId);
                                            %>
                                            <div id="inboxdiv" style="overflow: scroll;" >
                                                <table  style="width: 100%" class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sender</th>
                                                            <th>Message</th>
                                                            <th>Date</th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        for (DB.Chat c : inboxList) {
                                                    %>
                                                    <tbody id="msgdiv">
                                                        <tr clicked="no" class="msg-row-all" onclick="clickChangeColor(<%=c.getIdchat()%>)" onmouseover="overChangeColor(<%=c.getIdchat()%>)" onmouseout="leaveChangeColor(<%=c.getIdchat()%>)" id="msg-row<%=c.getIdchat()%>" style="cursor: pointer;background-color: rgb(255,255,255)">
                                                            <%
                                                                if (c.getStatus() == 0) {
                                                            %>
                                                            <td style="width: 10%;font-weight: bold;"><%= c.getUser().getFname()%></td>
                                                            <td style="width: 80%;font-weight: bold;"><%= c.getMessage()%></td>
                                                            <td style="width: 10%;font-weight: bold;"><%= c.getDate().toString().split(" ")[0]%></td>
                                                            <%
                                                                }else{
                                                                    %>
                                                            <td style="width: 10%;"><%= c.getUser().getFname()%></td>
                                                            <td style="width: 80%;"><%= c.getMessage()%></td>
                                                            <td style="width: 10%;"><%= c.getDate().toString().split(" ")[0]%></td>
                                                            <%
                                                                }
                                                            %>
                                                        </tr>
                                                    </tbody>
                                                    <% }%>
                                                </table>
                                            </div>
                                            <%
                                                Session outboxsession = Connection.Connection.getSessionFactory().openSession();
                                                Criteria outboxCriteria = outboxsession.createCriteria(DB.Chat.class);
                                                outboxCriteria.add(Restrictions.eq("user", inboxUser));
                                                outboxCriteria.addOrder(Order.desc("date"));
                                                List<DB.Chat> outboxList = outboxCriteria.list();
                                            %>
                                            <div id="outboxdiv" style="overflow: scroll;">
                                                <table style="width: 100%" class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sender</th>
                                                            <th>Message</th>
                                                            <th>Date</th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        for (DB.Chat c : outboxList) {
                                                    %>
                                                    <tbody >
                                                        <tr clicked="no" class="msg-row-all" onclick="clickChangeColor(<%=c.getIdchat()%>)" onmouseover="overChangeColor(<%=c.getIdchat()%>)" onmouseout="leaveChangeColor(<%=c.getIdchat()%>)" id="msg-row<%=c.getIdchat()%>" style="cursor: pointer;background-color: rgb(255,255,255)">

                                                            <td style="width: 10%;"><%= c.getUser().getFname()%></td>
                                                            <td style="width: 80%;"><%= c.getMessage()%></td>
                                                            <td style="width: 10%;"><%= c.getDate().toString().split(" ")[0]%></td>

                                                        </tr>
                                                    </tbody>
                                                    <% }
                                                        outboxsession.close();
                                                    %>
                                                </table>
                                            </div>
                                        </div>
                                        <div style="width: 100%;" id="msg">
                                            <img style="margin: 50%" id="loading-img" src="images/ajax-loader.gif" />
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            
       
        <%@include file="footer.jsp" %>      
    </body>
</html>
