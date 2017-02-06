<!--  
  author: smsaware
   author URL: http://smsaware.in
   
   -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page
	import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*,com.smsaware.model.*,org.apache.commons.codec.binary.Base64"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Smsaware | smsaware.in</title>
<link rel="icon" href="../images/logo2.gif">
<!-- for-mobile-apps -->
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<style type="text/css">
/* Form Module */
.form-module {
    position: relative;
    background: #ffffff;
    max-width: 324px;
    width: 100%;
    border-top: 3px solid #33b5e5;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    margin: 0 100px 10px 501px;
    height: 400px;
    background-color: #E6E6FA;
}

.form-module .toggle {
	cursor: pointer;
	position: absolute;
	top: -0;
	right: -0;
	background: #33b5e5;
	width: 30px;
	height: 30px;
	margin: -5px 0 0;
	color: #ffffff;
	font-size: 12px;
	line-height: 30px;
	text-align: center;
}

.form-module .toggle .tooltip {
	position: absolute;
	top: 5px;
	right: -65px;
	display: block;
	background: rgba(0, 0, 0, 0.6);
	width: auto;
	padding: 5px;
	font-size: 10px;
	line-height: 1;
	text-transform: uppercase;
}

.form-module .toggle .tooltip:before {
	content: '';
	position: absolute;
	top: 5px;
	left: -5px;
	display: block;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid rgba(0, 0, 0, 0.6);
}

.form-module .formDiv {
	display: none;
	padding: 40px;
}

.form-module .formDiv:nth-child(2) {
	display: block;
}

.form-module h2 {
	margin: 0 0 20px;
	color: #33b5e5;
	font-size: 18px;
	font-weight: 400;
	line-height: 1;
}

.form-module input {
	outline: none;
	display: block;
	width: 100%;
	border: 1px solid #d9d9d9;
	margin: 0 0 20px;
	padding: 10px 15px;
	box-sizing: border-box;
	font-wieght: 400;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.form-module input:focus {
	border: 1px solid #33b5e5;
	color: #333333;
}

.form-module button {
	cursor: pointer;
	background: #33b5e5;
	width: 100%;
	border: 0;
	padding: 10px 15px;
	color: #ffffff;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.form-module button:hover {
	background: #178ab4;
}

.form-module .cta {
	background: #f2f2f2;
	width: 100%;
	padding: 15px 40px;
	box-sizing: border-box;
	color: #666666;
	font-size: 12px;
	text-align: center;
}

.form-module .cta a {
	color: #333333;
	text-decoration: none;
}

p {
	margin: 0;
	color: blue;
}

div, p {
    margin-left: 0px;
}

span {
	color: red;
}

.adminAccount {
	padding: 4px 10px 9px 32px;
	height: 31px;
	margin: -47px 30px 12px 5px;
}

.adminAccount1 {
	padding: 4px 10px 9px 32px;
	height: 31px;
	margin: -47px 30px 12px 109px;
}
</style>
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
</head>

<body>

<%
String user1 = (String) session.getAttribute("user");

//out.print("user==>:"+user1);	

%>
<input type="hidden" id="userValue" value='&{user1}' />
<!-- Form Module-->

	<div class="header">
		<div class="container">
			<div class="">
				<div class="" style="text-align: center;">
					<h1 style="text-align: center;">Admin Login</h1>
				</div>
			</div>
			<div id="example2">
				<div class="wrapper2">
					<div class="content-wrapper2"></div>
				</div>
			</div>

			<div class="clearfix"></div>
			
		</div>
	</div>
	<div class="wrapper">
		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation-example-2">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>
				<% if (user1 ==null) { %> 
				
				<% } else { %>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown adminAccount"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> Welcome ${user1} <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">Account setting</a></li>
								<li><a href="#">Change Password</a></li>
							</ul></li>
						<li class="adminAccount1"><a href="AdminLogout.do" onClick="logout();">Log out </a>
						</li>
					</ul>
				</div>
				 <% } %>
			</div>
			</nav>

		</div>
	</div>
<% if (user1 ==null) { %> 
     
	 <div class="module form-module">
		<div>
			<i class="fa-times fa-pencil"></i>

		</div>
		<div class="formDiv">
			<h2>Admin Login</h2>
			<form name="adminLogin" method="post" action="AdminLoginServlet.do"
				id="adminLogin-form">
				<input type="text" placeholder="Username" name="adminUser"
					id="adminUser" /> <input type="password" placeholder="Password"
					name="adminPass" id="adminPass" />
				<button name="Login" value="Login">Login</button>

			</form>
		</div>

	</div>

   <% } else { %>
  <div id="result" style="border-style: solid; border-color: #E6E6FA;">
		<h2 align="center">Comments Need to Approved</h2><br>
		<!-- comments response start-->
			<table border="1" cellpadding="5" cellspacing="5" align="center">
				<tr style="background-color:#33b5e5;">
				<th>CommentId</th>
				<th>Name</th>
				<th>Email</th>
				<th>Comment</th>
				<th>Date</th>
				<th>Publiser</th>
				</tr>
				<c:forEach items="${commentsList}" var="each">
				
				<c:if test="${not empty each}">
					<tr>
					<td>${each.commentsId}</td>
					<td>${each.username}</td>
					<td>${each.email}</td>
					<td>${each.comments}</td>
					<td>${each.commentDate}</td>
					
					<td><button type="button" value="approve">approve</button>
								<button type="button" value="reject">reject</button></td>
						</tr>
					</c:if>
					
				</c:forEach>
			</table> 
		
	</div>
	<div id="result" style="border-style: solid; border-color: #E6E6FA;">
		<h2 align="center">Replys Need to Approved</h2><br>
		
		<!-- comments response start-->
			<table border="1" cellpadding="5" cellspacing="5" align="center">
				<tr style="background-color:#33b5e5;">
				<th>replyId</th>
				<th>Name</th>
				<th>Email</th>
				<th>Comment</th>
				<th>Date</th>
				<th>Publiser</th>
				</tr> 
				<c:forEach items="${replyList}" var="reply">
				<c:if test="${not empty reply}">
					<tr>
					<td>${reply.replyId}</td>
					<td>${reply.username}</td>
					<td>${reply.email}</td>
					<td>${reply.comments}</td>
					<td>${reply.replyDate}</td>
					<td><button type="button" value="approve">approve</button>
								<button type="button" value="reject">reject</button></td>
						</tr>
					
					</c:if>
					
				</c:forEach>
			</table> 
		
	</div>
    <% } %>

	<div class="footer" style="padding: 6em 0;">
		<div class="container">
			<div class="w3agile_footer_grid">
				<h2>
					<a href="index.jsp">Sms<span>A</span>ware
					</a>
				</h2>
			</div>

		</div>
	</div>

</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script type="text/javascript">


$(function() {
  // Setup form validation on the #register-form element
    $("#adminLogin-form").validate({
    // Specify the validation rules
        rules: {
            adminUser: "required",
            adminPass: "required"
            
        },
        // Specify the validation error messages
        messages: {
            adminUser: "<span> Please enter User name</span>",
            adminPass: "<span>Please enter Password</span>"
            
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

  });
  
  function logout(){
	  var userObject=document.getElementById("userValue");
	 
  }

 </script>

</html>
