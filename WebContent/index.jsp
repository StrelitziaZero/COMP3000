<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hnd06.entity.Book,com.hnd06.dao.BookDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%
    BookDao bookDao = new BookDao();
	String sql = "select * from book";
	int pageNo=1;
	int pageSize=10;
	List<Book> bookList = bookDao.searchBook(sql,pageNo,pageSize);
	//out.println(bookList.size());
	out.println("<h3><font color=blue>Mainpage</font></h3>");
%>

<div class="container-fluid">
	<div class="row">

	<%
	for(Book book : bookList)
	{
	%>
		<div class="col-md-3">
		</p>
			<h4>
				<%=book.getBookName()%>
			</h4>
			<p>
		<p style="text-align:center;">
		<img style="width:200px" src="<%=book.getPic()%>" alt="NO Pic" >
	
			</p>
			<p>
				
			</p>
			<p>
				<a class="btn" href="book_read.jsp?id=<%=book.getId()%>">Details »</a>
				
			</p>

		</div> 
		<%
	}
		%>
	</div>
</div>




<%@ include file="/common/footer.jsp" %> 