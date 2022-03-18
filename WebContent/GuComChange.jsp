<!-- modify comment interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,gu.database.GuComDB,gu.entity.GuCom,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%

//Declare all variables used on this page
String idd=request.getParameter("idd");
String comm=request.getParameter("comm");
String salary=request.getParameter("salary");
String delete=request.getParameter("delete");

String upid=request.getParameter("upid");
String upname=request.getParameter("upname");
String upaddress=request.getParameter("upaddress");
String upjob=request.getParameter("upjob");
String upsalary=request.getParameter("upsalary");
String updelete=request.getParameter("updelete");
String score=request.getParameter("aa");



//delete method
if(delete!=null){
	GuCom guCom3 = new GuComDB().deleteGuCom(delete);
    delete=null;
    %>
	<script>
	alert('Delete Success');
	</script>
	<% 
}


//add method
if(idd!=null&&score!=null&&comm!=null&&idd!=""&&score!=""&&comm!=""){
	GuCom guCom2 = new GuComDB().addGuCom(idd,score,comm);
    idd=score=comm=null;
    %>
	<script>
	alert('Add Success');
	</script>
	<% 
}



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

    //Method and database statement for displaying information in database, dish list
    GuDishDB guDishDB = new GuDishDB();
	String sql2 = "select * from dish  order by id desc";
	//Set start page number and maximum page number
	int pageNo2=1;
	int pageSize2=15;
	//Method for displaying information in database by entity
	List<GuDish> guDishList = guDishDB.searchGuDish(sql2,pageNo2,pageSize2);

    GuComDB guComDB = new GuComDB();
	String sql = "select * from comment  order by id desc";
	int pageNo=1;
	int pageSize=10;
	List<GuCom> guComList = guComDB.searchGuCom(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
	
%>
<form action="GuDish.jsp" method="post" >
<input type="submit" value="Back"  />
</form><br/>
<div align="center">


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

<%out.println("<h2><font color=blue>Dishes</font></h2>");
//Loop through the information in the database
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

<form action="GuPersonalPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<th>ID</th>
<th>Dishes Name</th>
<th>Dishes Score</th>
<th>Dishes Comment</th>
</tr>

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
<% out.println("<h3><font color=blue>Add</font></h3>");%>

<form action="GuComChange.jsp" method="post" >
<table>


<!-- Conditional input to target specific information -->
<tr>
<td>Input the id you want to comment</td>
<td><input name="idd" /></td>
</tr>

<!-- First Selected controls -->
<tr>
<td>Score</td>
<td><select name="aa">
<option id="1">1</option>
<option id="2">2</option>
<option id="3">3</option>
<option id="4">4</option>
<option id="5">5</option>
</select></td>
</tr>

<!-- The information input control of the selection control -->
<tr>
<td>Comment</td>
<td><input name="comm" /></td>
</tr>

<tr>
 <td>
 <input type="submit" value="Publish" /></td>
 </tr>
 </table>
 </form>
 
 

 
<% out.println("<h3><font color=blue>Delete</font></h3>");%>
<!-- The delete control of the selection control -->
<form action="GuComChange.jsp" method="post" >
<table>

<!-- Conditional input to target specific information -->
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
 
 <!--Page jump button  -->
 <br/>
<form action="GuDish.jsp" method="post" >
<input type="submit" value="Back" />
</form>
 <br/>
 
  <form action="GuComSearch.jsp" method="post" >
<input type="submit" value="Search" />
</form>
 <br/>
 
   <form action="GuChart.jsp" method="post" >
<input type="submit" value="Info Statistics" />
</form>
 <br/>
 
 <form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage" />
</form>
 <br/>

</div>

<%@ include file="/common/footer.jsp" %> 