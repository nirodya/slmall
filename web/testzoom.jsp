<%-- 
    Document   : testzoom
    Created on : Nov 16, 2014, 9:07:33 AM
    Author     : Nirodya Gamage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="javascripts/login.js" type="text/javascript"></script>
        <script src="javascripts/zoom/ZoomPic.js"></script>
        <style type="text/css">
            .images img {
  width: 20%;
  height: 160px;
}
        </style>
        <script type="text/javascript">
            $(document).ready(function (){
                $(".images").ZoomPic();
            });
        </script>
    </head>
    <body>
        <div class="images">
            <a href="#"><img src="images/shoppingmall1.jpg" ></a>
            <a href="#"><img src="images/shoppingmall2.jpg" ></a>
            <a href="#"><img src="images/shoppingmall3.jpg" ></a>
</div>
    </body>
</html>
