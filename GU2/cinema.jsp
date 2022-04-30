<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>


<div class="container-fluid" style="margin-top:30px">
	<div class="row">
	<form action="cinema_order.jsp" methon="post">
	<div class="col-md-6">
	
		<div class="checkbox" style="margin:auto;text-align:center">
			<%
			for(int i=0;i<10;i++)
			{	
			%>
			<input  name="sno"  type="checkbox" onclick="$('#result').html($('#result').html()+',<%=i%>');" value="<%=i%>">
			<%
			}
			%>
		</div>
		
	</div>
		<div class="col-md-6">
		
		<h2>Hello</h2>
		<div id="result">
		
		</div>
		<p>
		
		<input type="submit" class="btn btn-primary" value="Submit" />
		</p>
		
		</div>
		</form>
</div>
</div>



<%@ include file="/common/footer.jsp" %> 