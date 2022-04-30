<!-- browser dishes page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuComDB,gu.entity.GuCom,gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,java.util.List" %>
<%@ include file="/common/header2.jsp" %>
<body style="background-color: pink">



</body>
<%




//Method and database statement for displaying information in database, dish list
    GuDishDB guDishDB = new GuDishDB();
	String sql = "select * from dish  order by id desc";
	int pageNo=1;
	int pageSize=99;
	List<GuDish> guDishList = guDishDB.searchGuDish(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
	 GuComDB guComDB = new GuComDB();
	String sql2 = "select * from comment  order by id desc";
	int pageNo2=1;
	int pageSize2=99;
	List<GuCom> guComList = guComDB.searchGuCom(sql2,pageNo2,pageSize2);
	
	
	
%>

</form><br/>
<div align="center">
<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Dishes Name</th>
<th>Dining Hall Name</th>
<th>Dishes Type</th>
<th>Dishes Total</th>
<th>Dishes Finish Time</th>
</tr>

<!--Loop through the information in the database  -->
<%out.println("<h2><font color=blue>Dish</font></h2>");
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



<%} 
%>

</table>
</form>


<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">

<br/>

<tr>
<th>ID</th>
<th>Dishes Name</th>
<th>Dishes Score</th>
<th>Dishes Comment</th>

</tr><br/>
<%
 for(GuCom guCom : guComList )
 {
 %>
<tr>


<td><%=guCom.getId() %></td>
<td><%=guCom.getName() %></td>
<td><%=guCom.getScore()%></td>
<td><%=guCom.getComm() %></td>


</tr>

<%} out.println("<h2><font color=blue>Comment</font></h2>");%>
</table>
</form>

 <!--Page jump button  -->
 <br/>
<form action="GuDishSearch.jsp" method="post" >
<input type="submit" value="Search Dishes" />
</form>
 <br/>
 
    <form action="GuChart.jsp" method="post" >
<input type="submit" value="Comment Statistics" />
</form>
 <br/>

 <br/>
<form action="GuComSearch.jsp" method="post" >
<input type="submit" value="Search Comment" />
</form>
 <br/>

<form action="GuComAdd.jsp" method="post" >
<input type="submit" value="Publish Comment" />
</form>
 <br/>
 <form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage" />
</form>
 <br/>

</div>

<%@ include file="/common/footer.jsp" %> 