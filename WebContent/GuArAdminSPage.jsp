<!--Administrator information search interface  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuArDB,gu.entity.ShopUser,gu.entity.GuAr,java.util.List" %>
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
//first select value
String searchevery=request.getParameter("searchevery");
//second select value
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

//Method for identifying user login status
ShopUser shopUser =(ShopUser) session.getAttribute("user3");
if(shopUser==null)
{
	%>
	<script>
	alert('Need login');
	</script>
	<% 
	response.sendRedirect("loginSup.jsp");
	return;
}

	

//Specific entity method for searching information
		GuArDB guArDB = new GuArDB();
		List<GuAr> guArList = guArDB.searchaGuAr(searchuser,cc,searchvalue,bb);
	
		//out.println(buyCartList.size());
		out.println("<h2><font color=blue>Search</font></h2>");
		

		
		

	%>	
	<!-- Cross-query control -->
<form action="GuArAdminSPage.jsp" method="post" >
<table>
<tr>
<!-- First Selected controls -->
<td>Select the field you  want to search with</td>
<td>
<select name="aa" id="aa" style="width:240px" >
<!-- Select username as the first filter -->
<option value="UserName" }>Username</option>  
<!-- Select password as the first filter -->
<option value="PassWord" }>Password</option>   
<!-- Select Names as the first filter -->
<option value="Names">Your Name</option>   
 <!-- Select sex as the first filter -->
<option value="Sex">Sex</option>  
 <!-- Select address as the first filter -->
<option value="Address">Address</option>
 <!-- Select phone as the first filter -->
<option value="Phone">Phone</option>
</select></td></tr>
	<tr>

	<tr>
	<!-- The information input control of the first selection control -->
<td>Input the value that you want to search: <input name="searchuser"/></td>
</tr>


<tr>
<td>And select the another field you  want to search with</td>
<td>
<select name="bb" id="bb" style="width:240px" >
<option value="UserName" }>Username</option>
<option value="PassWord" }>Password</option>
<option value="Names">Your Name</option>
<option value="Sex">Sex</option>
<option value="Address">Address</option>
<option value="Phone">Phone</option>
</select></td></tr>
	<tr>
<td>The value of this field: <input name="searchvalue"/></td>
</tr>

<tr>
 <td>
 <!-- Button to submit inquiry information -->
 <input type="submit" value="Search" /></td>
 </tr>
 </table>
 </form>
 <br/>
	<div align="center">
<form action="GuArPage.jsp" method="post" >
<table class="table" align="center">
<tr>

<!-- Header showing selection information -->
<th>ID</th>
<th>Username</th>
<th>Password</th>
<th>Your Name</th>
<th>Sex</th>
<th>Address</th>
<th>Phone</th>
</tr>

<!-- Loop through the qualified information in the database -->
<%
	for(GuAr guAr : guArList )
 {
%>
<tr>
<!-- Specific display method -->
<td><%=guAr.getId() %></td>
<td><%=guAr.getUsername() %></td>
<td><%=guAr.getPassword() %></td>
<td><%=guAr.getNames()%></td>
<td><%=guAr.getSex() %></td>
<td><%=guAr.getAddress()%></td>
<td><%=guAr.getPhone() %></td>


</tr>

<%} %>

</table>

</form>

<!--Page jump button  -->
<tr>
<td>
<form action="GuArAdminPage.jsp" method="post" >
<input type="submit" value="Back"  style="width:300px;height:30%;font-size:16px"/>
</form>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<%@ include file="/common/footer.jsp" %> 