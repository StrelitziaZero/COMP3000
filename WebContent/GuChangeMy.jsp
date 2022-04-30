<!-- User information self-modification interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.entity.ShopUser,gu.database.ShopUserDao,gu.database.GuArDB,gu.entity.ShopUser,gu.entity.GuAr,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String username=request.getParameter("username");
String password=request.getParameter("password");
String names=request.getParameter("names");
String sex=request.getParameter("sex");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String delete=request.getParameter("delete");
String searchs=request.getParameter("searchs");

String upid=request.getParameter("upid");
String upusername=request.getParameter("upusername");
String uppassword=request.getParameter("uppassword");
String uppassword2=request.getParameter("uppassword2");
String upname=request.getParameter("upname");
String upsex=request.getParameter("aa");
String upaddress=request.getParameter("upaddress");
String upphone=request.getParameter("upphone");
//String abc=request.getParameter("bb");

String updelete=request.getParameter("updelete");
String abc="shop_userr";

//LOGIN, Method for identifying user login status
if(upusername!=null&&uppassword!=null)
{

		ShopUser shopUser = new ShopUserDao().getShopUser(upusername, uppassword2,abc);
		if(shopUser!=null)
		{
			//Update password, Determine if the database has the same user name
			
			if(upusername!=null&&uppassword!=null&&upusername!=""&&uppassword!=""){
				GuAr guAr3 = new GuArDB().cupdatepassword(upusername,uppassword,abc);
			    uppassword=null;
			    %>
				<script>
				alert('password change success');
				</script>
				<% 
			}
			 //update name
			if(upusername!=null&&upname!=null&&upusername!=""&&upname!=""){
				GuAr guAr4 = new GuArDB().cupdatename(upusername,upname,abc);
			    upname=null;
			    %>
				<script>
				alert('name change success');
				</script>
				<% 
			}
			
			if(upusername!=null&&upsex!=null&&upusername!=""&&upsex!=""){
				GuAr guAr5 = new GuArDB().cupdatesex(upusername,upsex,abc);
			    upsex=null;
			    %>
				<script>
				//alert('sex change success');
				</script>
				<% 
			}
			
			if(upusername!=null&&upaddress!=null&&upusername!=""&&upaddress!=""){
				GuAr guAr6 = new GuArDB().cupdateaddress(upusername,upaddress,abc);
			    upaddress=null;
			    %>
				<script>
				alert('address change success');
				</script>
				<% 
			}
			
			if(upusername!=null&&upphone!=null&&upusername!=""&&upphone!=""){
				GuAr guAr7 = new GuArDB().cupdatephone(upusername,upphone,abc);
			    upphone=null;
			    %>
				<script>
				alert('phone change success');
				</script>
				<% 
			}
			//return;
			
		}
		else{
			%>
			<script>
			alert('Error info');
			
			</script>
			<% 
		}
} 

//Method and database statement for displaying information in database
GuArDB guArDB = new GuArDB();
List<GuAr> guArList = guArDB.searchmy(upusername,"shop_userr");

//Determine if the database has the same user name
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

	
	

	
	
	

	     
		//out.println(buyCartList.size());
		out.println("<h2><font color=blue>User Imformation Manage</font></h2>");
		

		
		

	%>	

	<div align="center">
<form action="GuArPage.jsp" method="post" >
<!-- Header showing that you want to modify information -->
<table class="table" align="center">
<tr>
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
if(upusername!=null&&uppassword!=null)
{

		ShopUser shopUser = new ShopUserDao().getShopUser(upusername, uppassword2,abc);
		if(shopUser!=null)
		{
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

<%}}} %>

</table>

</form>







<% out.println("<h3><font color=blue>My Information</font></h3>");%>
<br/>
<% out.println("<h5><font color=purple>If you want to check your account information, please only enter the account name and password, and click Update.</font></h5>");%>

<form action="GuChangeMy.jsp" method="post" >
<table>



<!-- Control to modify information to the database -->
<tr>
<td>the Username that you want to change</td>
<td><input name="upusername" /></td>
</tr>

<tr>
<td>Old Password</td>
<td><input name="uppassword2" /></td>
</tr>

<tr>
<td>New Password</td>
<td><input name="uppassword" /></td>
</tr>

<tr>
<td>Update Your Name</td>
<td><input name="upname" /></td>
</tr>

<tr>
<td>Update Sex</td>
<td>
<select name="aa" id="aa" style="width:240px" >
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
<form action="GuCM.jsp" method="post" >
<input type="submit" value="Back to Change Choose"  style="width:300px;height:30%;font-size:16px"/>
</form>
<br/>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<%@ include file="/common/footer.jsp" %> 