<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%
HttpSession httpsess=request.getSession();
if(httpsess.getAttribute("loguser")==null){
    httpsess.setAttribute("msg", "Please log in again");
    response.sendRedirect("login.jsp");
}else{
    DB.User us=(DB.User)httpsess.getAttribute("loguser");
    Controller.Search_Shop_management shm=new Controller.Search_Shop_management();
%>

                        <table>
                            <tr>
                                <td>Registered Shops :</td>
                                <td><select id="shopselect" name="shops">
                                        <%
                                        Set<DB.Ownership> owl=us.getOwnerships();
                                        for(DB.Ownership ow:owl){
                                        %>
                                        <option ><%=ow.getShops().getSname() %></option>
                                        <% } %>
                                        <option >Register New Shop</option>
                                    </select></td>
                            </tr>
                        </table>
                                        <input type="hidden" id="upuid" name="upuid" value="<%=us.getIduser() %>" />
                                        <table id="shopinfo" class="table table-striped">
                    <tr>
                        <th colspan="3">Shops Information</th>
                    </tr>
                    <%
                    for(DB.Ownership ow:owl){
                    %>
                    <tr>
                        <td>Shop Name:</td>
                        <td width="100px" id="first"><%=ow.getShops().getSname() %></td>
                    <input type="hidden" id="shpid" name="" value="<%=ow.getShops().getIdShops() %>" />
                        <td width="100px" id="second"><input type="text" id="sname" name="upfname" value="<%=ow.getShops().getSname() %>" /></td>
                        <td width="100px" id="command"><a>update</a></td>
                        <td width="100px" id="third"><input onclick="updateFname()" class="btn btn-primary" type="submit" value="Save" /></td>
                    </tr>
                    <tr>
                        <td>Shop Type:</td>
                        <td width="100px" id="first1"><%=ow.getShops().getShopType().getTypeName() %></td>
                        <td width="100px" id="second1"><input type="text" id="stype" name="upstype" value="<%=ow.getShops().getShopType().getTypeName() %>" /></td>
                        <td width="100px" id="command1"><a>update</a></td>
                        <td width="100px" id="third1"><input onclick="updateLname()" class="btn btn-primary" type="submit" value="Save" /></td>
                    </tr>
                    <% } %>
                </table>
                <table id="newshop" class="table table-striped">
                    <tr>
                        <td>Shop Name:</td>
                        <td><input type="text" name="sname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Shop Type:</td>
                        <td><select id="stypesave" name="stype">
                                <%
                                List<DB.ShopType> lst=shm.searchShopTypeAll();
                                for(DB.ShopType s:lst){
                                %>
                                <option><%=s.getTypeName() %></option>
                                <% } %>
                                <option>Other</option>
                            </select></td>
                            
                    </tr>
                    <tr id="styptextfield">
                        <td>Type Name:</td>
                        <td ><input type="text" name="otherstype" value="" /></td>
                    </tr>
                </table>
<% } %>     