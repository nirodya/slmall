<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%
    int id = Integer.parseInt(request.getParameter("chatid"));
    Session s = Connection.Connection.getSessionFactory().openSession();
    Criteria c = s.createCriteria(DB.Chat.class);
    c.add(Restrictions.eq("idchat", id));
    DB.Chat ch = (DB.Chat) c.uniqueResult();
%>
<div style="width: 100%;">
    <h4 style="color: #0077d2;"><%=ch.getSubject()%></h4>
    <span style="color: #0077d2;">From : <%= ch.getUser().getFname()%></span><br>
    <span style="color: #0077d2;">On : <%= ch.getDate()%></span>
</div>
<hr>
<div style="height: 300px;width: 100%;overflow: auto;background-color: #ffffff;box-shadow: 1px 3px 4px 0px rgba(0, 0, 0, 0.15);border-radius: 5px;border: 1px solid #BBBBBB;">
    <p><%=ch.getMessage()%></p>
</div><br>
<div>
    <form method="post" action="SendMessage.jsp">
        <input name="page" type="hidden" value="Messages.jsp" />
        <input name="heading" type="hidden" value="Reply for customer" />
        <input name="uname" type="hidden" value="<%= ch.getUser().getIduser()%>" />
        <input class="btn btn-primary" type="submit" value="Reply" />
    </form>

</div>
<%
Transaction t=s.beginTransaction();
ch.setStatus(1);
s.update(ch);
t.commit();
s.close();%>
