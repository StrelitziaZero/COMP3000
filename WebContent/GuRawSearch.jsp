<!-- search raw materials interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuSalesDB,gu.entity.ShopUser,gu.entity.GuRaw,java.util.List,java.util.Calendar,java.util.TimeZone" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String cc=request.getParameter("bb");
String bb=request.getParameter("aa");
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

//LOGIN
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
	

		GuSalesDB guSalesDB = new GuSalesDB();
		List<GuRaw> guSalesList = guSalesDB.searchchaGuSales(searchuser,cc,searchvalue,bb);
	
		//out.println(buyCartList.size());
		out.println("<h2><font color=blue>Search</font></h2>");
		

		
		

	%>	
<form action="GuRawSearch.jsp" method="post" >
<table>
<!-- Choice of the first condition -->
<tr>
<td>Select the field you  want to search with</td>
<td>
<select name="aa" id="aa" style="width:240px" >
<option value="name" >Name</option>
<option value="total" >Total</option>
<option value="purdate">Purchase date</option>
<option value="exdate">Expiration year</option>
<option value="exdate1">Expiration month</option>
<option value="exdate2">Expiration day</option>
</select></td></tr>
<!-- The information input control of the selection control -->
	<tr>
<td>Input the value that you want to search: <input name="searchuser"/></td>
</tr>


<tr>
<td>And select the another field you  want to search with</td>
<td>
<select name="bb" id="bb" style="width:240px" >
<option value="name" >Name</option>
<option value="total" >Total</option>
<option value="purdate">Purchase date</option>
<option value="exdate">Expiration year</option>
<option value="exdate1">Expiration month</option>
<option value="exdate2">Expiration day</option>
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
<form action="GuRawPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Name</th>
<th>Total</th>
<th>Purchase date</th>
<th>Expiration Year</th>
<th>Expiration Month</th>
<th>Expiration Days</th>
<th>Expiration State</th>
</tr>
<!--Loop through the information in the database  -->
<%
	for(GuRaw guSales : guSalesList )
 {
%>
<tr>


<td><%=guSales.getId() %></td>
<td><%=guSales.getName() %></td>
<td><%=guSales.getTotal()%></td>
<td><%=guSales.getPurdate() %></td>
<td><%=guSales.getExdate()%></td>
<td><%=guSales.getExdate1()%></td>
<td><%=guSales.getExdate2()%></td>
<td><%=guSales.getExdate3()%></td>

</tr>

<%} %>

</table>

</form>

 <!--Page jump button  -->
<tr>
<td>
<form action="GuRawPage.jsp" method="post" >
<input type="submit" value="Back"  style="width:300px;height:30%;font-size:16px"/>
</form>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<%@ include file="/common/footer.jsp" %> 