<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.ManualDBSearch"%>
<%@page import="DB.Orders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.Ownership"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%
 HttpSession orhttpsess = request.getSession();
            Session orssess = Connection.Connection.getSessionFactory().openSession();

            DB.User orUser = (DB.User) orhttpsess.getAttribute("loguser");
            Criteria owcri = orssess.createCriteria(DB.Ownership.class);
            //orssess.refresh(owcri);
            owcri.add(Restrictions.eq("user", orUser));
            List<Ownership> owlist = owcri.list();
            ArrayList orar = new ArrayList();
            for (Ownership ow : owlist) {
                //out.write("0");
                ResultSet orrs= new ManualDBSearch().returnSearchResult("select * from orders where shops_idShops='"+ow.getShops().getIdShops()+"' and status='0'");
                while(orrs.next()){
                    orar.add(orrs.getString("idorders"));
                }

            }
             
                out.write(Integer.toString(orar.size()));
            

            orssess.close();
        
%>