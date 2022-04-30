<!--Administrator information register interface  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuArDB,gu.entity.ShopUser,gu.entity.GuAr,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">



</body>
<%
//Declare all variables used on this page
String cc="shop_user";
String username=request.getParameter("username");
String password=request.getParameter("password");
String names=request.getParameter("names");
String sex=request.getParameter("bb");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String upid=request.getParameter("upid");
String upname=request.getParameter("upname");
String uptotal=request.getParameter("uptotal");
String uppurdate=request.getParameter("uppurdate");
String upexdate=request.getParameter("upexdate");
String updelete=request.getParameter("updelete");
String abc="shop_user";


//Determine if the database has the same user name
	if(username!=null&&password!=null&&names!=null&&sex!=null&&address!=null&&phone!=null&&username!=""&&password!=""&&names!=""&&sex!=""&&address!=""&&phone!=""){
		//The specific method of judgment
		String guAr11 = new GuArDB().pan2(username,password,names,sex,address,phone,abc);
		if(guAr11=="b"){
			 %>
				<script>
				alert('User name same!');
				</script>
				<% 
		}
		else{
			GuAr guAr2 = new GuArDB().addGuAr(username,password,names,sex,address,phone,cc);
			username=password=names=sex=address=phone=null;
		    %>
			<script>
			alert('Register Success');
			</script>
			<% 
		}	
	}

//Method for identifying user login status
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
	


		out.println("<h2><font color=blue>Admin Register</font></h2>");

	%>
	<div align="center">



<% out.println("<h3><font color=blue> Admin Register</font></h3>");%>

<form action="GuArAdmin.jsp" method="post" >
<table>


<!--The text box where the user enters the information-->
<tr>
<td>Username</td>
<td><input name="username" id="p3" onkeyup="check3()"/></td>
</tr>

<tr>
<td>Password</td>
<td><input name="password" id="p1" onkeyup="check()"/></td>
</tr>

<tr>
<td>Password again</td>
<td><input name="password3" id="p2" onkeyup="check()"/></td>
</tr>

<tr>
<td>Your Name</td>
<td><input name="names" /></td>
</tr>

<tr>
<td>Sex</td>
<td>
<select name="bb" id="bb" style="width:240px" >
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
<!-- Button to submit registration information -->
 <td>
 <input type="submit" value="Register" /></td>
 </tr>
 </table>
 </form>







<!--Page jump button  -->
<tr>
<td>
<form action="loginchose.jsp" method="post" >
<input type="submit" value="Back to login"  style="width:300px;height:30%;font-size:16px"/>
</form>
<br/>

<form action="wkf.jsp" method="post" >
<input type="submit" value="Go To MainPage"  style="width:300px;height:30%;font-size:16px"/>
 </form>
 </td>
</tr>
</div>

<!--RePassword-->
<div align="center" id="check_tip"></div>
<div align="center" id="check_tip2"></div>
<div align="center" id="check_tip3"></div>
<script type="text/javascript">

<!--RePassword-->
function check(){
	//var a=document.getElementById("p1");
	if(p1.value.length<5 || p2.value.length<5){
		check_tip2.innerHTML="<font color=red>Password Too Simple ! (Need more than 5 bytes)</font>";
	}
	else{
		check_tip2.innerHTML=null;
	}
	if(p1.value!=p2.value){
		check_tip.innerHTML="<font color=red>Password Not Same !</font>"
	}
	else{
		check_tip.innerHTML="<font color=green>Password Same</font>"
	}
}

function check3(){
	if(p3.value==""){
		check_tip3.innerHTML="<font color=red>Username is null</font>";
	}
	else{
		check_tip3.innerHTML=null;
	}	
}

</script>

<%@ include file="/common/footer.jsp" %> 