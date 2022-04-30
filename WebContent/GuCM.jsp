<!-- Selection interface for modifying personal information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,java.util.List" %>    
    <body style="background-color: #97CBff"></body>
    
<%@ include file="/common/header.jsp" %>




<div align="center">
	<h1><font color=blue>Human Resources</font></h1>
	<br/>
<h3><font color=blue>please choose the identity</font></h3>

<!--Page jump button  -->
<br/>
<form action="GuChangeInfo.jsp" method="post" >
<input type="submit" value="Admin Info Change" style="width:300px;height:60px;font-size:16px"/>
</form>



<form action="GuChangeMy.jsp" method="post" >
<input type="submit" value="User Info Change" style="width:300px;height:60px;font-size:16px" />
</form>
<br/>

<form action="GuHr.jsp" method="post" >
<input type="submit" value="Back to human resources"  style="width:300px;height:30px;font-size:16px"/>
</form>
<br/>


<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage"  />
</form>

</div>

<%@ include file="/common/footer.jsp" %> 