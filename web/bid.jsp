<%-- 
    Document   : SendMessage
    Created on : Nov 9, 2014, 7:42:51 AM
    Author     : Nirodya Gamage
--%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.StatelessSession"%>
<%
if(request.getSession().getAttribute("loguser")!=null){
%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <%@include file="menuhead.jsp" %>
         
        <script src="javascripts/jquery.nicescroll.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
       
        
        <link rel="stylesheet" href="Styles/material.css">
        <script src="javascripts/material.js"></script>
        <link rel="stylesheet" href="Styles/ripples.css">
        <script src="javascripts/ripples.js"></script>
        <link rel="stylesheet" href="Styles/material-wfont.css">
        <!--<link rel="stylesheet" href="Styles/material.css.map">-->
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
                    
                    setInterval(function (){
                   $.ajax({url: 'bidcheck', success: function (result) {
                           
                          $('#currentbid').html('Current bid for front page is: '+result);
                          $('#placebid').min=result;
                        }});
              },1000);
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;" class="well">

                <h2 style="text-align: center;width: 100%">Welcome to SLMall bidding page</h2>
                <form action="processbid" method="post">
                <div class="log" >
                    <p>
                        From this page you can bid to set your advertisement to front page. Bidding starts with Rs.500/-.
                        If you win the bid, you can put your own advertisement for a week. Bid ends in Sunday 4.00P.M.
                        Your picture will show from Monday 8.00A.M to next week Monday 8.00A.M. You have to Upload your own 5 photos
                        at once. Even if you paid we can remove your photos if they have inappropriate content. We ara not 
                        responsible for any of your uploads.
                    </p>
                    <input type="checkbox" name="Understand" value="ON" required="" />&nbsp;I understand the terms and conditions.
                </div>
                <div>
                    <%
                    Calendar c=Calendar.getInstance();
                    c.set(Calendar.SECOND, 0);
                    c.set(Calendar.MINUTE, 0);
                    c.set(Calendar.HOUR_OF_DAY, 16);
                    c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
//                    if(Integer.parseInt(new Date().toString().split(" ")[3].split(":")[0]) >=16){
//                        c.add(Calendar.DATE,7);
//                    }
                    c.add(Calendar.DATE,7);
                    DateFormat df=new SimpleDateFormat("EEE yyyy/MM/dd HH:mm:ss");
                    String year=df.format(c.getTime()).split(" ")[1].split("/")[0];
                    String month=df.format(c.getTime()).split(" ")[1].split("/")[1];
                    String date =df.format(c.getTime()).split(" ")[1].split("/")[2];
                    
                    //out.write("Bid for "+df.format(c.getTime()));
                    out.write("Bid for "+c.getTime().toString());
                    %>
                    <%
                    SessionFactory sf=Connection.Connection.getSessionFactory();
                    sf.evictQueries();
                    Session session1=sf.openSession();
                    Criteria bidc=session1.createCriteria(DB.Bidding.class);
                    bidc.add(Restrictions.eq("bidForDate", c.getTime()));
                    bidc.addOrder(Order.desc("winingValue"));
                    List<DB.Bidding> bidl=bidc.list();
                    
                    session1.close();
                    %>
                    <div>
                        <h3 id="currentbid">Current bid for front page is:
                        <%
                    int bidint=0;
                        if(bidl.size()==0){
                        out.write("Rs: 500.00");
                        bidint=0;
                    }else{
                            out.write("Rs: "+bidl.get(0).getWiningValue().toString()+"0");
                            bidint=bidl.get(0).getWiningValue().intValue();
                        }
                        %>
                        </h3>
                    </div>
                    <div>
                        

<style type="text/css">
.numbers {
    padding: 0px;
    width: 45px;
    text-align: center;
    font-family: Arial;             
    font-size: 28px;
    font-weight: bold;   /* options are normal, bold, bolder, lighter */
    font-style: normal;  /* options are normal or italic */
    color: #FFFFFF;      /* change color using the hexadecimal color codes for HTML */
}
.title {        /* the styles below will affect the title under the numbers, i.e., “Days”, “Hours”, etc. */
    border-style: none;
    padding: 0px 0px 3px 0px;
    width: 45px;
    text-align: center;
    font-family: Arial;
    font-size: 10px;
    font-weight: bold;   /* options are normal, bold, bolder, lighter */
    color: #FFFFFF;      /* change color using the hexadecimal color codes for HTML */
}
#table {
    width: 400px;
    height: 70px;
    border-style: ridge;
    border-width: 3px;
    border-color: #666666;      /* change color using the hexadecimal color codes for HTML */
    background-color: #222222;  /* change color using the hexadecimal color codes for HTML */
}
</style>

<center>
    <h3>Time left:</h3>
<table id="table" border="0">
    <tr>
        <td align="center" colspan="6"><div class="numbers" id="count2" style="padding: 5px 0 0 0; "></div></td>
    </tr>
    <tr id="spacer1">
        <td align="center" ><div class="numbers" ></div></td>
        <td align="center" ><div class="numbers" id="dday"></div></td>
        <td align="center" ><div class="numbers" id="dhour"></div></td>
        <td align="center" ><div class="numbers" id="dmin"></div></td>
        <td align="center" ><div class="numbers" id="dsec"></div></td>
        <td align="center" ><div class="numbers" ></div></td>
    </tr>
    <tr id="spacer2">
        <td align="center" ><div class="title" ></div></td>
        <td align="center" ><div class="title" id="days">Days</div></td>
        <td align="center" ><div class="title" id="hours">Hours</div></td>
        <td align="center" ><div class="title" id="minutes">Minutes</div></td>
        <td align="center" ><div class="title" id="seconds">Seconds</div></td>
        <td align="center" ><div class="title" ></div></td>
    </tr>
</table>
</center>

<script type="text/javascript">

/*
Count down until any date script-
By JavaScript Kit (www.javascriptkit.com)
Over 200+ free scripts here!
Modified by Robert M. Kuhnhenn, D.O. 
on 5/30/2006 to count down to a specific date AND time,
and on 1/10/2010 to include time zone offset.
*/

/*  Change the items below to create your countdown target date and announcement once the target date and time are reached.  */
var current="Winter is here!";        //—>enter what you want the script to display when the target date and time are reached, limit to 20 characters
var year=<%= year %>;              //—>Enter the count down target date YEAR
var month=<%= month %>;                //—>Enter the count down target date MONTH
var day=<%= date %>;                 //—>Enter the count down target date DAY
var hour=16;                //—>Enter the count down target date HOUR (24 hour clock)
var minute=00;              //—>Enter the count down target date MINUTE
var tz=+5.30;                  //—>Offset for your timezone in hours from UTC (see http://wwp.greenwichmeantime.com/index.htm to find the timezone offset for your location)

//—>    DO NOT CHANGE THE CODE BELOW!    <—
var montharray=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

function countdown(yr,m,d,hr,min){
theyear=yr;themonth=m;theday=d;thehour=hr;theminute=min;
var today=new Date();
var todayy=today.getYear();
if (todayy < 1000) {todayy+=1900;}
var todaym=today.getMonth();
var todayd=today.getDate();
var todayh=today.getHours();
var todaymin=today.getMinutes();
var todaysec=today.getSeconds();
var todaystring1=montharray[todaym]+" "+todayd+", "+todayy+" "+todayh+":"+todaymin+":"+todaysec;
var todaystring=Date.parse(todaystring1)+(tz*1000*60*60);
var futurestring1=(montharray[m-1]+" "+d+", "+yr+" "+hr+":"+min);
var futurestring=Date.parse(futurestring1)-(today.getTimezoneOffset()*(1000*60));
var dd=futurestring-todaystring;
var dday=Math.floor(dd/(60*60*1000*24)*1);
var dhour=Math.floor((dd%(60*60*1000*24))/(60*60*1000)*1);
var dmin=Math.floor(((dd%(60*60*1000*24))%(60*60*1000))/(60*1000)*1);
var dsec=Math.floor((((dd%(60*60*1000*24))%(60*60*1000))%(60*1000))/1000*1);
if(dday<=0&&dhour<=0&&dmin<=0&&dsec<=0){
window.location.href="bidresult.jsp?bidfordate=<%= c.getTime().toString() %>";
document.getElementById('count2').style.display="inline";
document.getElementById('count2').style.width="390px";
document.getElementById('dday').style.display="none";
document.getElementById('dhour').style.display="none";
document.getElementById('dmin').style.display="none";
document.getElementById('dsec').style.display="none";
document.getElementById('days').style.display="none";
document.getElementById('hours').style.display="none";
document.getElementById('minutes').style.display="none";
document.getElementById('seconds').style.display="none";
document.getElementById('spacer1').style.display="none";
document.getElementById('spacer2').style.display="none";
return;
}
else {
document.getElementById('count2').style.display="none";
document.getElementById('dday').innerHTML=dday;
document.getElementById('dhour').innerHTML=dhour;
document.getElementById('dmin').innerHTML=dmin;
document.getElementById('dsec').innerHTML=dsec;

setTimeout("countdown(theyear,themonth,theday,thehour,theminute)",1000);
}
}

countdown(year,month,day,hour,minute);

</script>
<br>
<div style="width: 100%;">
    <center>
    <div style="width: 50%;">
        <input id="placebid" type="number" min="<%= bidint %>" required="" class="form-control floating-label" placeholder="Bidding Value" name="bidvalue" value="" />
    </div>
    <input class="btn btn-primary" type="submit" value="Place Bid" />
    </center>
</div>


                    </div>
                
                </div>
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<%
}else{
    request.getSession().setAttribute("msg", "Please login again");
    request.getSession().setAttribute("currentpage", "bid.jsp");
    response.sendRedirect("login.jsp");
}
%>
