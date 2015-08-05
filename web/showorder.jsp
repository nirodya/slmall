<%@page import="java.util.Set"%>
<%@page import="org.hibernate.Session"%>
<%
int oid=Integer.parseInt(request.getParameter("oid"));
Session s=Connection.Connection.getSessionFactory().openSession();
DB.Orders loadedOrder=(DB.Orders)s.load(DB.Orders.class, oid);
System.out.println("awa");
%>
<table style="width: 80%;margin-left: auto;margin-right: auto;height: 80%">
    <tr>
        <td style="width: 20%">Customer Name:</td>
        <td style="width: 80%"><%= loadedOrder.getUser().getFname() %></td>
    </tr>
    <tr>
        <td style="width: 20%">Ordered Item:</td>
        <td style="width: 80%"><%
                                Set<DB.OrdersHasStock> ordersHasStocks = loadedOrder.getOrdersHasStocks();
                                for (DB.OrdersHasStock stockor : ordersHasStocks) {
                                    out.write(stockor.getStock().getProductName());
                                }
                                %></td>
    </tr>
    <tr>
        <td style="width: 20%">Payment Method:</td>
        <td style="width: 80%"><%= loadedOrder.getPaymanetmethod().getMethod() %></td>
    </tr>
    <tr>
        <td style="width: 20%">Customer Address:</td>
        <td style="width: 80%"><% String ad[]=loadedOrder.getAddress().split(" ");
            for(int i=0;i<ad.length;i++){
                out.write(ad[i]);
            }
        
        %></td>
    </tr>
    <%
    if(request.getSession().getAttribute("loguser")!=null){
        DB.User u=(DB.User)request.getSession().getAttribute("loguser");
        Set<DB.UserLogin> sul= u.getUserLogins();
        String urle=null;
        for(DB.UserLogin ul:sul){
            urle=ul.getUserRole().getRoleName();
        }
        if(loadedOrder.getStatus().intValue()==0){
         if (!urle.equals("admin")) {
             if(request.getParameter("type")==null){
            %>
    <tr>
        <td style="width: 20%"><a href="setOrderStatus?oid=<%= loadedOrder.getIdorders() %>"><button class="btn btn-material-deep-orange-A400">Set as Delivered</button></a></td>
        <td style="width: 80%"></td>
    </tr>
    <%
             }
        }
        }
    }
    %>
    
</table>
    <div class="modal-footer">
                            <button id="dismiss" class="btn btn-primary" data-dismiss="modal">Dismiss</button>
                            <script>
                                $('#dismiss').click(function (){
                                    $('#ordercontent').hide();
                                    $('#orderspinner').show();
                                });
                            </script>
                        </div>
    <% s.close(); %>