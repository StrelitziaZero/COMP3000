<!-- Interface for search dishes -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String bb=request.getParameter("aa");
String cc=request.getParameter("bb");
String username=request.getParameter("username");
String password=request.getParameter("password");
String names=request.getParameter("names");
String sex=request.getParameter("sex");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String delete=request.getParameter("delete");
String searchuser=request.getParameter("searchuser");
String searchevery=request.getParameter("searchevery");
String searchvalue=request.getParameter("searchvalue");

String upid=request.getParameter("upid");
String upusername=request.getParameter("upusername");
String uppassword=request.getParameter("uppassword");
String upname=request.getParameter("upname");
String upsex=request.getParameter("upsex");
String upaddress=request.getParameter("upaddress");
String upphone=request.getParameter("upphone");
String updelete=request.getParameter("updelete");
String abc="shop_user";

//Method and database statement for displaying information in database
		GuDishDB guDishDB = new GuDishDB();
		List<GuDish> guDishList = guDishDB.searchchaGuDish(searchuser,cc,searchvalue,bb);
	
		//out.println(buyCartList.size());
		out.println("<h2><font color=blue>Search</font></h2>");
		

		
		

	%>	
	<form action="GuWatch.jsp" method="post" >
<input type="submit" value="Back to Browser"  style="width:300px;height:30%;font-size:16px"/>
</form>
<form action="GuDishSearch.jsp" method="post" >
<table>

<!-- Choice of the first condition -->
<tr>
<td>Select the field you  want to search with</td>
<td>
<select name="aa" id="aa" style="width:240px" >
<option value="Dname">Dishes name</option>
<option value="price" }>Price</option>
<option value="Cname" }>Dining name</option>
<option value="Dtype">Type</option>
<option value="total">Total</option>
<option value="dtime">Dish Finish time</option>
</select></td></tr>
<!-- The information input control of the selection control -->
	<tr>
<td>Input the value that you want to search: <input name="searchuser"/></td>
</tr>


<tr>
<td>And select the another field you  want to search with</td>
<td>
<select name="bb" id="bb" style="width:240px" >
<option value="Dname">Dishes name</option>
<option value="price" }>Price</option>
<option value="Cname" }>Dining name</option>
<option value="Dtype">Type</option>
<option value="total">Total</option>
<option value="dtime">Dish Finish time</option>
</select></td></tr>
	<tr>
<td>The value of this field: <input name="searchvalue"/></td>
</tr>

<tr>
 <td>
 <input type="submit" value="Search" /></td>
 </tr>
 </table>
 </form>
 <br/>
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
<tr>
<td>
<form action="GuWatch2.jsp" method="post" >
<input type="submit" value="Back"  style="width:300px;height:30%;font-size:16px"/>
</form>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<%@ include file="/common/footer.jsp" %> 