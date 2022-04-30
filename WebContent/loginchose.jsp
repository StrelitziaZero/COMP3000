<!-- the choose of login page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>
    
<%@ include file="/common/header.jsp" %>



 <!--Page jump button  -->
<div align="center">
	<h1><font color=blue>Welcome to Dining Hall System</font></h1>
	<br/>
<h3><font color=blue>please choose your identity</font></h3>
<br/>
<form action="login.jsp" method="post" >
<input type="submit" value="User" style="width:300px;height:60px;font-size:16px"/>
</form>

<form action="login2.jsp" method="post" >
<input type="submit" value="Administrator" style="width:300px;height:60px;font-size:16px" />
</form>
<br/>

<form action="loginSup.jsp" method="post" >
<input type="submit" value="Super Administrator" style="width:300px;height:60px;font-size:16px;border:#000000 4px solid" />
</form>
<br/>

<h3><font color=blue>No Account</font></h3>
<form action="GuWatch.jsp" method="post" >
<input type="submit" value="Tourists Mode"  />
</form>

</div>

<%@ include file="/common/footer.jsp" %> 