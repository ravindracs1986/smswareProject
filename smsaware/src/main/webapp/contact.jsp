
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
<!-- <!-- <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'> -->
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
							<li class="active"><a href="contact.jsp"><span data-hover="Contact Us">Contact Us</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
	</div>
<!-- //header -->
<!-- banner1 -->
	<div class="bannerContact">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">Home</a><i>|</i></li>
				<li>Contact Us</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>Contact Us</h3>
			<p class="quia">how to find us</p>

			<div class="w3ls_map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3662.3374083882736!2d85.3219146145535!3d23.3760080847752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f4e1109d28b6b7%3A0xb7917a7d429894b3!2sTown+Hall!5e0!3m2!1sen!2sin!4v1484504712375" style="border:0"></iframe>
				
			</div>
			<div class="col-md-4 wthree_contact_left">
				<h4>Address</h4>
				<p>Town Hall,Ahirtoli, Ranchi
					<span>Jharkhand 834001,INDIA</span></p>
				<ul>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Free Phone :+ (123) 111 222 333</li>
					<li><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span> Fax :+ (123) 111 222 333</li>
					<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@smsaware.in">info@smsaware.in</a></li>
				</ul>
			</div>
			<div class="col-md-8 wthree_contact_left">
				<h4>Contact Form</h4>
				<form action="#" method="post">
					<div class="col-md-6 wthree_contact_left_grid">
						<input type="text" name="Name" value="Name*" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name*';}" required="">
						<input type="email" name="Email" value="Email*" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email*';}" required="">
					</div>
					<div class="col-md-6 wthree_contact_left_grid">
						<input type="text" name="Telephone" value="Telephone*" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Telephone*';}" required="">
						<input type="text" name="Subject" value="Subject*" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject*';}" required="">
					</div>
					<div class="clearfix"> </div>
					<textarea  name="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message...';}" required="">Message...</textarea>
					<input type="submit" value="Submit">
					<input type="reset" value="Clear">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //mail -->
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
				<h3>Twitter Posts</h3>
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
				<p>Smsaware © 2016 Privacy Policy Terms Of Use<a href="http://smsaware.in/">Smsaware</a></p>
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
<script type="text/javascript">

	 function goToURL(url) {
		 location.href = 'CommentRetrieveServlet.do';

		}
 </script>
</html>