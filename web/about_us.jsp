<%-- 
    Document   : about_us
    Created on : Aug 2, 2014, 7:34:55 AM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <%@include file="menuhead.jsp" %>
        <link href='http://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
        <style type="text/css">
            #bod{
                font-family: 'Lato', sans-serif;
                background:transparent url(images/abtusback.jpg) no-repeat fixed top center;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            #main{ width: auto; margin: 0 auto; background: #fff; border-left: 1px solid #ccc; border-right: 1px solid #ccc; }
            .section{ height:100vh;min-height: 500px; padding: 40px;  }
            /* NAVIGATION STYLES */

            .standardNav{

                position: fixed !important;
                overflow: visible;
                top: 50%;
                left: 50%;
                padding: 5px;
                //margin: -250px 0 0 -630px;
                margin: -18% 0 0 -46%;

                width: auto;
                z-index: 9999;
            }

            .standardNav ul{
                display: block;
                margin: 0;
                padding: 6px;
                list-style: none;
                -webkit-border-radius: 15px;
                -moz-border-radius: 15px;
                border-radius: 15px;
                background: #fff;
                -webkit-box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, .3);
                -moz-box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, .3);
                box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, .3);
                background: rgba(255, 255, 255, 0.1);
            }

            .standardNav.left{
                margin-left: -645px;
            }

            .standardNav li{
                display: block;
            }

            .standardNav li a{
                display: block;	
                font-weight: normal;
                padding: 8px 10px;
                text-decoration: none;
                color: #666;
                font-size: 12px;
            }	

            .standardNav li a:hover{
                color: #333;
            }

            .standardNav li.active a{
                font-weight: bold;
                color: #000;
            }
            #one{
                //background-color: #fdbd63; 
                background-image: url('images/shopping-wallpaper-1920x1080.jpg');
                -webkit-box-orient: horizontal;
                -moz-box-orient: horizontal;
                box-orient: horizontal;


            }
            #two{
                background-image: url('images/feedback.jpg');
                background-size: 100%;
            }
            #datahold{

                -webkit-box-shadow: 0px 0px 5px 0px rgba(51, 50, 50, 1);
                -moz-box-shadow:    0px 0px 5px 0px rgba(51, 50, 50, 1);
                box-shadow:         0px 0px 5px 0px rgba(51, 50, 50, 1);
                -webkit-border-radius: 15px;
                -moz-border-radius: 15px;
                border-radius: 15px;

            }
            #twoform{
                -webkit-box-shadow: 0px 0px 5px 0px rgba(51, 50, 50, 1);
                -moz-box-shadow:    0px 0px 5px 0px rgba(51, 50, 50, 1);
                box-shadow:         0px 0px 5px 0px rgba(51, 50, 50, 1);
                margin: auto;
                background: rgba(255, 255, 255, 0.8);
                width: 70%;
            }
            #three{
                background-image: url('images/fb.jpg');
                background-size: 100%;
            }
            #threediv{
                
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                background: rgba(255, 255, 255, 0.8);
                -webkit-box-shadow: 0px 0px 5px 0px rgba(51, 50, 50, 1);
                -moz-box-shadow:    0px 0px 5px 0px rgba(51, 50, 50, 1);
                box-shadow:         0px 0px 5px 0px rgba(51, 50, 50, 1);
                -webkit-border-radius: 15px;
                -moz-border-radius: 15px;
                border-radius: 15px;
                position: relative;
            }

        </style>
        <script type="text/javascript" src="javascripts/login.js"></script>
        <script src="javascripts/jquery.nicescroll.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script>
            function initialize() {
                var map_canvas = document.getElementById('map_canvas');
                var myLatlng = new google.maps.LatLng(6.896993, 79.862071);
                var mapOptions = {
                    center: myLatlng,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    draggable: false
                };
                var map = new google.maps.Map(map_canvas, mapOptions);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: "We're Here"
                });
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <title>Shop</title>
        <script>
            $('#wrapper').bind('mousewheel', function (e) {
                if (!(e.originalEvent.wheelDelta == 120)) {
                    var top = parseInt($("#main").css("top"));
                    $("#main").css("top", (top - 100) + "px");
                    top = parseInt($("#main").css("top"));
                    if (top <= -500) {
                        setTimeout(function () {
                            $("#main").css("top", "-500px");
                        }, 100);
                    }
                } else {
                    var top = parseInt($("#main").css("top"));

                    $("#main").css("top", (top + 100) + "px");
                    top = parseInt($("#main").css("top"));
                    if (top >= 0) {
                        setTimeout(function () {
                            $("#main").css("top", "0");
                        }, 100);
                    }
                }
            });
            $(function () {
                $('a[href*=#]:not([href=#])').click(function () {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {

                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            $('html,body').animate({
                                scrollTop: target.offset().top
                            }, 750);
                            return false;
                        }
                    }
                });
            });


        </script>
        <script>
            $(document).ready(function () {
                nice = $("html").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>
                    
            });
        </script>
    </head>
    <body id="bod">
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=398679153600777&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <%@include file="menu.jsp" %>

        <div id="myNavigation" class="pageScrollerNav standardNav right dark">
            <ul>
                <li><a href="#one"><img src="images/icons/map.ico" alt="mapico" /></a></li>
                <li><a href="#two"><img src="images/icons/feedback.ico" alt="feedbackico" /></a></li>
                <li><a href="#three"><img src="images/icons/facebook.ico" alt="facebookico" /></a></li>
                <li><a href="#four"><img src="images/icons/twitter.ico" alt="twitterico" /></a></li>
                <%--<li><a href="#five"><img src="images/icons/gplus.ico" alt="gico" /></a></li>--%>
            </ul>
        </div>


        <div id="wrapper">
            <div id="main">
                <div  id="one" class="section ">
                    <br>
                    <br>
                    <center>
                        <h2 style="color: #1c2fff">We are here</h2>
                    </center>

                    <div style="float: left;width: 50%;height: 50%;margin-left: 10% " id="map_canvas">
                    </div>
                    <div id="datahold" style="float: right;width: 20%;margin-right: 10%;background: rgba(255, 255, 255, 0.8); ">
                        <center>
                            <h3>Address:</h3>
                            <p>No.14,<br>
                                Louris Road,<br>
                                Colombo 5.
                            </p>
                            <h3>Call Us:</h3>
                            <p>077123456</p>
                            <h3>Working hours:</h3>
                            <p>9.30 AM to 6 PM – Monday to Friday<br>
                                Closed on Weekends&nbsp;
                                and Public Holidays.<br>
                            </p>
                        </center>
                    </div>

                </div>
                <div  id="two" class="section">
                    <br>
                    <br>
                    <center>
                        <h3>Send your feedbacks</h3>
                    </center>
                    <form id="twoform" action="Feedback" class="well" >
                        <table border="0">

                            <tbody>
                                <tr>
                                    <td>Name:</td>
                                    <td><input class="form-control" style="width: 200%;" type="text" name="name" value="" />
                                        <input type="hidden" name="page" value="about_us.jsp" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input class="form-control" style="width: 200%;" type="email" name="email" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Feedback:</td>
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
                <div  id="three" class="section">
                    
                    <div style="margin-top: 100px;margin-left: auto;margin-right: auto;text-align: center;width: 70%;" >
                        <div id="threediv">
                           <%-- <center>
                        <h5>Like us on Facebook</h5>
                            </center>--%>
                        <div  class="fb-like-box" data-href="https://www.facebook.com/srilankamall" data-width="auto" data-height="500" data-colorscheme="dark" data-show-faces="true" data-header="false" data-stream="true" data-show-border="false"></div>
                        </div>
                        
                    </div>
                </div>
                <div style="background-image: url('images/tweet.jpg');background-size: 100%;" id="four" class="section">
                    
                        <div style="height: 500px;width: 50%;margin-left: auto;margin-right: auto;">
                    <a class="twitter-timeline" data-dnt="true" href="https://twitter.com/denukagamage" data-widget-id="532350822454001664">Tweets by @denukagamage</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                        </div>
                        </div>
                
            </div><!-- [END] #main -->
        </div>



    </body>
</html>
