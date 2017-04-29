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
</head>
	
<body>
	<%
String names =null;
boolean isLogin=false;
 User userBean = (User) request.getSession().getAttribute("user");
 // User userBean = (User) session.getAttribute("user");
	if (userBean == null)
	{
		//out.print("welcome to jsp");
	}else{
		isLogin=true;
	   names =userBean.getRegistration().getName();
	   Long userId=userBean.getRegistration().getId();
	   //out.print("user log in==>>");
	}
%>

<c:set var="userName" value="<%=names%>" scope="request"></c:set>
<c:set var="url" value="<%=request.getRequestURL()%>" scope="request"></c:set>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3l_header_left"> 
				<ul>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+ (91)9972792068</li>
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
			<c:if test="${empty userName}">
			<div class="w3l_header_right">
				<ul>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>log in</a></li>
					<li><a href="sign-up.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>sign up</a></li>
				</ul>
			</div>
			</c:if>
			
			<c:if test="${not empty userName}">
				<div class="w3l_header_right">
					<ul>
					    <li><a href="profile.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Profile</a></li>
						<li><a href="LogoutServlet.do"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Logout</a></li>
						
					</ul>
			   </div>
			</c:if>
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
							<li class="active"><a href="services.jsp"><span data-hover="Services">Services</span></a></li>
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
	<div class="banner1">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">Home</a><i>|</i></li>
				<li>Services</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- services -->
	<div class="services">
		<div class="container">
			<h3>Services</h3>
			<p class="quia">from smsaware</p>

			<div class="w3l_services_grids">
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">free sms service</a></h4>
						<p>We provide free of cost sms tsanmition service</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">customer blogings</a></h4>
						<p>user can have blogs with us and for all live users</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">sms chat services</a></h4>
						<p>user can have free sms chat with there belonging accounts.</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">Phonebook services</a></h4>
						<p>user can have save there contacts for quick sms send</p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="w3l_services_grids">
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">mobile recharge service</a></h4>
						<p>user can recharge there mobile through there accounts</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">Mobile number tracker</a></h4>
						<p>user can track the number locations</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-export" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">encrpted secure profile data service</a></h4>
						<p>all data get encrypted at run time for more secure of user details.</p>
					</div>
				</div>
				<div class="col-md-3 w3l_services_grid">
					<div class="w3l_services_grid1">
						<span class="glyphicon glyphicon-stats" aria-hidden="true"></span>
						<h4><a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">Free calls </a></h4>
						<p>user can call free of cost to any number in india </p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //services -->
<!-- services-bottom -->
	<!-- <div class="services-bottom">
		<div class="container">
			<h3>hic tenetur a sapiente delectus</h3>
			<div class="col-md-6 w3ls_services_bottom_left">
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-8 w3ls_services_bottom_left_gridl">
						<h4><a href="learn-more.jsp">ea voluptate velit esse quam</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>01.</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-8 w3ls_services_bottom_left_gridl">
						<h4><a href="learn-more.jsp">voluptas assumenda est voluptas</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>02.</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-8 w3ls_services_bottom_left_gridl">
						<h4><a href="learn-more.jsp">facilis est expedita distinctio</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>03.</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-6 w3ls_services_bottom_left">
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>04.</h4>
						</div>
					</div>
					<div class="col-xs-8 w3ls_services_bottom_left_gridl w3ls_services_bottom_left_gridl1">
						<h4><a href="learn-more.jsp">necessitatibus eveniet ut</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>05.</h4>
						</div>
					</div>
					<div class="col-xs-8 w3ls_services_bottom_left_gridl w3ls_services_bottom_left_gridl1">
						<h4><a href="learn-more.jsp">quia voluptas sit asper</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3ls_services_bottom_left_grid">
					<div class="col-xs-4 w3ls_services_bottom_left_gridr">
						<div class="w3ls_services_bottom_left_gridr1">
							<h4>06.</h4>
						</div>
					</div>
					<div class="col-xs-8 w3ls_services_bottom_left_gridl w3ls_services_bottom_left_gridl1">
						<h4><a href="learn-more.jsp">enim ipsam voluptatem quia</a></h4>
						<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div> -->
<!-- //services-bottom -->
<!-- special-services -->
	<!-- <div class="special-services">
		<div class="container">
			<h3>Special Services</h3>
			<p class="quia">from our truckage</p>
			<div class="wthree_special_services">
				<div class="col-md-4 wthree_special_service_left">
					<img src="images/9.jpg" alt=" " class="img-responsive" />
					<h4>Nemo enim ipsam voluptatem quia voluptas sit aspernatur</h4>
					<div class="wthree_more wthree_more2">
						<a href="learn-more.jsp" class="button--wayra button--border-thick button--text-upper button--size-s">Read More</a>
					</div>
				</div>
				<div class="col-md-4 wthree_special_service_left">
					<img src="images/10.jpg" alt=" " class="img-responsive" />
					<h4>Ducimus qui blanditiis praesentium voluptatum</h4>
					<div class="wthree_more wthree_more2">
						<a href="learn-more.jsp" class="button--wayra button--border-thick button--text-upper button--size-s">Read More</a>
					</div>
				</div>
				<div class="col-md-4 wthree_special_service_left">
					<img src="images/11.jpg" alt=" " class="img-responsive" />
					<h4>At vero eos et accusamus et iusto odio dignissimos</h4>
					<div class="wthree_more wthree_more2">
						<a href="learn-more.jsp" class="button--wayra button--border-thick button--text-upper button--size-s">Read More</a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div> -->
<!-- //special-services -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3agile_footer_grid">
				<h3>About Us</h3>
				<p>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis 
					voluptatibus.</p>
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