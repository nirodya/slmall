<%@page import="java.util.List"%>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="Styles/styles.css"/>
        <link rel="stylesheet" href="css/metro-bootstrap.css">
    </head>
    <body>
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
                        <img class="productimage" alt="Xperia z3" src="<%=st.getImage()%>">
                        <div style="background: rgba(255, 0, 0, 0.4);text-align: center"><%=roundedpercentage %>%&nbsp;Discount!</div>
                        <div style="text-align: center;" class="well">
                            <span style="width: 100%;"><h5>Rs:&nbsp;<%=st.getDiscountPrice() %></h5></span>
                            <a href="view_products.jsp?pid=<%=st.getIdstock() %>"><button class="btn btn-danger btn-raised" type="button">Details</button></a>
                        </div>
                        
</div>


                    <% }%>
                    </body>
</html>