
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
            <%@include file="javascripts/menuscript.js"  %>
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div style="margin-top: 100px;width: 80%;margin-left: auto;margin-right: auto;" class="well">
                <%
                    Session bidsess = Connection.Connection.getSessionFactory().openSession();
                    Criteria bidc = bidsess.createCriteria(DB.Bidding.class);
                    bidc.add(Restrictions.eq("idbidding", Integer.parseInt(request.getParameter("bid"))));
                    DB.Bidding bid = (DB.Bidding) bidc.uniqueResult();
                    Criteria adc = bidsess.createCriteria(DB.FronAdImages.class);
                    adc.add(Restrictions.eq("bidding", bid));
                    
                    List<DB.FronAdImages> frontad=adc.list();
                    if (frontad.size() == 0) {
                %>
                <form action="uploadslideimages" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="bid" value="<%= bid.getIdbidding() %>" />
                    <table class="table table-hover">
                        <tr>
                            <td><input required="" class="form-control" type="text" name="heding" value="" /></td>
                            <td><input onchange="PreviewImage()" name="image" id="uploadImage" type="file" accept="image/*" value="" /></td>
                            <td><img id="uploadPreview" src="" width="100" height="100"/></td>
                            <script type="text/javascript">


                        function PreviewImage() {
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                            oFReader.onload = function (oFREvent) {
                                document.getElementById("uploadPreview").src = oFREvent.target.result;
                            };
                        }
                        ;

                    </script>
                        </tr>
                        <tr>
                            <td><input required="" class="form-control" type="text" name="heding1" value="" /></td>
                            <td><input onchange="PreviewImage1()" name="image1" id="uploadImage1" type="file" accept="image/*" value="" /></td>
                            <td><img id="uploadPreview1" width="100" height="100"/></td>
                        </tr>
                         <script type="text/javascript">


                        function PreviewImage1() {
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(document.getElementById("uploadImage1").files[0]);

                            oFReader.onload = function (oFREvent) {
                                document.getElementById("uploadPreview1").src = oFREvent.target.result;
                            };
                        }
                        ;

                    </script>
                        <tr>
                            <td><input required="" class="form-control" type="text" name="heding2" value="" /></td>
                            <td><input onchange="PreviewImage2()" name="image2" id="uploadImage2" type="file" accept="image/*" value="" /></td>
                            <td><img id="uploadPreview2" width="100" height="100"/></td>
                        </tr>
                        <script type="text/javascript">


                        function PreviewImage2() {
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(document.getElementById("uploadImage2").files[0]);

                            oFReader.onload = function (oFREvent) {
                                document.getElementById("uploadPreview2").src = oFREvent.target.result;
                            };
                        }
                        ;

                    </script>
                        <tr>
                            <td><input required="" class="form-control" type="text" name="heding3" value="" /></td>
                            <td><input onchange="PreviewImage3()" id="uploadImage3" type="file" accept="image/*" name=image3" value="" /></td>
                            <td><img id="uploadPreview3" width="100" height="100"/></td>
                        </tr>
                        <script type="text/javascript">


                        function PreviewImage3() {
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(document.getElementById("uploadImage3").files[0]);

                            oFReader.onload = function (oFREvent) {
                                document.getElementById("uploadPreview3").src = oFREvent.target.result;
                            };
                        }
                        ;

                    </script>
                        <tr>
                            <td><input required="" class="form-control" type="text" name="heding4" value="" /></td>
                            <td><input onchange="PreviewImage4()" id="uploadImage4" type="file" accept="image/*" name="image4" value="" /></td>
                            <td><img id="uploadPreview4" width="100" height="100"/></td>
                        </tr>
                        <script type="text/javascript">


                        function PreviewImage4() {
                            var oFReader = new FileReader();
                            oFReader.readAsDataURL(document.getElementById("uploadImage4").files[0]);

                            oFReader.onload = function (oFREvent) {
                                document.getElementById("uploadPreview4").src = oFREvent.target.result;
                            };
                        }
                        ;

                    </script>
                    <tr>
                        <td colspan="3"><input class="btn btn-primary" type="submit" value="Upload" /></td>
                    </tr>
                    </table>

                </form>

                <%
                    } else {
                        out.write("Document Expired");
                    }
                %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
