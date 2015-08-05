<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="Controller.SearchProductManagement"%>

<%
Controller.SearchProductManagement spm=new SearchProductManagement();
List<DB.Stock> l=spm.searchStockAll(0, 0);
%>

<%
int i=0;
JSONObject json=new JSONObject();

for(DB.Stock st:l){
    i++;
    
    json.put("name"+i, st.getProductName());
    
    %>
            
    
<%
}
response.setContentType("application/json");
out.write(json.toString());
%>
   
