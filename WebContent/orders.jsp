<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hnd06.entity.ShopUser,com.hnd06.dao.ShopUserDao,java.util.List" %>
<%@ page import="com.hnd06.entity.Orders,com.hnd06.entity.Book,com.hnd06.dao.OrdersDao,com.hnd06.dao.BookDao" %>

<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%


	ShopUser shopUser = (ShopUser)session.getAttribute("user");
	if(shopUser==null || shopUser.getId()==null) 
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	
	OrdersDao ordersDao = new OrdersDao();
	String sql = "select * from orders where userid="+shopUser.getId();
	int pageNo=1;
	int pageSize=10;
	List<Orders> ordersList = ordersDao.searchOrders(sql,pageNo,pageSize);
	out.println("<h3><font color=blue>Orders</font></h3>");
	
	 
	

%>



<%
    //out.println(ordersList.size());
%>

<div class="container-fluid" style="margin-top:20px">
	<div class="row">
	<div class="col-md-12">
	<form action="produce_order.jsp" method="post">
			<table align="center" class="table" style="width:auto" >
				<thead>
					<tr>
						<th>
							No.
						</th>
						<th>
							User
						</th>
						<th>
							Order Number
						</th>
						<th>
							Price
						</th>
						<th>
							Order Date
						</th>
						<th>
							Order Status
						</th>
						<th>
							Confirmation date
						</th>
					
						<th>
							Action
						</th>
					</tr>
				</thead>
				<tbody>
	<%
	int  count=1;
	if(ordersList!=null)
	for(Orders orders : ordersList)
	{
	%>
	
		<tr><td>
						<%=count++%>
						</td>
						<td>
							<%=orders.getShopUser()==null?"":orders.getShopUser().getUsername() %>
						</td>
						<td>
							<%=orders.getOrderid() %>
						</td>
						<td>
							<%=orders.getTotalPrice()%> 
						</td>
						<td>
							<%=orders.getSubmitTime()%> 
						</td>
						<td>
							<%=orders.getIsPayoff()%> 
						</td>
						<td> 
						</td>
						<td>
 <a href="orders_read.jsp?id=<%=orders.getId()%>" >Details</a>
						</td>
					</tr>
		 
		<%
	}
		%>
 
				</tbody>
			</table>
			</form>
		</div>
	</div>
</div>

	







<%@ include file="/common/footer.jsp" %> 