<!-- user login page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Entity method reference -->
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>
    
<%@ include file="/common/header.jsp" %>

<%
//Declare all variables used on this page

//Declare user name variable
String username=request.getParameter("username");
//Declare password variable
String password=request.getParameter("password");


//Determine whether the input information is correct
if(username!=null&&password!=null)
{
	    //Pass the user name and password entered by the user to confirm the user's identity
		ShopUser shopUser = new ShopUserDao().getShopUser(username, password,"shop_userr");
	    
	    //Verified
		if(shopUser!=null)
		{
			session.setAttribute("user2", shopUser);
			response.sendRedirect("wkf.jsp");
			return;
			
		}
	    //Verification failed
		else{
			%>
			<script>
			alert('Error info');
			
			</script>
			<% 
		}
	
	
	
} 

    //Output title line
	out.println("<h3><font color=blue>User Login</font></h3>");
%>

<!-- the button of back -->
<form action="loginchose.jsp" method="post" >
<input type="submit" value="back to login" />
 </form>


<!-- Logged in control panel -->
<div align="center">
<form action="login.jsp" method="post">


<p align=center>User Login</p>
<table align=center>



<!-- Control to enter account information -->
<tr>
<td>Username
</td>

<!-- Button to submit value -->
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
<form action="GuArPage.jsp" method="post" >
<input type="submit" value="Register"  />

</form>
</div>

<%@ include file="/common/footer.jsp" %> 