<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff"></body>
<%

String [] ids = request.getParameterValues("ids");

for(String id : ids)
{
	System.out.println(id);
}


%>






<%@ include file="/common/footer.jsp" %> 