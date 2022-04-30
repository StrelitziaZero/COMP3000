<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%





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
String updelete=request.getParameter("updelete");



//LOGIN
ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null)
{
	%>
	<script>
	alert('Need login');
	</script>
	<% 
	response.sendRedirect("login.jsp");
	return;
}

//ADD


//update
if(upid!=null&&upDname!=null&&upDname!=""&&upid!=""){
	GuDish guDish5 = new GuDishDB().updateDname(upid,upDname);
	upDname=null;
	%>
	<script>
	alert('Dishes Name Pass');
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
<th>ID</th>
<th>Dishes Name</th>
<th>Dining Name</th>
<th>Dishes Type</th>
<th>Dishes Total</th>
<th>Finish Time</th>
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


<form action="GuDishAdd.jsp" method="post" >
<input type="submit" value="Dish Add"  style="width:300px;height:30%;font-size:16px"/>
</form></br>
<form action="GuDishDelete.jsp" method="post" >
<input type="submit" value="Dish Delete"  style="width:300px;height:30%;font-size:16px"/>
</form></br>
<form action="GuDishUpdate.jsp" method="post" >
<input type="submit" value="Dish Update"  style="width:300px;height:30%;font-size:16px"/>
</form></br>
<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>

</div>

<%@ include file="/common/footer.jsp" %> 