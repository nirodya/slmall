<%-- 
    Document   : index
    Created on : Jun 4, 2014, 8:22:10 AM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
        <%@include file="menuhead.jsp" %>
        
<!--        <link rel="stylesheet" href="css/metro-bootstrap.css">
        <link rel="stylesheet" href="metrojs/MetroJs.css">-->
        <link rel="stylesheet" href="Styles/productstyle.css">
        
        
        
<!--        <script src="js/jquery.easing.1.3.js"></script>
        <script src="metrojs/MetroJs.js"></script>-->
        
        <!--<script type="text/javascript" src="javascripts/login.js"></script>-->
        <script src="javascripts/jquery.nicescroll.js"></script>
        <script>
            $(document).ready(function() {
                 <%@include file="javascripts/menuscript.js"  %>
                 $elem1 = $('#menudiv');
                 $elem2 = $('#menu');
                 $elem3 = $('#logbut');
                 $elem4 = $('.menu-item');
                 $divheight=$elem2.height();
                 $menuitemheight=$elem3.height();
                 var scrollState = 'top';
                 $('#searchbar').click(function (){
                     $('#searchbar').animate({width:'50%'});
    });
    $('#searchbar').blur(function (){
    $('#searchbar').animate({width:'25%'});
    });
    $('#test').click(function (){
    var scrollPos = $(window).scrollTop();
    var winheight=$(window).height();
    var calwin=(winheight*2)/3;
    if(scrollPos>calwin){
    alert(scrollPos);
    }else{
    alert('no');
        }
    });
                $(window).scroll(function (){
                // alert($divheight);
                    var scrollPos = $(window).scrollTop();
                   var winheight=$('#indexproduct').height();
                  // alert(winheight);
    var calwin=(winheight*2)/3;
    //if(scrollPos>calwin){
    if($(window).scrollTop() + $(window).height() === $(document).height()){
       // alert('ok');
       $('#loader').show(1000);
    $.ajax({url: 'productloadtwo.jsp?id='+$('.productdiv').length, success: function (result) {
                           $('#indexproduct').append(result);
                        }});
                    $('#loader').hide(1000);
    }
    if( ( scrollPos !== 0 ) && ( scrollState === 'top' ) ) {
        //alert('ok');
        $elem1.stop().animate({height: '60px'}, 100);
        $elem2.stop().animate({height: $divheight*0.5}, 100);
        $elem3.animate({width:'200px',marginTop:'0px'},100);
        $elem4.animate({fontSize:'medium'},100);
        
        
        scrollState = 'scrolled';
    }       
    else if( ( scrollPos === 0 ) && ( scrollState === 'scrolled' )  ) {
        //alert('ok2');
        $elem1.stop().animate({height: '100px'}, 100);
        $elem2.stop().animate({height: $divheight}, 100);
        $elem3.animate({width:'200px',marginTop:'0px'},100);
        $elem4.animate({fontSize:'x-large'},100);
        scrollState = 'top';
    }
                    
                });
                $('#intro').hide();
                $('#iconimage').hide();
                $('#introlink').click(function() {
                    $('#intro').show();
                    $('#iconimage').hide();
                });
                $('#intro').mousemove(function() {
                    $('#iconimage').show();
                });
                $('#iconimage').click(function() {
                    $('#htvid').get(0).pause();
                    $('#intro').hide();
                });
                
                nice = $("html").niceScroll();
                
            });
        </script>
        <title>JSP Page</title>
    </head>
    <body >
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="width: 100%;margin-top: 0px;">
                
            </div>
            <div  style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;">
                <center>
                <form action="products.jsp" >
                    <input style="width: 25%" type="text" id="searchbar" name="pname" value="" class="form-control" placeholder="Search" />
                        <button type="submit" class="btn btn-primary">Search</button>

                    </form>
                </center>
                
                <%@include file="slide.jsp" %><br>
                <%
                if(request.getSession().getAttribute("loguser")!=null){
                if (urle.equals("Shop_owner")) {
                    %>
                    <div>
                        <a href="bid.jsp">Put my advertisement to slide</a>
                    </div>
                <%
                }
                }
                %>
                <div id="intro" style="background: rgba(255, 255, 255, 0.8);
                     position:fixed;
                     width:100%;
                     height:100%;
                     top:0px;
                     left:0px;
                     z-index:1000;"><img id="iconimage" height="50" width="50" style="float: right;z-index: 1000; position: absolute;" src="images/imageedit_1_9313632339.gif" /><div style="width: 100%;height: 100%; margin: auto;margin-left: auto;margin-right: auto; opacity: 2;"><video id="htvid"  style="width: 100%; height: 100%;"  controls><source src="videos/The CW - TV Now - YouTube.mp4" type="video/mp4"><source src="videos/The CW - TV Now - YouTube.webm" type="video/webm" /></video></div></div>
                <div style="position: initial" >
                    
                    <div id="indexproduct">
               <%
    int id;
        if(request.getParameter("id")!=null){
            id=Integer.parseInt(request.getParameter("id"));
        }else{
            id=0;
        }
            Controller.SearchProductManagement spm = new Controller.SearchProductManagement();
            List<DB.Stock> plist = spm.searchStock("name", null,id);
%>
<% 
                    double dpercentage=0.00;
                    double roundedpercentage= 0.00;
                            for (DB.Stock st : plist) {
                              dpercentage=((st.getSellingPrice()-st.getDiscountPrice())/st.getSellingPrice())*100;
                              roundedpercentage=Math.round(dpercentage);
                              
                        
%>
<div style="font-family: 'Lato', sans-serif;" class="productdiv well">
                        
                        <center><h4 class="pname"><a href="view_products.jsp?pid=<%=st.getIdstock() %>"> <%=st.getProductName()%></a></h4></center>
                        <img style="width: 100%" height="150" class="productimage" alt="Xperia z3" src="<%=st.getImage()%>">
                        <div style="background: rgba(255, 0, 0, 0.4);text-align: center"><%=roundedpercentage %>%&nbsp;Discount!</div>
                        <div style="text-align: center;" class="well">
                            <span style="width: 100%;"><h5>Rs:&nbsp;<%=st.getDiscountPrice() %></h5></span>
                            <a href="view_products.jsp?pid=<%=st.getIdstock() %>"><button class="btn btn-danger btn-raised" type="button">Details</button></a>
                        </div>
                        
</div>


                    <% }%>
                      
                </div>
                    <center><img style="display: none;" id="loader" src="images/ajax-loader.gif" /></center>
                </div>
                
            </div>




        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
