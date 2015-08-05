<%-- 
    Document   : Dragdroptest
    Created on : Oct 9, 2014, 9:56:12 AM
    Author     : Nirodya
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <!--<link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>-->
        <%--<link type="text/css" rel="stylesheet" href="Styles/styles.css" />--%>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <!-- include Cycle plugin -->
        <script type="text/javascript" src="javascripts/slider.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                $('#upperdiv').hide();
                $('#upperdiv1').hide();
                $('#upperdiv2').hide();
                $('#upperdiv3').hide();
                $('#upperdiv4').hide();
                $('.slideshow').cycle({
                    fx: 'scrollLeft,scrollDown,scrollRight,scrollUp,fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                });
                $('#divimg').mouseover(function () {
                    $('#upperdiv').show();

                });
                $('#divimg').mouseout(function () {
                    $('#upperdiv').hide();

                });
                $('#upperdiv').hover(function () {
                    if ($('#abc').height() > 1) {
                        $("#abc").css({height: "0%"});
                    } else {
                        $("#abc").animate({height: "20%"});
                    }
                });

                $('#divimg1').mouseover(function () {
                    $('#upperdiv1').show();

                });
                $('#divimg1').mouseout(function () {
                    $('#upperdiv1').hide();

                });
                $('#upperdiv1').hover(function () {

                    if ($('#abc1').height() > 1) {
                        $("#abc1").css({height: "0%"});
                    } else {
                        $("#abc1").animate({height: "20%"});
                    }
                });

                $('#divimg2').mouseover(function () {
                    $('#upperdiv2').show();

                });
                $('#divimg2').mouseout(function () {
                    $('#upperdiv2').hide();

                });
                $('#upperdiv2').hover(function () {

                    if ($('#abc2').height() > 1) {
                        $("#abc2").css({height: "0%"});
                    } else {
                        $("#abc2").animate({height: "20%"});
                    }
                });

                $('#divimg3').mouseover(function () {
                    $('#upperdiv3').show();

                });
                $('#divimg3').mouseout(function () {
                    $('#upperdiv3').hide();

                });
                $('#upperdiv3').hover(function () {

                    if ($('#abc3').height() > 1) {
                        $("#abc3").css({height: "0%"});
                    } else {
                        $("#abc3").animate({height: "20%"});
                    }
                });

                $('#divimg4').mouseover(function () {
                    $('#upperdiv4').show();

                });
                $('#divimg4').mouseout(function () {
                    $('#upperdiv4').hide();

                });
                $('#upperdiv4').hover(function () {

                    if ($('#abc4').height() > 1) {
                        $("#abc4").css({height: "0%"});
                    } else {
                        $("#abc4").animate({height: "20%"});
                    }
                });

            });
        </script>
    </head>
    <body style="font-family: 'Lato', sans-serif;">
         <div class="slideshow carousel-inner" id="slide1" style="height: 400px;width: 100%; -webkit-box-shadow: 0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             -moz-box-shadow:    0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             box-shadow:         0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             position: relative;">
        <%
            Calendar cal = Calendar.getInstance();
            int dayOfTheWeek = cal.get(Calendar.DAY_OF_WEEK);
            cal.add(Calendar.DAY_OF_WEEK, Calendar.SUNDAY - dayOfTheWeek);
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
           
            System.out.println("DAY IS   " +sdf.parse(sdf.format(cal.getTime())));
            Session slidesession=Connection.Connection.getSessionFactory().openSession();
            Criteria slidecriteria=slidesession.createCriteria(DB.Bidding.class);
            slidecriteria.add(Restrictions.eq("bidForDate", cal.getTime()));
            slidecriteria.addOrder(Order.desc("winingValue"));
            List<DB.Bidding> listbid= slidecriteria.list();
            if(listbid.size()==0){
                %>
        <div id="divimg" style="width: 100%;height: 100%"><div id="upperdiv" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop Happily</h3></div></div><img  src="images/shoppingmall1.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg1" style="width: 100%;height: 100%"><div id="upperdiv1" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc1" style="margin-bottom: 0px;bottom: 0px;position: absolute;height:0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop Unlimited</h3></div></div><img  src="images/shoppingmall2.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg2" style="width: 100%;height: 100%"><div id="upperdiv2" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc2" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Choose Anything</h3></div></div><img  src="images/shoppingmall3.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg3" style="width: 100%;height: 100%"><div id="upperdiv3" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc3" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop easily</h3></div></div><img  src="images/shoppingmall4.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg4" style="width: 100%;height: 100%"><div id="upperdiv4" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc4" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Deliver to your doorstep</h3></div></div><img  src="images/shoppingmall5.jpg" style="width: 100%;height: 100%;"  /></div>
             <%
            }else{
            DB.Bidding slidebid=listbid.get(0);
           System.out.println("DAY IS   "+slidebid.getBidDate());
                    Criteria adc = slidesession.createCriteria(DB.FronAdImages.class);
                    adc.add(Restrictions.eq("bidding", slidebid));
                    
                    List<DB.FronAdImages> frontad=adc.list();
                    if(frontad.size()==0){
        %>
       
            <div id="divimg" style="width: 100%;height: 100%"><div id="upperdiv" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop Happily</h3></div></div><img  src="images/shoppingmall1.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg1" style="width: 100%;height: 100%"><div id="upperdiv1" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc1" style="margin-bottom: 0px;bottom: 0px;position: absolute;height:0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop Unlimited</h3></div></div><img  src="images/shoppingmall2.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg2" style="width: 100%;height: 100%"><div id="upperdiv2" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc2" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Choose Anything</h3></div></div><img  src="images/shoppingmall3.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg3" style="width: 100%;height: 100%"><div id="upperdiv3" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc3" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Shop easily</h3></div></div><img  src="images/shoppingmall4.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg4" style="width: 100%;height: 100%"><div id="upperdiv4" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc4" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3>Deliver to your doorstep</h3></div></div><img  src="images/shoppingmall5.jpg" style="width: 100%;height: 100%;"  /></div>
        
<%
                    }else{
                        int i=0;
                        for(DB.FronAdImages fa:frontad){
                          if(i==0){
                            %>
                             <div id="divimg" style="width: 100%;height: 100%"><div id="upperdiv" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3><%= fa.getAdDescription() %></h3></div></div><img  src="<%= fa.getImgPath() %>" style="width: 100%;height: 100%;" /></div>
            <%  
                          }else{ 
                        
                        %>
                        <div id="divimg<%= i %>" style="width: 100%;height: 100%"><div id="upperdiv<%= i %>" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc<%= i %>" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h3><%= fa.getAdDescription() %></h3></div></div><img  src="<%= fa.getImgPath() %>" style="width: 100%;height: 100%;" /></div>
        <%
                          }
         i++;
                            }
                    }}
%>
</div>

    </body>
</html>
