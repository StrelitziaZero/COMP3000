<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gu.entity.Function,gu.database.MainpageDatabase,com.hnd06.entity.Book,com.hnd06.dao.BookDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%
    MainpageDatabase mainpageDatabase = new MainpageDatabase();
	String sql = "select * from function1";
	int pageNo=1;
	int pageSize=10;
	List<Function> functionList = mainpageDatabase.searchFunction(sql,pageNo,pageSize);
	//out.println(bookList.size());
	out.println("<h3><font color=blue>Mainpage</font></h3>");
%>

<div class="container-fluid">
	<div class="row">
	
	<%
	for(Function function : functionList)
	{
	%>
		<div class="col-md-3">
		</p>
			<h4>
				<%=function.getFunctionName()%>
			</h4>
			<p>
		<p style="text-align:center;">
		<img style="width:200px" src="<%=function.getPic()%>" alt="NO Pic" >
	
			</p>
			<p>
				
			</p>
			<p>
				<a class="btn" href="book_read.jsp?id=<%=function.getId()%>">Details »</a>
				
			</p>

		</div> 
		<%
	}
		%>
	</div>
</div>




<%@ include file="/common/footer.jsp" %> 