<%-- 
    Document   : Dragdroptest
    Created on : Oct 9, 2014, 9:56:12 AM
    Author     : Nirodya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <%--<link type="text/css" rel="stylesheet" href="Styles/styles.css" />--%>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <!-- include Cycle plugin -->
        <script type="text/javascript" src="javascripts/slider.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                
                $('#upperdiv').hide();
                $('#upperdiv1').hide();
                $('#upperdiv2').hide();
                $('#upperdiv3').hide();
                $('#upperdiv4').hide();
                $('.slideshow').cycle({
                    fx: 'scrollLeft,scrollDown,scrollRight,scrollUp,fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                });
                $('#divimg').mouseover(function() {
                    $('#upperdiv').show();

                });
                $('#divimg').mouseout(function() {
                    $('#upperdiv').hide();

                });
                $('#upperdiv').hover(function() {
                    if ($('#abc').height() > 1) {
                        $("#abc").css({height: "0%"});
                    } else {
                        $("#abc").animate({height: "20%"});
                    }
                });

                $('#divimg1').mouseover(function() {
                    $('#upperdiv1').show();

                });
                $('#divimg1').mouseout(function() {
                    $('#upperdiv1').hide();

                });
                $('#upperdiv1').hover(function() {

                    if ($('#abc1').height() > 1) {
                        $("#abc1").css({height: "0%"});
                    } else {
                        $("#abc1").animate({height: "20%"});
                    }
                });

                $('#divimg2').mouseover(function() {
                    $('#upperdiv2').show();

                });
                $('#divimg2').mouseout(function() {
                    $('#upperdiv2').hide();

                });
                $('#upperdiv2').hover(function() {

                    if ($('#abc2').height() > 1) {
                        $("#abc2").css({height: "0%"});
                    } else {
                        $("#abc2").animate({height: "20%"});
                    }
                });

                $('#divimg3').mouseover(function() {
                    $('#upperdiv3').show();

                });
                $('#divimg3').mouseout(function() {
                    $('#upperdiv3').hide();

                });
                $('#upperdiv3').hover(function() {

                    if ($('#abc3').height() > 1) {
                        $("#abc3").css({height: "0%"});
                    } else {
                        $("#abc3").animate({height: "20%"});
                    }
                });

                $('#divimg4').mouseover(function() {
                    $('#upperdiv4').show();

                });
                $('#divimg4').mouseout(function() {
                    $('#upperdiv4').hide();

                });
                $('#upperdiv4').hover(function() {

                    if ($('#abc4').height() > 1) {
                        $("#abc4").css({height: "0%"});
                    } else {
                        $("#abc4").animate({height: "20%"});
                    }
                });

            });
        </script>
    </head>
    <body>
       <div class="slideshow carousel-inner" id="slide1" style="margin-top: 98px;height: 400px;width: 100%; -webkit-box-shadow: 0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             -moz-box-shadow:    0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             box-shadow:         0px 9px 26px 0px rgba(50, 50, 50, 0.68);
             position: relative;">
            <div id="divimg" style="width: 100%;height: 100%"><div id="upperdiv" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h1>abc</h1></div></div><img  src="images/10027.JPG" style="width: 100%;height: 100%;" /></div>
            <div id="divimg1" style="width: 100%;height: 100%"><div id="upperdiv1" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc1" style="margin-bottom: 0px;bottom: 0px;position: absolute;height:0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h1>abc1</h1></div></div><img  src="images/10035.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg2" style="width: 100%;height: 100%"><div id="upperdiv2" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc2" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h1>abc2</h1></div></div><img  src="images/10090.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg3" style="width: 100%;height: 100%"><div id="upperdiv3" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc3" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h1>abc3</h1></div></div><img  src="images/10101.jpg" style="width: 100%;height: 100%;" /></div>
            <div id="divimg4" style="width: 100%;height: 100%"><div id="upperdiv4" style="float: right;z-index: 1000;width: 100%;height: 100%;position: absolute;background: rgba(0, 0, 0, 0.4);"><div id="abc4" style="margin-bottom: 0px;bottom: 0px;position: absolute;height: 0%;width: 100%;background: rgba(0, 0, 0, 0.9);"><h1>abc4</h1></div></div><img  src="images/10127.jpg" style="width: 100%;height: 100%;"  /></div>
</div>


   
    </body>
</html>
