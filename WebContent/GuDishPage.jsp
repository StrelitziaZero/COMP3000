<!-- Provides a jump interface for adding, deleting, and modifying functions of dishes -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String total=request.getParameter("total");
String Dname=request.getParameter("Dname");
String Cname=request.getParameter("Cname");
String Dtype=request.getParameter("Dtype");
String delete1=request.getParameter("delete");
String price=request.getParameter("price");

String upid=request.getParameter("upid");
String upDname=request.getParameter("upDname");
String upCname=request.getParameter("upCname");
String upDtype=request.getParameter("upDtype");
String uptotal=request.getParameter("uptotal");
String updelete=request.getParameter("updelete");


//LOGIN, Method for identifying user login status
ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null&&session.getAttribute("user3")==null)
{
	%>
	<script>
	alert('Need login');
	</script>
	<% 
	response.sendRedirect("login2.jsp");
	return;
}

//Method and database statement for displaying information in database
    GuDishDB guDishDB = new GuDishDB();
	String sql = "select * from dish  order by id desc";
	int pageNo=1;
	int pageSize=15;
	List<GuDish> guDishList = guDishDB.searchGuDish(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
	out.println("<h2><font color=blue>Dish</font></h2>");
%>
<form action="GuDish.jsp" method="post" >
<input type="submit" value="Back"  />
</form><br/>
<div align="center">
<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Dishes Name</th>
<th>Dishes unit price(RMB)</th>
<th>Dining Hall Name</th>
<th>Dishes Type</th>
<th>Dishes Total</th>
<th>Finish Time</th>
</tr>
<!--Loop through the information in the database  -->
<%
 for(GuDish guDish : guDishList )
 {
 %>
<tr>


<td><%=guDish.getId() %></td>
<td><%=guDish.getDName() %></td>
<td><%=guDish.getPrice()%></td>
<td><%=guDish.getCName()%></td>
<td><%=guDish.getDType() %></td>
<td><%=guDish.getTotal()%></td>
<td><%=guDish.getDtime()%></td>

</tr>

<%} %>
</table>
</form>

 <!--Page jump button  -->
<form action="GuDishAdd.jsp" method="post" >
<input type="submit" value="Dish Add"  style="width:300px;height:30%;font-size:16px"/>
</form><br/>
<form action="GuDishDelete.jsp" method="post" >
<input type="submit" value="Dish Delete"  style="width:300px;height:30%;font-size:16px"/>
</form><br/>
<form action="GuDishUpdate.jsp" method="post" >
<input type="submit" value="Dish Update"  style="width:300px;height:30%;font-size:16px"/>
</form><br/>
<form action="GuDishSearchAdmin.jsp" method="post" >
<input type="submit" value="Dish Search"  style="width:300px;height:30%;font-size:16px"/>
</form><br/>
<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>

</div>

<%@ include file="/common/footer.jsp" %> 