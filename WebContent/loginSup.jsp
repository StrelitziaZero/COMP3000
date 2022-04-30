<!-- super administrator login page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #6C6C6C"></body>
    
<%@ include file="/common/header.jsp" %>

<%
//Declare all variables used on this page
String username=request.getParameter("username");
String password=request.getParameter("password");

//Determine whether the input information is correct
if(username!=null&&password!=null)
{

		ShopUser shopUser = new ShopUserDao().getShopUser(username, password,"shop_usersup");
		if(shopUser!=null)
		{
			session.setAttribute("user3", shopUser);
			response.sendRedirect("wkf.jsp");
			return;
		}
		else{
			%>
			<script>
			alert('Error info');
			</script>
			<% 
		}
	
	
} 

	out.println("<h3><font color=red>Super Administrator</font></h3>");

%>

<form action="loginchose.jsp" method="post" >
<input type="submit" value="back to login" />
 </form>



 <!--Page jump button  -->
<div align="center">
<form action="loginSup.jsp" method="post">


<p align=center>SupAdmin Login</p>
<table align=center>



<!-- Control to enter account information -->
<tr>
<td>Username
</td>
<td><input name="username" style="width:240px" maxlength="11"/></td>
</tr>
<tr>
<td>Password
</td>
<td><input name="password" style="width:240px" maxlength="11" type="password"/></td>
</tr>

<tr> 
<td colspan="2"><input type="submit"  value="Login"/></td>
</tr>
</table>

</form>




</div>

<%@ include file="/common/footer.jsp" %> 