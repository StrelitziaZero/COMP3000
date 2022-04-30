<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>


<div class="container-fluid" style="margin-top:30px">
	<div class="row">
<%

  String [] sno = request.getParameterValues("sno");
  for(String s:sno)
  {
	  System.out.println("s=---------"+s);
	  
  }


%>
</div>
</div>



<%@ include file="/common/footer.jsp" %> 