<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hnd06.entity.Orders,com.hnd06.entity.AllOrder,com.hnd06.dao.OrdersDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	
    OrdersDao ordersDao = new OrdersDao(); 
	 
	Orders orders = ordersDao.getOrders(id);
	out.println("<h3><font color=blue>Order Details</font></h3>");
%>

<div class="container-fluid">
	<div class="row">
	<div class="col-md-6">
	<table class="table">
	<tr><th>Sculpture Name</th><th>Sculpture Price</th></tr>
	<%
	int  count=1;
	if(orders.getOrderList()!=null)
	for(AllOrder allOrder : orders.getOrderList())
	{
	%>
	<tr><td><%=allOrder.getBook().getBookName()%></td><td><%=allOrder.getAmount()%></td></tr>
	
	<%} %>
	</table>
	</div>
	<div class="col-md-6">
		<p>
				&nbsp;
			</p>
			<h4>
				My Order
			</h4>
		
			<p>
				Order Number：<%=orders.getOrderid()%>
			</p>
			<p>
				Order Date：<%=orders.getSubmitTime()%>
			</p>
			<p>
				Order Price：<%=orders.getTotalPrice()%>
			</p>
	
	
	</div>
	</div>
</div>




<%@ include file="/common/footer.jsp" %> 