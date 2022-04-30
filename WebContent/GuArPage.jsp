<!-- user register interface -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="gu.database.GuArDB,gu.entity.ShopUser,gu.entity.GuAr,java.util.List" %>
<%@ include file="/common/header.jsp" %>
<body style="background-color: #97CBff">


<script>
if(document.getElementById("p1").length<=3){
	alert('too short!');
}
</script>

</body>
<%
//Declare all variables used on this page
String cc="shop_userr";
String username=request.getParameter("username");
String password=request.getParameter("password");
String names=request.getParameter("names");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String password2=request.getParameter("password2");
String password3=request.getParameter("password3");
String sex=request.getParameter("bb");
String pwd[]=request.getParameterValues("password");
String pwd2[]=request.getParameterValues("password3");


String upid=request.getParameter("upid");
String upname=request.getParameter("upname");
String uptotal=request.getParameter("uptotal");
String uppurdate=request.getParameter("uppurdate");
String upexdate=request.getParameter("upexdate");
String updelete=request.getParameter("updelete");
String abc="shop_userr";

//Determine if the database has the same user name
%>
<script>
var pwd3=document.getElementById("p1");
</script>
<% 


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
			GuAr guAr2 = new GuArDB().addGuAr(username,password,names,sex,address,phone,cc);
			username=password=names=sex=address=phone=null;
		    %>
			<script>
			alert('Register Success');
			</script>
			<% 
		}	
	}


		out.println("<h2><font color=blue>User Register</font></h2>");

	%>

	<div align="center">



<% out.println("<h3><font color=blue>User Register</font></h3>");%>

<!--The text box where the user enters the information-->
<form action="GuArPage.jsp" method="post" >
<table>



<tr>
<td>Username</td>
<td><input name="username" /></td>
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

</script>

<%@ include file="/common/footer.jsp" %> 