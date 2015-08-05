<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<div style="width: auto;">
    <%
        String catname = request.getParameter("catogary");

        String govalue = request.getParameter("govalue");
        Session s = Connection.Connection.getSessionFactory().openSession();
        
        Criteria c = s.createCriteria(DB.Catogaries.class);
        c.add(Restrictions.eq("catogariName", catname));
        DB.Catogaries catog = (DB.Catogaries) c.uniqueResult();
        Set<DB.Stock> catset = (Set) catog.getStocks();
        if (catset.size() < 5) {
            for (DB.Stock stk : catset) {
    %>
    <div class="otherdiv" style="float: left;width: 20%;padding: 2%;">
        <div><a style="text-decoration: none;" href="view_products.jsp?pid=<%=stk.getIdstock() %>"><h5><%=stk.getProductName()%></h5></a></div>
        <div style="width: 100%;height: 100px;"><img src="<%=stk.getImage()%>" alt="Product Image" width="100%" height="100" /></div>
    </div>
    <% }
    } else {
        DB.Stock stk;
        int i = 0;
        if (Integer.parseInt(govalue) != 0) {
            i = Integer.parseInt(govalue);
        }
        Iterator<DB.Stock> it = catset.iterator();
        for (i = 0; i < 4; i++) {
            stk = it.next();
    %>
    <div class="otherdiv" style="float: left;width: 20%;padding: 2%;text-align: center;">
        <div><a style="text-decoration: none;" href="view_products.jsp?pid=<%=stk.getIdstock() %>"><h5><%=stk.getProductName()%></h5></a></div>
        <div style="width: 100%;height: 100px;"><img src="<%=stk.getImage()%>" alt="Product Image" width="100%" height="100" /></div>
        <div class="well" style="position: relative;text-align: center;">Rs:<%=stk.getDiscountPrice() %>0</div>
    </div>
    <%

        }
    %>
    <input id="govalue" type="hidden" name="govalue" value="<%=i%>" />
    <%
        }
        s.close();
    %>
</div>