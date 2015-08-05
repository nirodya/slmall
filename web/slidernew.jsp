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