<!-- Interface for viewing dish statistics -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.entity.GuChart,gu.database.GuChartDB,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">

</body>
<%
//Declare all variables used on this page
float a=300;

//LOGIN, Method for identifying user login status
//ShopUser shopUser =(ShopUser) session.getAttribute("user3");
//if(shopUser==null)
//{
//	%>
	<script>
//	alert('Need login');
//	</script>
	<% 
//	response.sendRedirect("loginSup.jsp");
//	return;
//}
    
//Method and database statement for displaying information in database
    GuChartDB mainpageDatabase = new GuChartDB();
		
	//sql word
	String sql = "select * from chart1";
		
	//Set start page number and maximum page number
	int pageNo=1;
	int pageSize=10;
	
	//Method for displaying information in database by entity
	List<GuChart> functionList = mainpageDatabase.searchChart(sql,pageNo,pageSize);%>
	
	</br>
	<div align="center"><%out.println("<h3><font color=blue>Comment Score</font></h3>");%>
</br>
<div class="container-fluid">
	<div>
	<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- Header showing that you want to check information -->
<th>Dishes ID</th>
<th>Dishes Name</th>
<th>Dishes Average Point</th>
<th>Point Bar</th>
</tr>

<!--Loop through the information in the database  -->
	<%
	for(GuChart function : functionList)
	{

	%>
	<tr>

	<td><%=function.getDishid()%></td>
    <td><%=function.getDname1()%></td>
    <td><%=function.getAvescore()%></td>
    <!-- Ways to visualize values -->
    <td><img src=" pic\b9.jpg"  style="width:<%=function.getAvescore()*100%>px;height:25px;"/></td>
    </tr>
		<%
	}
		%>
</table>
</form>

<!--Page jump button  -->
<form action="GuComChange.jsp" method="post" >
<input type="submit" value="Back"  style="width:300px;height:30%;font-size:16px"/>
</form><br/>
<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>


</div>
	</div>


</div> 


<%@ include file="/common/footer.jsp" %> 