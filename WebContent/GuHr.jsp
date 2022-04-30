<!-- Jump interface for human resource management -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>
    
<%@ include file="/common/header.jsp" %>


<%
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
}%>


<div align="center">
	<h1><font color=blue>Human Resources</font></h1>
	<br/>
<h3><font color=blue>please choose the identity</font></h3>
<br/>

 <!--Page jump button  -->
<form action="GuPersonalPage.jsp" method="post" >
<input type="submit" value="Staff manage" style="width:300px;height:60px;font-size:16px"/>
</form>

<form action="GuArUserPage.jsp" method="post" >
<input type="submit" value="User manage" style="width:300px;height:60px;font-size:16px" />
</form>
<br/>

<form action="GuArAdminPage.jsp" method="post" >
<input type="submit" value="Administrator manage" style="width:300px;height:60px;font-size:16px" />
</form>
<br/>

<form action="GuCM.jsp" method="post" >
<input type="submit" value="My information" style="width:200px;height:40px;font-size:16px" />
</form>
<br/>

<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  />
</form>

</div>

<%@ include file="/common/footer.jsp" %> 