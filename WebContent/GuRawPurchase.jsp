<!-- Interface for adding raw materials -->

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
String delete=request.getParameter("delete");

String upid=request.getParameter("upid");
String upname=request.getParameter("upname");
String uptotal=request.getParameter("uptotal");
String uppurdate=request.getParameter("uppurdate");
String upexdate=request.getParameter("upexdate");
String updelete=request.getParameter("updelete");

//if(upid!=null&&upname!=null&&upaddress!=null&&uppurchase!=null&&upexdate!=null){
//	GuPersonal guPersonal4 = new GuPersonalDB().updateGuPersonal(upid,upname,upaddress,uppurchase,upexdate);
 //   upid=upname=upaddress=uppurchase=upexdate=null;
//}




//LOGIN
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

if(name!=null&&total!=null&&exdate!=null&&name!=""&&total!=""&&exdate!=""){
	GuRaw guSales2 = new GuSalesDB().addGuSales(name,total,exdate);
    name=total=exdate=null;
    %>
	<script>
	alert('Purchase Success');
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
	alert('expiration date Pass');
	</script>
	<% 
}
upid=upname=uptotal=uppurdate=upexdate=null;

//get the time information
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
	int pageNo=1;
	int pageSize=15;
	List<GuRaw> guSalesList = guSalesDB.searchGuSales(sql,pageNo,pageSize);
	//out.println(buyCartList.size());
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

<% out.println("<h3><font color=blue>Purchase</font></h3>");%>
<% out.println("<h5><font color=purple>About the [Expiration days].You only need to enter the number of days for the shelf life <br/>of the material,and the system will automatically calculate it as the specific date.</font></h5>");%>
<form action="GuRawPage.jsp" method="post" >
<table>

<!-- Add information input control for raw materials -->
<tr>
<td>NAME</td>
<td><input name="name" /></td>
</tr>

<tr>
<td>Total</td>
<td><input name="total" type="number"/></td>
</tr>


<tr>
<td>Expiration days</td>
<td><input name="exdate" type="number"/> days</td>
</tr>

<tr>
 <td>
 <input type="submit" value="Purchase" /></td>
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