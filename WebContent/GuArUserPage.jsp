<!--User information modification interface  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuArDB,gu.entity.ShopUser,gu.entity.GuAr,gu.database.ShopUserDao,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String username=request.getParameter("username");
String password=request.getParameter("password");
String names=request.getParameter("names");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String delete=request.getParameter("delete");
String searchs=request.getParameter("searchs");
String sex=request.getParameter("aa");
String upsex=request.getParameter("bb");
String upid=request.getParameter("upid");
String upusername=request.getParameter("upusername");
String uppassword=request.getParameter("uppassword");
String upname=request.getParameter("upname");
String upaddress=request.getParameter("upaddress");
String upphone=request.getParameter("upphone");
String cc=request.getParameter("bb");

String updelete=request.getParameter("updelete");
String abc="shop_userr";
String nowusername=request.getParameter("user");

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

//Add method, Determine if the database has the same user name
	if(username!=null&&password!=null&&names!=null&&sex!=null&&address!=null&&phone!=null&&username!=""&&password!=""&&names!=""&&sex!=""&&address!=""&&phone!=""){
		String guAr11 = new GuArDB().pan2(username,password,names,sex,address,phone,abc);
		if(guAr11=="b"){
			 %>
				<script>
				alert('User name same!');
				</script>
				<% 
		}
		else{
			GuAr guAr2 = new GuArDB().addGuAr(username,password,names,sex,address,phone,abc);
			username=password=names=sex=address=phone=null;
		    %>
			<script>
			alert('Register Success');
			</script>
			<% 
		}	
	}

	
	
	//Delete method
	if(delete!=null&&delete!=""){
		GuAr guAr1 = new GuArDB().deleteGuAr(delete);
	    delete=null;
	    %>
		<script>
		alert('Delete Success');
		</script>
		<% 
	}
	
	
	//Update username method,Determine if the database has the same user name
	if(upid!=null&&upusername!=null&&upid!=""&&upusername!=""){
		String guAr111 = new GuArDB().pan(upusername,abc,upid);
		if(guAr111=="b"){
			 %>
				<script>
				alert('User name same!');
				</script>
				<% 
		}
		else{
			GuAr guAr22 = new GuArDB().updateusername(upid,upusername);
		    upusername=null;
		    %>
			<script>
			alert('Username change success');
			</script>
			<% 
		}
		
	}
	// update password method
	if(upid!=null&&uppassword!=null&&upid!=""&&uppassword!=""){
		GuAr guAr3 = new GuArDB().updatepassword(upid,uppassword);
	    uppassword=null;
	    %>
		<script>
		alert('password change success');
		</script>
		<% 
	}
	
	if(upid!=null&&upname!=null&&upid!=""&&upname!=""){
		GuAr guAr4 = new GuArDB().updatename(upid,upname);
	    upname=null;
	    %>
		<script>
		alert('name change success');
		</script>
		<% 
	}
	
	if(upid!=null&&upsex!=null&&upid!=""&&upsex!=""){
		GuAr guAr5 = new GuArDB().updatesex(upid,upsex);
	    upsex=null;
	    %>
		<script>
		alert('sex change success');
		</script>
		<% 
	}
	
	if(upid!=null&&upaddress!=null&&upid!=""&&upaddress!=""){
		GuAr guAr6 = new GuArDB().updateaddress(upid,upaddress);
	    upaddress=null;
	    %>
		<script>
		alert('address change success');
		</script>
		<% 
	}
	
	if(upid!=null&&upphone!=null&&upid!=""&&upphone!=""){
		GuAr guAr7 = new GuArDB().updatephone(upid,upphone);
	    upphone=null;
	    %>
		<script>
		alert('phone change success');
		</script>
		<% 
	}
	
	//Method and database statement for displaying information in database
	    GuArDB guArDB = new GuArDB();
		String sql = "select * from shop_userr order by id desc";
			
		//Set start page number and maximum page number
		int pageNo=1;
		int pageSize=15;
		
		//Method for displaying information in database by entity
		List<GuAr> guArList = guArDB.searchGuAr(sql,pageNo,pageSize);

		out.println("<h2><font color=blue>User Manage</font></h2>");
		

		
		

	%>	

	<div align="center">
<form action="GuArPage.jsp" method="post" >
<table class="table" align="center">
<tr>
<!-- The header of the output list -->
<th>ID</th>
<th>Username</th>
<th>Password</th>
<th>Your Name</th>
<th>Sex</th>
<th>Address</th>
<th>Phone</th>
</tr>
<!--Loop through the information in the database  -->
<%
	for(GuAr guAr : guArList )
 {
%>
<tr>

<td><%=guAr.getId() %></td>
<td><%=guAr.getUsername() %></td>
<td><%=guAr.getPassword() %></td>
<td><%=guAr.getNames()%></td>
<td><%=guAr.getSex() %></td>
<td><%=guAr.getAddress()%></td>
<td><%=guAr.getPhone() %></td>


</tr>

<%} %>

</table>

</form>

<!-- Control to add information to the database -->
<% out.println("<h3><font color=blue>Add</font></h3>");%>

<form action="GuArUserPage.jsp" method="post" >
<table>


<tr>
<td>Username1</td>
<td><input name="username" /></td>
</tr>

<tr>
<td>Password</td>
<td><input name="password" /></td>
</tr>

<tr>
<td>Your Name</td>
<td><input name="names" /></td>
</tr>

<tr>
<td>Sex</td>
<td>
<select name="aa" id="aa" style="width:240px" >
<option value="Male" }>Male</option>
<option value="Female" }>Female</option>
</select></td></tr>


<tr>
<td>Address</td>
<td><input name="address" /></td>
</tr>
<tr>

<tr>
<td>Phone</td>
<td><input name="phone" maxlength="11"/></td>
</tr>
<tr>

 <td>
 <input type="submit" value="Add" /></td>
 </tr>
 </table>
 </form>

<!-- Control to delete information to the database -->
<% out.println("<h3><font color=blue>Delete</font></h3>");%>

<form action="GuArUserPage.jsp" method="post" >
<table>

<tr>
<td>Input the ID that you want to delete: <input name="delete" type="number"/></td>
</tr>
<tr>
 <td>
 <input type="submit" value="Delete" /></td>
 </tr>
 </table>
 </form>
 <br/>

<!-- Control to modify information to the database -->
<% out.println("<h3><font color=blue>Update</font></h3>");%>

<form action="GuArUserPage.jsp" method="post" >
<table>

<tr>
<td>The Id that you want to update</td>
<td><input name="upid" /></td>
</tr>

<tr>
<td>Update Username</td>
<td><input name="upusername" /></td>
</tr>

<tr>
<td>Update Password</td>
<td><input name="uppassword" /></td>
</tr>

<tr>
<td>Update Your Name</td>
<td><input name="upname" /></td>
</tr>

<tr>
<td>Update Sex</td>
<td>
<select name="bb" id="bb" style="width:240px" >
<option value="Male" }>Male</option>
<option value="Female" }>Female</option>
</select></td></tr>

<tr>
<td>Update Address</td>
<td><input name="upaddress" /></td>
</tr>
<tr>

<tr>
<td>Update Phone</td>
<td><input name="upphone" maxlength="11"/></td>
</tr>
<tr>

 <td>
 <input type="submit" value="Update" /></td>
 </tr>
 </table>
 </form>

<!--Page jump button  -->
<tr>
<td>
<form action="GuArUserSPage.jsp" method="post" >
<input type="submit" value="Search"  style="width:300px;height:30%;font-size:16px"/>
</form>
<br/>

<form action="GuHr.jsp" method="post" >
<input type="submit" value="Back to human resources"  style="width:200px;height:30%;font-size:16px"/>
</form>
<br/>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:150px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<%@ include file="/common/footer.jsp" %> 