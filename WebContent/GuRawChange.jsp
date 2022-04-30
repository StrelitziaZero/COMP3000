<!-- Interface for modify raw materials -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuSalesDB,gu.entity.ShopUser,gu.entity.GuRaw,java.util.List,java.util.Calendar,java.util.TimeZone" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page

String name=request.getParameter("name");
String total=request.getParameter("total");
String purdate=request.getParameter("purdate");
String exdate=request.getParameter("exdate");
String exdate1=request.getParameter("exdate1");
String exdate2=request.getParameter("exdate2");
String delete=request.getParameter("delete");

//use to Locate the information to be modified
String upid=request.getParameter("upid");
//use to update raw materials name
String upname=request.getParameter("upname");
//use to update raw materials total
String uptotal=request.getParameter("uptotal");
//use to update raw materials purchase date
String uppurdate=request.getParameter("uppurdate");

String uppurdate1=request.getParameter("uppurdate1");
String uppurdate2=request.getParameter("uppurdate2");
//use to update raw materials expire year
String upexdate=request.getParameter("upexdate");
//use to update raw materials expire month
String upexdate1=request.getParameter("upexdate1");
//use to update raw materials expire day
String upexdate2=request.getParameter("upexdate2");
String updelete=request.getParameter("updelete");





//LOGIN, Method for identifying user login status
ShopUser shopUser =(ShopUser) session.getAttribute("user");
if(shopUser==null&&session.getAttribute("user3")==null)
{
	%>
	<script>
	alert('Need login');
	</script>
	<% 
	response.sendRedirect("login2.jsp");
	return;
}

	if(delete!=null){
		GuRaw guSales3 = new GuSalesDB().deleteGuSales(delete);
	    delete=null;
	%>
	<script>
	alert('Delete Success');
	</script>
	<%
		}



	if(upid!=null&&upname!=null&&upname!=""&&upid!=""){
		GuRaw guSales5 = new GuSalesDB().updatename(upid,upname);
		upname=null;
	%>
	<script>
	alert('Name Pass');
	</script>
	<%
		}
	if(upid!=null&&uptotal!=null&&uptotal!=""&&upid!=""){
		GuRaw guSales6 = new GuSalesDB().updatetotal(upid,uptotal);
		uptotal=null;
	%>
	<script>
	alert('Total Pass');
	</script>
	<%
		}
	if(upid!=null&&uppurdate!=null&&uppurdate!=""&&upid!=""){
		GuRaw guSales7 = new GuSalesDB().updatepurdate(upid,uppurdate);
		uppurdate=null;
	%>
	<script>
	alert('Purchase date Pass');
	</script>
	<%
		}
	if(upid!=null&&upexdate!=null&&upexdate!=""&&upid!=""){
		GuRaw guSales8 = new GuSalesDB().updateexdate(upid,upexdate);
		upexdate=null;
	%>
	<script>
	alert('expiration year Pass');
	</script>
	<%
		}
	
	if(upid!=null&&upexdate1!=null&&upexdate1!=""&&upid!=""){
		GuRaw guSales9 = new GuSalesDB().updateexdate1(upid,upexdate1);
		upexdate1=null;
	%>
	<script>
	alert('expiration month Pass');
	</script>
	<%
		}
	
	if(upid!=null&&upexdate2!=null&&upexdate2!=""&&upid!=""){
		GuRaw guSales10 = new GuSalesDB().updateexdate2(upid,upexdate2);
		upexdate2=null;
	%>
	<script>
	alert('expiration day Pass');
	</script>
	<%
		}
	upid=upname=uptotal=uppurdate=upexdate=null;
	
	//Get current time information
	Calendar cal=Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	int day=cal.get(Calendar.DAY_OF_MONTH);
	year=year+1;
	month=month+1;
	day=day+1;

	    //Method and database statement for displaying information in database
	    GuSalesDB guSalesDB = new GuSalesDB();
	    String sql =  "  select ID,name,total,purdate,exdate,exdate1,exdate2 ,if(exdate<"+year+"&&exdate1<"+month+"&&exdate2<"+day+",'"+"Past Due"+"','"+"normal"+"') as exdate3 from sales";
	    //Set start page number and maximum page number
		int pageNo=1;
		int pageSize=15;
		//Concrete entity approach
		List<GuRaw> guSalesList = guSalesDB.searchGuSales(sql,pageNo,pageSize);
		out.println("<h2><font color=blue>Raw Materials</font></h2>");
	%>
	<div align="center">
<form action="GuRawPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Name</th>
<th>Total</th>
<th>Purchase Date</th>
<th>Expiration Year</th>
<th>Expiration Month</th>
<th>Expiration Days</th>
<th>Expiration State</th>
</tr>
<!--Loop through the information in the database  -->
<%
	for(GuRaw guSales : guSalesList )
 {
%>
<tr>

<!-- How to get the content -->
<td><%=guSales.getId() %></td>
<td><%=guSales.getName() %></td>
<td><%=guSales.getTotal()%></td>
<td><%=guSales.getPurdate() %></td>
<td><%=guSales.getExdate()%></td>
<td><%=guSales.getExdate1()%></td>
<td><%=guSales.getExdate2()%></td>
<td><%=guSales.getExdate3()%></td>

</tr>

<%} %>

</table>

</form>
<% out.println("<h3><font color=blue>Change</font></h3>");%>


<form action="GuRawChange.jsp" method="post" >
<table>
<!-- modify information input control for raw materials -->
<tr>
<td>Input the ID that you want to Change:</td>
<td> <input name="upid" type="number"/></td>
</tr>

<!-- modify raw materials name control -->
<tr>
<td>Name change to:  </td>
<td><input name="upname" /></td>
</tr>

<!-- modify raw materials total control -->
<tr>
<td>Total change to:  </td>
<td><input name="uptotal" type="number"/></td>
</tr>

<!-- modify raw materials purchase date control -->
<tr>
<td>purchase date change to: </td>
<td> <input name="uppurdate" /></td>
</tr>

<!-- modify raw materials expire year control -->
<tr>
<td>Expiration year update to:  </td>
<td><input name="upexdate" /></td>
</tr>

<!-- modify raw materials expire month control -->
<tr>
<td>Expiration month update to:  </td>
<td><input name="upexdate1" /></td>
</tr>

<!-- modify raw materials expire day control -->
<tr>
<td>Expiration day update to:  </td>
<td><input name="upexdate2" /></td>
</tr>

<tr>
 <td>
 <input type="submit" value="Change" /></td>
 </tr>
 </table>
 </form>
 <br/>

 <!--Page jump button  -->
<form action="GuRawPage.jsp" method="post" >
<input type="submit" value="Back" />
</form>
 <br/>

<form action="wkf.jsp" method="post" >
<input type="submit" value="MainPage" />
 </form>

</div>

<%@ include file="/common/footer.jsp" %> 