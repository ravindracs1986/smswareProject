
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
<meta name="keywords" content="Truckage Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> -->
<style type="text/css">

	

form.register input[type=text].name:focus, select:focus{
    border-color: #DC143C !important;
}
form.register input[type=text].phone:focus, select:focus{
    border-color: #DC143C !important;
}
form.register input[type=text].email:focus, select:focus{
    border-color: #DC143C !important;
}
form.register input[type=password].password:focus, select:focus{
    border-color: #DC143C !important;
}
form.register input[type=password].Cpassword:focus, select:focus{
    border-color: #DC143C !important;
}
form.register input[type=checkbox].termCheckBox:focus, select:focus{
    border-color: #DC143C !important;
}
.login.RegiError {
   color: #DC143C;
	
}
</style>

</head>
	
<body>
<c:set var="url" value="<%=request.getRequestURL()%>" scope="request"></c:set>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3l_header_left"> 
				<ul>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+ (123) 111 222 333</li>
					<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@smsaware.in">info@smsaware.in</a></li>
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
								<input type="text" name="Search" placeholder="Search Here..." required="">
								<input type="submit" value="Send"> <img src="images/close.png" alt=" " />
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="w3l_header_right">
				<ul>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>log in</a></li>
					<li><a href="sign-up.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>sign up</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
			<script type="text/javascript" src="js/demo.js"></script>
		</div>
	</div>
	<div class="logo_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
					<div class="logo">
						<h1><a class="navbar-brand" href="index.jsp">Sms<span>a</span>ware</a></h1>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp"><span data-hover="Home">Home</span></a></li>
							<li><a href="services.jsp"><span data-hover="Services">Services</span></a></li>
							<li><a href="about.jsp"><span data-hover="About">About</span></a></li>
							<li><a href="clients.jsp"><span data-hover="Clients">Clients</span></a></li>
							<li><a href="contact.jsp"><span data-hover="Contact Us">Contact Us</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
	</div>
<!-- //header -->
<!-- banner1 -->
	<div class="bannerRegister">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">Home</a><i>|</i></li>
				<li>Sign Up Page</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- sign-up -->
	<div class="login">
		<div class="container">
			<h6>Sign Up</h6>
			<h3>Welcome to our Smsaware.Please enter your <a href="sign-up.jsp">Registration </a>details. Or have an account <a href="login.jsp">Login</a> here </h3>
				<h3><div class="message" id="message" style="color:#DC143C"></div></h3>
			<form name="registrationForm" method="post" action="" id="register-form" class="register" onsubmit="return(regvalidate())">
				<input type="text" name="name" id="name" class="name" placeholder="Name"/>
				<input type="text" name="phone" id="phone" class="phone" placeholder="Phone"/ maxlength="10" >
				<input type="text" name="email" id="email" class="email" placeholder="Email"  />
				<input type="password" name="password" id="password" class="password" placeholder="Password" size="4" maxlength="8"/>
				<input type="password" name="Cpassword" id="Cpassword" class="Cpassword" placeholder="Confirm Password" size="4" maxlength="8"/>
				<div class="remember">
					<label class="checkbox"><input type="checkbox" name="termCheckBox" class="termCheckBox" id="termCheckBox" checked=""><i> </i>I Accept Terms</label>
				</div>
				<input type="hidden" id="firstTime" name="firstTime" value="true"/>
				<input type="submit" value="Sign Up"/>
			</form>
			<div class="agileits_social">
				<h5>Sign Up with your <a href="#">Facebook</a> or <a href="#">Twitter</a></h5>
				<a href="#" class="face">Facebook</a>
				<a href="#" class="twitt">Twitter</a>
				<div class="clearfix"> </div>
			</div>
			<div class="agile_back_home">
				<a href="index.jsp">back to home</a>
			</div>
		</div>
	</div>
<!-- //sign-up -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3agile_footer_grid">
				<h3>About Us</h3>
				<p>We provide Transactional information solution through internet world.</p>
				<h2><a href="index.jsp">Sms<span>A</span>ware</a></h2>
			</div>
			<div class="col-md-2 w3agile_footer_grid">	
				<h3>Links</h3>
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="mail.jsp">Contact Us</a></li>
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
					<a href="learn-more.jsp"><img src="images/insta1.jpg" alt=" " onclick="goToURL('${url}'); return false;" class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta2.jpg" alt=" " class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta3.jpg" alt=" " class="img-responsive" onclick="goToURL('${url}'); return false;"/></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta4.jpg" alt=" " class="img-responsive" onclick="goToURL('${url}'); return false;"/></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta5.jpg" alt=" " class="img-responsive" onclick="goToURL('${url}'); return false;"/></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="learn-more.jsp"><img src="images/insta6.jpg" alt=" " class="img-responsive" onclick="goToURL('${url}'); return false;"/></a>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="agileinfo_copy_right">
		<div class="container">
			<div class="agileinfo_copy_right_left">
				<p>Smsaware © 2016 Privacy Policy Terms Of Use<a href="http://smsaware.in/"> Smsaware</a></p>
			</div>
			<div class="agileinfo_copy_right_right">
				<ul class="social">
					<li><a class="social-linkedin" href="#">
						<i></i>
						<div class="tooltip"><span>Facebook</span></div>
						</a></li>
					<li><a class="social-twitter" href="#">
						<i></i>
						<div class="tooltip"><span>Twitter</span></div>
						</a></li>
					<li><a class="social-google" href="#">
						<i></i>
						<div class="tooltip"><span>Google+</span></div>
						</a></li>
					<li><a class="social-facebook" href="#">
						<i></i>
						<div class="tooltip"><span>Pinterest</span></div>
						</a></li>
					<li><a class="social-instagram" href="#">
						<i></i>
						<div class="tooltip"><span>Instagram</span></div>
						</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script type="text/javascript">

      function regvalidate() {
				 var illegalChars = /[\W_]/; // allow only letters and numbers
				 var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
				 var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
				 var enoughRegex = new RegExp("(?=.{4,}).*", "g");
				 
				 if ((document.registrationForm.name.value == "")) {
						document.getElementById('message').innerHTML = " *Name should not be Empty";
						registrationForm.name.focus();
						return (false);
					}if ((document.registrationForm.phone.value == "")) {
						document.getElementById('message').innerHTML = " *Phone should not be Empty";
						registrationForm.phone.focus();
						return (false);
					}
				 if ((document.registrationForm.email.value == "")) {
						document.getElementById('message').innerHTML = " *Email should not be Empty";
						registrationForm.email.focus();
						return (false);
					} else if (document.registrationForm.email.value != "") {
						var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						if (!filter.test(document.registrationForm.email.value)) {
							document.getElementById('message').innerHTML = " *Email id not Correct";
							registrationForm.email.focus();
							return (false);
						}

					}
					if ((document.registrationForm.password.value == "")) {
						document.getElementById('message').innerHTML = " *Password should not be Empty";
						registrationForm.password.focus();
						return (false);
					}else if (false == enoughRegex.test(document.registrationForm.password.value)) {
						//strength.innerHTML = "More Characters";
						document.getElementById('message').innerHTML = " *Password lenght minimum should 4 to 8 Character";
						registrationForm.password.focus();
						return (false);
						} 
					if ((document.registrationForm.Cpassword.value == "")) {
						document.getElementById('message').innerHTML = " *Confirmed Password should not be Empty";
						registrationForm.Cpassword.focus();
						return (false);
					}
					if ((document.registrationForm.password.value != document.registrationForm.Cpassword.value)) {
						document.getElementById('message').innerHTML = " *Password and Confirmed password should be Same";
						registrationForm.Cpassword.focus();
						return (false);
					}
					if(!document.getElementById('termCheckBox').checked) {
						document.getElementById('message').innerHTML = " *Please checked Term and Conditions";
						return false; 
					
					}
					
				}




	 function goToURL(url) {
		 location.href = 'CommentRetrieveServlet.do';

		}
 </script>
</html>