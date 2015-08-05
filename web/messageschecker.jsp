<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.ManualDBSearch"%>
<%@page import="org.hibernate.FlushMode"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%
    
    HttpSession mehttpsess=request.getSession();



DB.User mesUser=(DB.User) mehttpsess.getAttribute("loguser");
//messess.refresh(mesUser);
ResultSet rs= new ManualDBSearch().returnSearchResult("select * from chat where reciever_id='"+mesUser.getIduser()+"' and status='0'");
int i=0;
while(rs.next()){
    i++;
}
out.write(Integer.toString(i));

%>