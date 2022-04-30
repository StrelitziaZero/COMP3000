<!-- mainpage -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.ShopUser,gu.entity.Function,gu.database.MainpageDatabase,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">

</body>
<%
//Method and database statement for displaying information in database
    MainpageDatabase mainpageDatabase = new MainpageDatabase();
	String sql = "select * from function1";
	int pageNo=1;
	int pageSize=10;
	List<Function> functionList = mainpageDatabase.searchFunction(sql,pageNo,pageSize);
	//out.println(bookList.size());%>
	</br>
	<div align="center"><%out.println("<h3><font color=blue>Mainpage</font></h3>");%></div> 
</br>
<div class="container-fluid">
	<div class="row">
	<%
	//Traverse the photos and information in the output database
	for(Function function : functionList)
	{
	%>
		<div class="col-md-3">
		
			<h4>
				 <div align="center"> <%=function.getFunctionName()%></div>
			</h4>
			<p>
		<p style="text-align:center;">
		<img style="width:200px" src="<%=function.getPic()%>" alt="NO Pic" >
			</p>
			<p>
			</p>
		</div> 
		<%
	}
		%>
		
 <!--Page jump button  -->
 <div class="col-md-3">
  <form action="GuDish.jsp" method="post" >
 <input type="submit" value="Dishes" style="width:350px;height:30%;"/>
 </form> 
 </div>
  <div class="col-md-3">
 <form action="GuRawPage.jsp" method="post" >
 <input type="submit" value="Raw Materials Page" style="width:350px;height:30%;"/>
 </form></div>
  <div class="col-md-3">
 <form action="GuSalePage.jsp" method="post" >
 <input type="submit" value="Sales" style="width:350px;height:30%;"/>
 </form></div>
  <div class="col-md-3">
  <form action="GuHr.jsp" method="post" >
 <input type="submit" value="Human Resources" style="width:350px;height:30%;font-size:16px"/>
 </form>	</div>
</div>
	</div>





<%@ include file="/common/footer.jsp" %> 