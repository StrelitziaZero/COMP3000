<!-- modify sales information interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,gu.database.GuSaleDB,gu.entity.ShopUser,gu.entity.GuSale,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%




//Declare all variables used on this page
String total=request.getParameter("total");
//Used to locate the information to be calculated
String idd=request.getParameter("idd");
//use to add sales waste number
String wnumber=request.getParameter("wnumber");
String Dtype=request.getParameter("Dtype");
String delete1=request.getParameter("delete");

String upid=request.getParameter("upid");
String upDname=request.getParameter("upDname");
String upCname=request.getParameter("upCname");
String upDtype=request.getParameter("upDtype");
String uptotal=request.getParameter("uptotal");
String updelete=request.getParameter("updelete");



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

//ADD
if((idd!=null&&wnumber!=null)&&(idd!=""&&wnumber!="")){
	GuSale guSale2 = new GuSaleDB().addGuSale(idd,wnumber);
    idd=wnumber=null;
    %>
	<script>
	alert('Add Success');
	</script>
	<% 
}

//Delete
if(delete1!=null&&delete1!=""){
	GuSale guSale3 = new GuSaleDB().deleteGuSale(delete1);
    delete1=null;
    %>
	<script>
	alert('Delete Success');
	</script>
	<% 
}

    //Method and database statement for displaying information in database
    GuSaleDB guSaleDB = new GuSaleDB();
	String sql = "select * from sale  order by id desc";
	//Set start page number and maximum page number
	int pageNo=1;
	int pageSize=15;
	//Concrete entity approach
	List<GuSale> guSaleList = guSaleDB.searchGuSale(sql,pageNo,pageSize);
	//out.println(buyCartList.size());%>
	<div align="center"><%
	out.println("<h2><font color=blue>Sale</font></h2><h4><font color=purple>Automatic</font></h4>");
%>
<form action="GuSalePage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Dishes Name</th>
<th>Dining Name</th>
<th>Dishes Type</th>
<th>Dish Total</th>
<th>Waste Number</th>
<th>Waste Rate (%)</th>
<th>Warning</th>
<th>Dishes Finish Time</th>
</tr>
<!--Loop through the information in the database  -->
<%
 for(GuSale guSale : guSaleList )
 {
 %>
<tr>


<td><%=guSale.getId() %></td>
<td><%=guSale.getDName() %></td>
<td><%=guSale.getCName()%></td>
<td><%=guSale.getDType() %></td>
<td><%=guSale.getTotal()%></td>
<td><%=guSale.getWtotal()%></td>
<td><%=guSale.getWaste()%></td>
<td><%=guSale.getWarning()%></td>
<td><%=guSale.getDdtime()%></td>
</tr>

<%} %>

</table>
</form>
<%
    //Method and database statement for displaying information in database
    GuDishDB guDishDB = new GuDishDB();
	String sql1 = "select * from dish  order by id desc";
	//Set start page number and maximum page number
	int pageNo1=1;
	int pageSize1=15;
	//Concrete entity approach
	List<GuDish> guDishList = guDishDB.searchGuDish(sql1,pageNo1,pageSize1);
	out.println("<h2><font color=blue>Dish</font></h2>");
%>
<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<th>ID</th>
<th>Dishes Name</th>
<th>Dining Name</th>
<th>Dishes Type</th>
<th>Dishes Total</th>
<th>Dishes Finish Time</th>
</tr>
<%
 for(GuDish guDish : guDishList )
 {
 %>
<tr>
<td><%=guDish.getId() %></td>
<td><%=guDish.getDName() %></td>
<td><%=guDish.getCName()%></td>
<td><%=guDish.getDType() %></td>
<td><%=guDish.getTotal()%></td>
<td><%=guDish.getDtime()%></td>
</tr>
<%} %>
</table>
</form>


<% out.println("<h3><font color=blue>Delete</font></h3>");%>

<form action="GuSalePage.jsp" method="post" >
<table>

<!-- Conditions for locating the information to be processed -->
<tr>
<td>Input the ID that you want to delete: <input name="delete" type="number"/></td>
</tr>


<tr>
 <td>
 <input type="submit" value="Delete" /></td>
 </tr>
 </table>
 </form>
 <br/>


<% out.println("<h3><font color=blue>Records Generated</font></h3>");%>
<% out.println("<h5><font color=purple>Under this page, you do not need to enter any data manually,</br> you only need to observe the [Dishes] table, and then enter the ID number and corresponding waste amount you want to evaluate.</br> Eventually, the system will pass the [Dishes] table Evaluate reasonable values with the data you provided and present them to you.</font></h5>");%>
<form action="GuSalePage.jsp" method="post" >
<table>


<!-- Conditions for locating the information to be processed -->
<tr>
<td>ID that you want to calculate</td>
<td><input name="idd" /type="number"></td>
</tr>

<tr>
<td>Waste number</td>
<td><input name="wnumber" type="number"/></td>
</tr>


<tr>
 <td>
 <input type="submit" value="Calculate" /></td>
 </tr>
 </table>
 </form>

 <!--Page jump button  -->
</br>
<form action="GuDishPage.jsp" method="post" >
<div align="center"><input type="submit" value="Go To Dishes Page"  style="width:300px;height:30%;font-size:16px"/></div>
</br>
</form>
</br>
<form action="wkf.jsp" method="post" >
<div align="center"><input type="submit" value="MainPage"  style="width:300px;height:30%;font-size:16px"/></div>
</br>

 </form>

</div>

<%@ include file="/common/footer.jsp" %> 