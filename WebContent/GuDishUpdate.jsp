<!-- Interface for modify dishes -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String price=request.getParameter("price");
String total=request.getParameter("total");
String Dname=request.getParameter("Dname");
String Cname=request.getParameter("Cname");
String Dtype=request.getParameter("Dtype");
String delete1=request.getParameter("delete");

String upid=request.getParameter("upid");
String upDname=request.getParameter("upDname");
String upCname=request.getParameter("upCname");
String upDtype=request.getParameter("upDtype");
String uptotal=request.getParameter("uptotal");
String upPrice=request.getParameter("upPrice");
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



//update method
if(upid!=null&&upDname!=null&&upDname!=""&&upid!=""){
	GuDish guDish5 = new GuDishDB().updateDname(upid,upDname);
	upDname=null;
	%>
	<script>
	alert('Dishes Name Pass');
	</script>
	<% 
}
if(upid!=null&&upPrice!=null&&upPrice!=""&&upid!=""){
	GuDish guDish55 = new GuDishDB().updatePrice(upid,upPrice);
	upDname=null;
	%>
	<script>
	alert('Dishes Price Pass');
	</script>
	<% 
}
if(upid!=null&&upCname!=null&&upCname!=""&&upid!=""){
	GuDish guDish6 = new GuDishDB().updateCname(upid,upCname);
	upCname=null;
	%>
	<script>
	alert('Dining name Pass');
	</script>
	<% 
}
if(upid!=null&&upDtype!=null&&upDtype!=""&&upid!=""){
	GuDish guDish7 = new GuDishDB().updateDtype(upid,upDtype);
	upDtype=null;
	%>
	<script>
	alert('Type Pass');
	</script>
	<% 
}
if(upid!=null&&uptotal!=null&&uptotal!=""&&upid!=""){
	GuDish guDish8 = new GuDishDB().updatetotal(upid,uptotal);
	uptotal=null;
	%>
	<script>
	alert('Total Pass');
	</script>
	<% 
}
upid=upDname=upCname=upDtype=uptotal=null;

//Delete
if(delete1!=null&&delete1!=""){
	GuDish guDish3 = new GuDishDB().deleteGuDish(delete1);
    delete1=null;
    %>
	<script>
	alert('Delete Success');
	</script>
	<% 
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
<div align="center">
<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Dishes Name</th>
<th>Dishes unit price(RMB)</th>
<th>Dining Name</th>
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
<% out.println("<h3><font color=blue>Modify</font></h3>");%>


<form action="GuDishUpdate.jsp" method="post" >
<table>
<!-- modify information input control for dishes -->
<tr>
<td>Input the ID that you want to update: </td>
<td><input name="upid" type="number"/></td>
</tr>

<tr>
<td>Dishes name change to:  </td>
<td><input name="upDname" /></td>
</tr>

<tr>
<td>Dishes price change to:  </td>
<td><input name="upPrice" /></td>
</tr>

<tr>
<td>Dining name change to: </td>
<td> <input name="upCname" /></td>
</tr>

<tr>
<td>Type change to:  </td>
<td><input name="upDtype" /></td>
</tr>

<tr>
<td>Total change to: </td>
<td> <input name="uptotal" type="number"/></td>
</tr>

<tr>
 <td>
 <input type="submit" value="modify" /></td>
 </tr>
 </table>
 </form>
 <br/>

 <!--Page jump button  -->
<form action="GuDishPage.jsp" method="post" >
<input type="submit" value="Back" />
</form></br>
<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage" />
 </form>

</div>

<%@ include file="/common/footer.jsp" %> 