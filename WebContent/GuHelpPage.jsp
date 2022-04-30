<!-- Interface with help information -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuHelpDB,gu.entity.GuHelp,gu.database.GuSaleDB,gu.entity.ShopUser,gu.entity.GuSale,java.util.List,java.io.*" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">
<%

%>


</body>
<%





//Method and database statement for displaying information in database

    GuHelpDB guHelpDB = new GuHelpDB();
	String sql = "select * from ghelp  order by id desc";
	int pageNo=1;
	int pageSize=15;
	List<GuHelp> guHelpList = guHelpDB.searchGuHelp(sql,pageNo,pageSize);
	//out.println(buyCartList.size());%>
	<div align="center"><%
	out.println("<h2><font color=blue>Help</font></h2>");
%>
<form action="GuHelpPage.jsp" method="post" >
<table class="table" align="center">
<%
 for(GuHelp guHelp : guHelpList )
 {
 %>
			<h4>		 
			</h4>
			<p>
		<p style="text-align:center;">
		<!-- Output help information in the database -->
		<img style="width:1200px" align="center" src="<%=guHelp.getHelpinfo() %>" alt="NO Pic" >
		
			</p>
			<p>
			</p>
<%} %>

</table>
</form>

















 <!--Page jump button  -->
</br>
<form action="wkf.jsp" method="post" >
<div align="center"><input type="submit" value="MainPage"  style="width:300px;height:30%;font-size:16px"/></div>
</br>

 </form>

</div>

<%@ include file="/common/footer.jsp" %> 