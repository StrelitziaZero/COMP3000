<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.hnd06.entity.ShopUser,com.hnd06.entity.BuyCart,com.hnd06.dao.BuyCartDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%

ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null)
{
	response.sendRedirect("login.jsp");
	return;
}



    BuyCartDao buyCartDao = new BuyCartDao();
	String sql = "select * from buy_Cart where user_id="+shopUser.getId()+" order by id desc";
	int pageNo=1;
	int pageSize=10;
	List<BuyCart> buyCartList = buyCartDao.searchBuyCart(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
	out.println("<h3><font color=blue>Cart</font></h3>");
%>
<form action="orders_add.jsp" method="post" >
<table class="table" align="center">
<tr>
<th>Select</th>
<th>User</th>
<th>Sculpture Name</th>
<th>Sculpture Number</th>
</tr>

<%
	for(BuyCart buyCart : buyCartList)
	{
	%>
	<tr>
	<td>
	<input type="checkbox" name="ids" value="<%=buyCart.getId()%>" >
	
	</td>
	<td><%=buyCart.getShopUser().getUsername() %></td>
	<td><%=buyCart.getBook().getBookName() %></td>
	<td><%=buyCart.getBuyNumber()%></td>
	
	</tr>
	
	<%} %>

<tr>
	<td>
       <input type="submit" value="Generate order" />
	</td>
</tr>
</table>


</form>

<%@ include file="/common/footer.jsp" %> 