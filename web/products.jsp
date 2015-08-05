<%-- 
    Document   : products
    Created on : Oct 27, 2014, 8:42:15 AM
    Author     : Nirodya
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int Sendcat = 0;
    int subcat = 0;
    if (request.getParameter("cat") != null) {
        Sendcat = Integer.parseInt(request.getParameter("cat"));
    }
    if (request.getParameter("subcat") != null) {
        subcat = Integer.parseInt(request.getParameter("subcat"));
    }
%>
<!DOCTYPE html>
<html id="scrollpage">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="menuhead.jsp" %>
        <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
        <link rel="stylesheet" href="css/metro-bootstrap.css">
        <link rel="stylesheet" href="Styles/productstyle.css">
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="http://code.jquery.com/jquery-2.1.1.js"></script>

        <script src="javascripts/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="metrojs/MetroJs.js"></script>

        <script>
            $(document).ready(function () {

                nice = $("#scrollpage").niceScroll();
            <%@include file="javascripts/menuscript.js"  %>

                $('#searchbar').click(function () {
                    $('#searchbar').animate({width: '50%'});
                });
                $('#searchbar').blur(function () {
                    $('#searchbar').animate({width: '25%'});
                });
                $elem1 = $('#menudiv');
                $elem2 = $('#menu');
                $elem3 = $('#logbut');
                $elem4 = $('.menu-item');
                $divheight = $elem2.height();
                $menuitemheight = $elem3.height();
                var scrollState = 'top';
                $(window).scroll(function () {
                    // alert($divheight);
                    var scrollPos = $(document).scrollTop();
                    var winheight = $('#indexproduct').height();
                    //alert($('.productdiv').length);
                    // alert(scrollPos +'_'+winheight);
                    var calwin = (winheight * 1) / 2;
                    //alert(winheight);
                    //if(scrollPos>calwin){
                    if ($(window).scrollTop() + $(window).height() === $(document).height()) {
                        // alert('ok');
                        $.ajax({url: 'productloadtwo.jsp?id=' + $('.productdiv').length + '&cat=<%=Sendcat%>'+'&subcat=<%= subcat %>'+'&pname=<%= request.getParameter("pname") %>', success: function (result) {
                                $('#indexproduct').append(result);
                            }});
                    }
                    if ((scrollPos !== 0) && (scrollState === 'top')) {
                        //alert('ok');
                        $elem1.stop().animate({height: '60px'}, 100);
                        $elem2.stop().animate({height: $divheight * 0.5}, 100);
                        $elem3.animate({width: '200px', marginTop: '0px'}, 100);
                        $elem4.animate({fontSize: 'medium'}, 100);


                        scrollState = 'scrolled';
                    }
                    else if ((scrollPos === 0) && (scrollState === 'scrolled')) {
                        //alert('ok2');
                        $elem1.stop().animate({height: '100px'}, 100);
                        $elem2.stop().animate({height: $divheight}, 100);
                        $elem3.animate({width: '200px', marginTop: '0px'}, 100);
                        $elem4.animate({fontSize: 'x-large'}, 100);
                        scrollState = 'top';
                    }

                });
            });
            function advanceSearchHandler($id) {
                $elem = $('#subcatogary' + $id);
                if ($elem.is(":visible")) {
                    // alert('done');
                    $('#subcatogary' + $id).hide(500);
                } else {

                    $elem.show(500);
                }
            }
            function advanceSearchHandlerLoading($id) {

                $('#subcatogary' + $id).hide(500);

            }
            function openWindow(cat, subcat) {
                
                if(document.getElementById('catSearchBar' + cat).checked) {
                    window.open('products.jsp?cat='+cat+'&pname=<%= request.getParameter("pname") %>',"_self");
                }else {
                    window.open('products.jsp',"_self");
                }
                
            }
            function openWindowSub(cat,subcat){
                if(document.getElementById('subcatCheckBox'+subcat).checked) {
                    window.open('products.jsp?cat='+cat+'&subcat='+subcat+'&pname=<%= request.getParameter("pname") %>',"_self");
                }else {
                    window.open('products.jsp',"_self");
                }
    }
        </script>
        <title>SL Mall</title>

    </head>
    <body>
        <%
            Controller.SearchProductManagement spm = new Controller.SearchProductManagement();

            //List<DB.Stock> plist = spm.searchStock("name", null, 0);
            String productName = request.getParameter("pname");
            List<DB.Stock> plist = spm.advanceSearchStock(Sendcat, subcat, productName, 0);
        %>
        <div id="wrapper">
            <%@include file="menu.jsp" %>
            <div id="searchdiv" class="well" >
                <h5>Search Bar</h5>
                <div style="width: 100%;">


                    <%
                        int advanceSearch = 0;
                        List<DB.Catogaries> catlist = spm.searchCatogaryAll();
                        for (DB.Catogaries cat : catlist) {
                            advanceSearch++;
                    %>

                    <div style="width: 100%"><h6><a onload="advanceSearchHandlerLoading(<%= advanceSearch%>)" id="catagorylink<%= advanceSearch%>"  class="searchCatogary" href="products.jsp?cat=<%=cat.getIdcatogaries()%>&pname=<%= productName %>"><input onchange="openWindow(<%=cat.getIdcatogaries()%>, 0)" id="catSearchBar<%=cat.getIdcatogaries()%>" type="checkbox" name="" <% if (Sendcat == cat.getIdcatogaries()) {
                           
                        }%> value="ON" />&nbsp;<%=cat.getCatogariName()%></a></h6></div>


                    <%
                        List<DB.SubCatogary> subcatlist = spm.searchSubCatogary(cat);
                        if (subcatlist != null) {
                    %>
                    <div  id="subcatogary<%=advanceSearch%>">

                        <ul>
                            <%

                                for (DB.SubCatogary scat : subcatlist) {
                            %>
                            <li><a href="products.jsp?cat=<%= scat.getCatogaries().getIdcatogaries()%>&subcat=<%=scat.getIdSubCatogary()%>&pname=<%= productName %>" ><input onclick="openWindowSub(<%= scat.getCatogaries().getIdcatogaries()%>,<%=scat.getIdSubCatogary()%>)" <% if (subcat == scat.getIdSubCatogary()) {
                                    out.write("checked");
                                }%> type="checkbox" name="subcat" id="subcatCheckBox<%=scat.getIdSubCatogary()%>" value="1" />&nbsp;<%= scat.getSubCatogaryName()%></a></li>
                                    <%
                                        }
                                    %>


                        </ul>


                    </div>
                    <% } %>
                    <% } %>



                </div>


            </div>
            <div style="margin-top: 100px;width: 70%;margin-left: auto;margin-right: auto;">
                <center>
                    <form action="products.jsp" >
                    <input style="width: 25%" type="text" id="searchbar" name="pname" value="" class="form-control" placeholder="Search" />
                        <button type="submit" class="btn btn-primary">Search</button>

                    </form>
                </center>

                <div id="indexproduct" style="width: 100%;" >

                    <%
                        double dpercentage = 0.00;
                        double roundedpercentage = 0.00;
                        for (DB.Stock st : plist) {
                            dpercentage = ((st.getSellingPrice() - st.getDiscountPrice()) / st.getSellingPrice()) * 100;
                            roundedpercentage = Math.round(dpercentage);


                    %>

                    <div class="productdiv well" >
                        <%
                        Session hs=Connection.Connection.getSessionFactory().openSession();
                        Criteria c=hs.createCriteria(DB.ShopsHasStock.class);
                        c.add(Restrictions.eq("stock", st));
                        List<DB.ShopsHasStock> shsl=c.list();
                        for(DB.ShopsHasStock shs:shsl){
                            %>
                            <a href="shop_view.jsp?shopid=<%=shs.getShops().getIdShops() %>">
                                <div style="text-align: center" class="alert alert-dismissable alert-info">
                                <span style="width: 100%;"><%=shs.getShops().getSname()%></span>
                        </div>
                            </a>
                          <%  
                        }
                        hs.close();
                        %>
                        
                        <center><h4 class="pname"><a href="view_products.jsp?pid=<%=st.getIdstock()%>"> <%=st.getProductName()%></a></h4></center>
                        <img class="productimage img-rounded" alt="Xperia z3" src="<%=st.getImage()%>">
                        <div style="background: rgba(255, 0, 0, 0.4);text-align: center"><%=roundedpercentage%>%&nbsp;Discount!</div>
                        <div style="text-align: center;width: 100%" class="btn btn-flat btn-success">
                            <span style="width: 100%;"><h5>Rs:&nbsp;<%=st.getDiscountPrice()%></h5></span>
                            <a href="view_products.jsp?pid=<%=st.getIdstock()%>"><input type="submit" value="Details" class="btn btn-primary" /></a>
                        </div>

                    </div>


                    <% }%>
                </div>


            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
