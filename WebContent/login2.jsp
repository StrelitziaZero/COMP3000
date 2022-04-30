<!-- Administrator login page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>
    
<%@ include file="/common/header.jsp" %>

<%
//Declare all variables used on this page
String username=request.getParameter("username");
String password=request.getParameter("password");

//Determine whether the input information is correct
if(username!=null&&password!=null)
{

		ShopUser shopUser = new ShopUserDao().getShopUser(username, password,"shop_user");
		if(shopUser!=null)
		{
			session.setAttribute("user", shopUser);
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

	out.println("<h3><font color=blue>Admin Login</font></h3>");

%>

<form action="loginchose.jsp" method="post" >
<input type="submit" value="back to login" />
 </form>



<div align="center">
<form action="login2.jsp" method="post">


<p align=center>Admin Login</p>
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

 <!--Page jump button  -->
<form action="GuArAdmin.jsp" method="post" >
<input type="submit" value="Register"  />
</form>

</div>

<%@ include file="/common/footer.jsp" %> 