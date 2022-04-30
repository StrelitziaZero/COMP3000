<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hnd06.entity.Book,com.hnd06.dao.BookDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	
    BookDao bookDao = new BookDao(); 
	 
	Book book = bookDao.getBook(id);
%>

<div class="container-fluid">
	<div class="row">
	<div class="col-md-6">
	<p style="text-align:center;">
	<img style="width:200px" src="<%=book.getPic()%>" alt="No Pic" >
	</p>
	</div>
	<div class="col-md-6">
			<h4>
				<%=book.getBookName()%>
			</h4>
			<p>
				
			</p>
			<p>
				<%=book.getContent()%>
			</p>
			<p>
				Price($)：<%=book.getPrice()%>
			</p>
			<p>
				<a class="btn" href="buycart_add.jsp?id=<%=book.getId()%>">Add to cart»</a>
			</p>
	
	
	</div>
	</div>
</div>




<%@ include file="/common/footer.jsp" %> 