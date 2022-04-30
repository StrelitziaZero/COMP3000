<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuDishDB,gu.entity.ShopUser,gu.entity.GuDish,gu.database.GuComDB,gu.entity.GuCom,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%


//Integer id=Integer.parseInt(request.getParameter("id"));

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








if(idd!=null&&score!=null&&comm!=null&&idd!=""&&score!=""&&comm!=""){
	GuCom guCom2 = new GuComDB().addGuCom(idd,score,comm);
    idd=score=comm=null;
    %>
	<script>
	alert('Add Success');
	</script>
	<% 
}



//LOGIN
ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null&&session.getAttribute("user3")==null&&session.getAttribute("user2")==null)
{
	%>
	<script>
	alert('Need login');
	</script>
	<% 
	response.sendRedirect("login.jsp");
	return;
}
    GuDishDB guDishDB = new GuDishDB();
	String sql2 = "select * from dish  order by id desc";
	int pageNo2=1;
	int pageSize2=15;
	List<GuDish> guDishList = guDishDB.searchGuDish(sql2,pageNo2,pageSize2);

    GuComDB guComDB = new GuComDB();
	String sql = "select * from comment  order by id desc";
	int pageNo=1;
	int pageSize=10;
	List<GuCom> guComList = guComDB.searchGuCom(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
	
%>
<form action="GuWatch.jsp" method="post" >
<input type="submit" value="Back"  />
</form><br/>
<div align="center">


<div align="center">
<form action="GuDishPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<th>ID</th>
<th>Dishes Name</th>
<th>Dishes unit price(RMB)</th>
<th>Dining Name</th>
<th>Dishes Type</th>
<th>Dishes Total</th>
<th>Finish Time</th>
</tr>

<%out.println("<h2><font color=blue>Dishes</font></h2>");
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
<% out.println("<h3><font color=blue>Publish</font></h3>");%>

<form action="GuComAdd.jsp" method="post" >
<table>



<tr>
<td>Input the id you want to comment</td>
<td><input name="idd" /></td>
</tr>

<tr>
<td>Score</td>
<td><select name="aa">
<option value="1">★</option>
<option value="2">★★</option>
<option value="3">★★★</option>
<option value="4">★★★★</option>
<option value="5">★★★★★</option>
</select></td>
</tr>

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
 
 
 <% out.println("<h3><font color=blue>Change Comment(Admin)</font></h3>");%>
 <form action="GuComChange.jsp" method="post" >
<input type="submit" value="Change" />
</form>
 <br/>
 <form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage" />
</form>
 <br/>

</div>

<%@ include file="/common/footer.jsp" %> 