<!--
author: smsaware
author URL: http://smsaware.in

-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page
	import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*,com.smsaware.model.*,org.apache.commons.codec.binary.Base64"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<html>
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
<!-- //js -->
<!-- load-more -->
<script>
	$(document).ready(function() {
		size_li = $("#myList li").size();
		x = 1;
		$('#myList li:lt(' + x + ')').show();
		$('#loadMore').click(function() {
			x = (x + 1 <= size_li) ? x + 1 : size_li;
			$('#myList li:lt(' + x + ')').show();
		});
		$('#showLess').click(function() {
			x = (x - 1 < 0) ? 1 : x - 1;
			$('#myList li').not(':lt(' + x + ')').hide();
		});
	});
</script>

<script>


var disqus_config = function () {
this.page.url = "http://smsaware.in/testimonials.html";  
this.page.identifier = "smsawareComments"; 
};

(function() {
var d = document, s = d.createElement('script');
s.src = '//smsaware-1.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

<!-- //load-more -->
<!-- <link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'> -->
</head>

<body>
	<!-- header -->
	
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
			<c:if test="${empty userName}">
			<div class="w3l_header_right">
				<ul>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>log in</a></li>
					<li><a href="sign-up.jsp"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span>sign
							up</a></li>
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
					<li class="active"><a href="index.jsp"><span
							data-hover="Home">Home</span></a></li>
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
	<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="w3ls_banner_info">
				<h2>SMSAWARE</h2>
				<p>Smsaware shines due to thermonuclear fusion releasing
					communication energy that traverses the star's interior and then
					radiates into outer space</p>
				<div class="wthree_more">
					<a href="learn-more.jsp" id="learnUrl"
						class="button--wayra button--border-thick button--text-upper button--size-s"
						onclick="goToURL('${url}'); return false;">Learn More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->

	<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="col-md-6 banner_bottom_left">
				<h3>internet sms solution provider</h3>
				<p>
					<i>tends to new sms world</i> To distinguish ourselves from our
					competitors, we concentrate on how we conduct business and treat
					people. Being polite and professional doesn't cost anything but it
					is hard work and it is emotionally tiring but is truly important in
					delivering a best in Transactional information solution
				</p>
				<div class="wthree_more wthree_more1">
					<a href="learn-more.jsp"
						class="button--wayra button--border-thick button--text-upper button--size-s"
						onclick="goToURL('${url}'); return false;">Read More</a>
				</div>
			</div>
			<div class="col-md-6 banner_bottom_right">
				<div class="wthree_banner_bottom_right_grids">
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i></i>
								<h3>SMS transmition facility</h3>
								<p>Communication via SMS</p>
							</div>
							<div class="mask">
								<img src="images/sms1.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="men"></i>
								<h3>service support</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adip.</p>
							</div>
							<div class="mask">
								<img src="images/sms2.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="wthree_banner_bottom_right_grids">
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="shipping"></i>
								<h3>sms charges free</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adip.</p>
							</div>
							<div class="mask">
								<img src="images/free_sms.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="clock"></i>
								<h3>100% delivery</h3>
								<p>delivery time of sms will not be second</p>
							</div>
							<div class="mask">
								<img src="images/images3.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- banner-bottom -->

	<!-- banner-bottom1 -->
	<div class="banner-bottom1">
		<div class="col-md-6 agile_banner_bottom1_left">
			<img src="images/freecalls1.jpg" alt=" " class="img-responsive" />
		</div>
		<div class="col-md-6 agile_banner_bottom1_right">
			<h3>internet sms solution provider, tends to new sms world</h3>
			<p>Imagination makes it possible to experience a whole world
				inside the mind. It gives the ability to look at any situation from
				a different point of view, and to mentally explore the past and the
				future Imagination is not limited only to seeing pictures in the
				mind. It includes all the five senses and the feelings. One can
				imagine a sound, taste, smell, a physical sensation or a feeling or
				emotion</p>
			<div class="details">
				<a href="learn-more.jsp" onclick="goToURL('${url}'); return false;">More
					Details</a>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- banner-bottom1 -->

	<!-- news -->
	<div class="news">
		<div class="container">
			<h3>news & blog</h3>
			<p class="quia"></p>
			<div class="agileits_news_grids">
				<div class="tab-1 resp-tab-content">
					<div class="load_more">
						<ul id="myList">
							<li>
								<div class="l_g">
									<div class="col-md-6 agileits_news_grid_left">
										<div class="agileits_news_grid_left_gridl">
											<p class="para1">
												14 <span>September-2016</span>
											</p>
											<p class="para1">
												<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
													href="#"><span>comments- 0</span></a>
											</p>
											<p>
												<i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i><a
													href="#"><span>view- 0</span></a>
											</p>
										</div>
										<div class="agileits_news_grid_left_gridr">
											<img src="images/smsnews.jpg" alt=" " class="img-responsive" />
											<h4>
												<a href="learn-more.jsp"
													onclick="goToURL('${url}'); return false;">government
													pensioners can track status via SMS, online</a>
											</h4>
											<p>Web Portal that will be a one stop destination
												accessable through mobile phones aims to lessen harassment
												for pensioners</p>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="col-md-6 agileits_news_grid_left">
										<div class="agileits_news_grid_left_gridl">
											<p class="para1">
												19<span>Mar-2016</span>
											</p>
											<p class="para1">
												<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
													href="#"><span>comments- 0</span></a>
											</p>
											<p>
												<i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i><a
													href="#"><span>view- 0</span></a>
											</p>
										</div>
										<div class="agileits_news_grid_left_gridr">
											<img src="images/smsnews1.jpg" alt=" " class="img-responsive" />
											<h4>
												<a href="learn-more.jsp"
													onclick="goToURL('${url}'); return false;">Railway
													passengers to soon receive SMS on ticket status</a>
											</h4>
											<p>As part of its 'go green' initiative, the Southern
												railways would do away with the practice of pasting
												reservation charts on train coaches and instead send SMS
												alerts to passengers regarding the reservation status of
												their tickets.</p>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
						</ul>
						<div id="loadMore">Load more</div>
						<div id="showLess">Show less</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //news -->
	<!-- testimonials -->
	<div class="testimonials">
		<div class="container">
			<div id="disqus_thread"></div>
       <div class="smsawareComments"></div>
		</div>
	</div>
	<!-- //testimonials -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3agile_footer_grid">
				<h3>About Us</h3>
				<p>We provide Transactional information solution through
					internet world.</p>
				<h2>
					<a href="index.jsp">sms<span>A</span>ware
					</a>
				</h2>
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
					<a href="learn-more.jsp"><img src="images/insta1.jpg" alt=" "
						class="img-responsive" onclick="goToURL('${url}'); return false;" /></a>
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
						href="http://smsaware.in/"> Smsaware</a>
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
	<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="js/bootstrap-checkbox-radio-switch.js"></script>
	<!--  Charts Plugin -->
	<script src="js/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="js/bootstrap-notify.js"></script>
	<!-- Light Bootstrap Table Core javascript and methods for profile purpose -->
	<script src="js/light-bootstrap-dashboard.js"></script>

</body>
<script type="text/javascript">

		function goToURL(url) {
		 location.href = 'CommentRetrieveServlet.do';
		
		}
 </script>

</html>