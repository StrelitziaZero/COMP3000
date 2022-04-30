<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hnd06.entity.ShopUser,com.hnd06.dao.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>;
    
<%@ include file="/common/header.jsp" %>

<%

	String username=request.getParameter("username");
String password=request.getParameter("password");

if(username!=null&&password!=null)
{
	ShopUser shopUser = new ShopUserDao().getShopUser(username, password);
	if(shopUser!=null)
	{
		session.setAttribute("user", shopUser);
		response.sendRedirect("index.jsp");
		return;
	}
} 
	out.println("<h3><font color=blue>Login</font></h3>");






%>





<form action="login.jsp" method="post">


<p align=center>User Login</p>
<table align=center>

<tr>
<td>Username
</td>
<td><input name="username" /></td>
</tr>
<tr>
<td>Password
</td>
<td><input name="password" /></td>
</tr>
<tr> 
<td colspan="2"><input type="submit"  value="Login"/></td>
</tr>
</table>

</form>


<%@ include file="/common/footer.jsp" %> 