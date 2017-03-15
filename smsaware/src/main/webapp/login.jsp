
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
<title>Smsaware | smsaware.in</title>
<link rel="icon" href="images/logo2.gif">
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.superfish.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.scripts.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- //js -->
<!-- <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> -->
<style type="text/css">
form.forgotClass input[type=text].phone:focus, select:focus {
	border-color: #DC143C !important;
}

form.forgotClass input[type=email].email:focus, select:focus {
	border-color: #DC143C !important;
}

form.loginClass input[type=text].username:focus, select:focus {
	border-color: #DC143C !important;
}

form.loginClass input[type=password].password:focus, select:focus {
	border-color: #DC143C !important;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: 179px auto;
	padding: 0;
	border: 1px solid #888;
	width: 43%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.close1 {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal1-header {
	padding: 2px 16px;
	background-color: #ff9900;
	color: white;
}

.modal-body {
	padding: 2px 77px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal1-footer {
	padding: 2px 16px;
	background-color: #ff9900;
	color: white;
	text-align: right;
}
</style>
</head>

<body>
	<%
		String resultValue = (String) request.getAttribute("result");
		//out.print("resultValue==>:"+resultValue);
	%>

	<c:set var="url" value="<%=request.getRequestURL()%>" scope="request"></c:set>

	<input type="hidden" name="reslt" id="reslt" value="${result}" />
	<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3l_header_left">
				<ul>
					<li><span class="glyphicon glyphicon-earphone"
						aria-hidden="true"></span>+ (123) 111 222 333</li>
					<li><span class="glyphicon glyphicon-envelope"
						aria-hidden="true"></span><a href="mailto:info@smsaware.in">info@smsaware.in</a></li>
				</ul>
			</div>
			<div id="example2">
				<div class="wrapper2">
					<div class="content-wrapper2">
						<div class="search-button2">
							<span></span>
						</div>
						<div class="search-box2">
							<form action="#" method="post">
								<input type="text" name="Search" placeholder="Search Here..."
									required=""> <input type="submit" value="Send">
								<img src="images/close.png" alt=" " />
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="w3l_header_right">
				<ul>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>log in</a></li>
					<li><a href="sign-up.jsp"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>sign
							up</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
			<script type="text/javascript" src="js/demo.js"></script>
		</div>
	</div>
	<div class="logo_nav">
		<div class="container">
			<nav class="navbar navbar-default"> <!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="logo">

					<h1>
						<a class="navbar-brand" href="index.jsp">Sms<span>a</span>ware
						</a>
					</h1>
				</div>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse nav-wil"
				id="bs-example-navbar-collapse-1">
				<nav class="link-effect-2" id="link-effect-2">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp"><span data-hover="Home">Home</span></a></li>
					<li><a href="services.jsp"><span data-hover="Services">Services</span></a></li>
					<li><a href="about.jsp"><span data-hover="About">About</span></a></li>
					<li><a href="clients.jsp"><span data-hover="Clients">Clients</span></a></li>
					<li><a href="contact.jsp"><span data-hover="Contact Us">Contact
								Us</span></a></li>
				</ul>
				</nav>
			</div>
			<!-- /.navbar-collapse --> </nav>
		</div>
	</div>
	<!-- //header -->
	<!-- banner1 -->
	<div class="bannerLogin">
		<div class="container"></div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">Home</a><i>|</i></li>
				<li>Login Page</li>
			</ul>
		</div>
	</div>
	<!-- //banner1 -->

	<!-- login -->
	<div class="login">
		<div class="container commonClass" id="loginDiv">
			<h6>Login</h6>
			<h3>
				Welcome to our Smsaware.Please enter your <a href="login.jsp">Login</a>
				details to login here. Or <a href="sign-up.jsp"> Register</a> here.
			</h3>
			<h3>
				<div class="message" id="message" style="color: #DC143C">${loginErrorMessage}</div>
			</h3>
			<form name="loginForm" method="post" action="LoginServlet.do"
				id="login-form" class="loginClass" onsubmit="return(regvalidate())">
				<input type="text" name="username" id="username" class="username"
					placeholder="Email or Phone"> <input type="password"
					name="password" id="password" class="password"
					placeholder="Password">
				<div class="remember">
					<div class="w3agile_checkbox1">
						<label class="checkbox"><input type="checkbox"
							name="Checkbox" checked=""><i> </i>Remember me</label>
					</div>
					<div class="w3agile_forgot">
						<h4>
							<a href="javascript:showonlyone('forgotDiv');">Forgot
								Password?</a>
						</h4>
					</div>
					<div class="clearfix"></div>
				</div>
				<input type="submit" value="Login">
			</form>
			<div class="agileits_social">
				<h5>
					Login with your <a href="#">Facebook</a> or <a href="#">Twitter</a>
				</h5>
				<a href="#" class="face">Facebook</a> <a href="#" class="twitt">Twitter</a>
				<div class="clearfix"></div>
			</div>
			<div class="agile_back_home">
				<a href="index.jsp">back to home</a>
			</div>
		</div>

		<div class="container commonClass" id="forgotDiv"
			style="display: none;">
			<h6 style="font-size: 1.5em;">Forgot Password</h6>
			<h3>
				Welcome to our Smsaware.Please enter your <a href="login.jsp">Login</a>
				details to recover password. Or <a href="sign-up.jsp"> Register</a>
				here.
			</h3>
			<h3>
				<div class="message1" id="message1" style="color: #DC143C"></div>
			</h3>
			<form name="forgotForm" method="post"
				action="ForgotPasswordServlet.do" id="login-form"
				class="forgotClass" onsubmit="return(forgotvalidate())">
				<input type="text" name="phone" id="phone" class="phone"
					placeholder="Phone"> <input type="email" name="email"
					id="email" class="email" placeholder="Email"> <input
					type="submit" value="Send Password">
			</form>
			<div class="agileits_social">
				<h5>
					Login with your <a href="#">Facebook</a> or <a href="#">Twitter</a>
				</h5>
				<a href="#" class="face">Facebook</a> <a href="#" class="twitt">Twitter</a>
				<div class="clearfix"></div>
			</div>
			<div class="agile_back_home">
				<a href="index.jsp">back to home</a>
			</div>
		</div>



	</div>
	<!-- //login -->

	<!--popup starts -->


	<!-- The Modal -->
	<div id="myModal" class="modal" style='display: none;'>
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Password Sent to your email or Phone</h2>
			</div>
			<div class="modal-body">
				<p style="font-style: italic">Please find your password in Email
					and SMS</p>

			</div>
			<div class="modal-footer">
				<h3>SMSAWARE.IN</h3>
			</div>
		</div>

	</div>

	<div id="myModal1" class="modal1" style='display: none;'>
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal1-header">
				<span class="close1">&times;</span>
				<h2>Password Sent to your email or Phone</h2>
			</div>
			<div class="modal-body">
				<p style="color: red; font-style: italic">Given Phone or Email
					is not correct,Please try again</p>
			</div>
			<div class="modal1-footer">
				<h3>SMSAWARE.IN</h3>
			</div>
		</div>

	</div>



	<!--popup ends -->



	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3agile_footer_grid">
				<h3>About Us</h3>
				<p>We provide Transactional information solution through
					internet world.</p>
				<h2>
					<a href="index.jsp">Sms<span>A</span>ware
					</a>
				</h2>
			</div>
			<div class="col-md-2 w3agile_footer_grid">
				<h3>Links</h3>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="mail.jsp">Mail Us</a></li>
				</ul>
			</div>
			<div class="col-md-4 w3agile_footer_grid">
				<h3>Latest Smsaware Posts</h3>
				<!-- <ul class="w3agile_footer_grid_list">
					<li>Ut aut reiciendis voluptatibus maiores alias, ut aut reiciendis.
						<span>02 days ago</span></li>
					<li>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis 
						voluptatibus.<span>03 days ago</span></li>
				</ul> -->
			</div>
			<div class="col-md-3 w3agile_footer_grid">
				<h3>Instagram</h3>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta1.jpg" alt=" "
						onclick="goToURL('${url}'); return false;" class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta2.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta3.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta4.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta5.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta6.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="agileinfo_copy_right">
		<div class="container">
			<div class="agileinfo_copy_right_left">
				<p>
					Smsaware © 2016 Privacy Policy Terms Of Use<a
						href="http://smsaware.in/">Smsaware</a>
				</p>
			</div>
			<div class="agileinfo_copy_right_right">
				<ul class="social">
					<li><a class="social-linkedin" href="#"> <i></i>
							<div class="tooltip">
								<span>Facebook</span>
							</div>
					</a></li>
					<li><a class="social-twitter" href="#"> <i></i>
							<div class="tooltip">
								<span>Twitter</span>
							</div>
					</a></li>
					<li><a class="social-google" href="#"> <i></i>
							<div class="tooltip">
								<span>Google+</span>
							</div>
					</a></li>
					<li><a class="social-facebook" href="#"> <i></i>
							<div class="tooltip">
								<span>Pinterest</span>
							</div>
					</a></li>
					<li><a class="social-instagram" href="#"> <i></i>
							<div class="tooltip">
								<span>Instagram</span>
							</div>
					</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //footer -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
<script type="text/javascript">
	var popupResponse = document.getElementById("reslt").value;
	if (popupResponse == 'success') {
		var modal = document.getElementById('myModal');
		var btn = document.getElementById("myBtn");
		var span = document.getElementsByClassName("close")[0];
		modal.style.display = "block";
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

	} else if (popupResponse == 'failure') {
		var modal = document.getElementById('myModal1');
		var span = document.getElementsByClassName("close1")[0];
		modal.style.display = "block";
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	}

	function showonlyone(thechosenone) {
		$('.commonClass').each(function(index) {
			if ($(this).attr("id") == thechosenone) {
				$(this).show();

			} else {
				$(this).hide();
			}
		});
	}

	function regvalidate() {
		if ((document.loginForm.username.value == "")) {
			document.getElementById('message').innerHTML = " *Username should not be Empty";
			loginForm.username.focus();
			return (false);
		}
		if ((document.loginForm.password.value == "")) {
			document.getElementById('message').innerHTML = " *Password should not be Empty";
			loginForm.password.focus();
			return (false);
		}
	}
	function forgotvalidate() {
		if ((document.forgotForm.phone.value == "")) {
			document.getElementById('message1').innerHTML = " *Phone Number should not be Empty";
			forgotForm.phone.focus();
			return (false);
		}
		if ((document.forgotForm.email.value == "")) {
			document.getElementById('message1').innerHTML = " *Email should not be Empty";
			forgotForm.email.focus();
			return (false);
		}
	}
	function goToURL(url) {
		location.href = 'CommentRetrieveServlet.do';

	}
</script>
</html>