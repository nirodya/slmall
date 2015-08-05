<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%
    HttpSession sess = request.getSession();
    int devsize=Integer.parseInt(request.getParameter("size"));
    DB.User inboxUser = (DB.User) sess.getAttribute("loguser");
    int recId = inboxUser.getIduser();
    Session s1=Connection.Connection.getSessionFactory().openSession();
            Criteria cr=s1.createCriteria(DB.Chat.class);
            cr.add(Restrictions.eq("recieverId", recId));
            cr.addOrder(Order.desc("date"));
            List<DB.Chat> inboxList=cr.list();
%>

    <%
            if(devsize<inboxList.size()){
            int sizoflist=inboxList.size()-1;
        DB.Chat c=inboxList.get(0);
    %>

    <tr clicked="no" class="msg-row-all" onclick="clickChangeColor(<%=c.getIdchat()%>)" onmouseover="overChangeColor(<%=c.getIdchat()%>)" onmouseout="leaveChangeColor(<%=c.getIdchat()%>)" id="msg-row<%=c.getIdchat()%>" style="cursor: pointer;background-color: rgb(255,255,255)">
        <td style="width: 10%"><%= c.getUser().getFname()%></td>
        <td style="width: 80%"><%= c.getMessage()%></td>
        <td style="width: 10%"><%= c.getDate().toString().split(" ")[0]%></td>
    </tr>

    <% }
    s1.close();
    %>
