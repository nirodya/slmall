<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.User_cont"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
            $(document).ready(function (){
               nice = $("html").niceScroll(); 
               <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;" class="well">
                <%
                if(request.getSession().getAttribute("loguser")!=null){
//                String bidfordate=request.getParameter("bidfordate");
                String bidfordate="Sun Feb 22 16:00:00 IST 2015";
                DateFormat df=new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy",Locale.ENGLISH);
                Date value=df.parse(bidfordate);
                Session s=Connection.Connection.getSessionFactory().openSession();
                Criteria c=s.createCriteria(DB.Bidding.class);
                c.add(Restrictions.eq("bidForDate", value));
                c.addOrder(Order.desc("winingValue"));
                List<DB.Bidding> bidl=c.list();
                if(bidl.size()!=0){
                    DB.User bu=bidl.get(0).getUser();
                DB.User lu=(DB.User)request.getSession().getAttribute("loguser");
                s.close();
                if(bu.getIduser()==lu.getIduser()){
                    String link="<a href=\" uploadimages.jsp?bid="+bidl.get(0).getIdbidding().toString()+" \">here</a>";
                    new User_cont().saveChat("Congratulations you've won the bid. click "+link+" to pay and upload your advertisement", bu.getIduser(), "Auction win", bu);
                    %>
                    <h2>Congratulations !</h2>
                    <p>You won the bid. You will recieve a message about payment and upload instructions.</p>
                <%
                }else{
                    %>
                <h2>Better luck next time!</h2>
                    <p>You couldn't win the bid. Try again for next week.</p>
                    <%
                }
                }else{
                    %>
                    <h2>No one has won the Auction.</h2>
                    <%
                }
                
                }
                %>
                
            </div>
        </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
