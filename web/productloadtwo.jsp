<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="Styles/styles.css"/>
        <link rel="stylesheet" href="css/metro-bootstrap.css">
    </head>
    <body>
<%
    int id;
    int cat;
    int subcat;
    String productName=request.getParameter("pname");
        if(request.getParameter("id")!=null){
            id=Integer.parseInt(request.getParameter("id"));
        }else{
            id=0;
        }
        if(request.getParameter("cat")!=null){
            cat=Integer.parseInt(request.getParameter("cat"));
        }else{
            cat=0;
        }
        if(request.getParameter("subcat")!=null){
            subcat=Integer.parseInt(request.getParameter("subcat"));
        }else{
            subcat=0;
        }
            Controller.SearchProductManagement spm = new Controller.SearchProductManagement();
//            List<DB.Stock> plist = spm.searchStock("name", null,id);
            List<DB.Stock> plist = spm.advanceSearchStock(cat, subcat, productName, id);
%>
<% 
                    double dpercentage=0.00;
                    double roundedpercentage= 0.00;
                            for (DB.Stock st : plist) {
                              dpercentage=((st.getSellingPrice()-st.getDiscountPrice())/st.getSellingPrice())*100;
                              roundedpercentage=Math.round(dpercentage);
                              
                        
%>
<div style="font-family: 'Lato', sans-serif;" class="productdiv well">
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
                        <center><h4 class="pname"><a href="view_products.jsp?pid=<%=st.getIdstock() %>"> <%=st.getProductName()%></a></h4></center>
                        <img class="productimage" alt="Xperia z3" src="<%=st.getImage()%>">
                        <div style="background: rgba(255, 0, 0, 0.4);text-align: center"><%=roundedpercentage %>%&nbsp;Discount!</div>
                        <div style="text-align: center;width: 100%" class="btn btn-flat btn-success">
                            <span style="width: 100%;"><h5>Rs:&nbsp;<%=st.getDiscountPrice() %></h5></span>
                            <a href="view_products.jsp?pid=<%=st.getIdstock() %>"><button class="btn btn-primary" type="button">Details</button></a>
                        </div>
                        
</div>


                    <% }%>
                    </body>
</html>