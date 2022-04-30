<!-- write off interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #7AFEC6"></body>
    
<%@ include file="/common/header.jsp" %>

<%
//Log out the currently logged in account
session.setAttribute("user", null);
session.setAttribute("user2", null);
session.setAttribute("user3", null);
%>



<div align="center">
	<h1><font color=blue>Write Off Success</font></h1>
	<br/>
<h3><font color=blue>Back to MainPage</font></h3>
<br/>

 <!--Page jump button  -->
<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  />
</form>

</div>

<%@ include file="/common/footer.jsp" %> 