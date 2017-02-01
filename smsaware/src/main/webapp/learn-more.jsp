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
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
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
						<li><a href="login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Logout</a></li>
						
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
	<div class="banner1">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">Home</a><i>|</i></li>
				<li>Smsaware Details</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- single -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 agile_single_left">
				<div class="agileits_recent_posts">
					<h3>Recent Posts</h3>
					<p> There is no post now </p>
					<!-- <div class="agileits_recent_posts_grid">
						<div class="agileits_recent_posts_gridl">
							<img src="images/6.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="agileits_recent_posts_gridr">
							<h4><a href="learn-more.jsp">velit esse quam nihil</a></h4>
							<ul>
								<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="#">2</a></li>
								<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>5:30 AM</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="agileits_recent_posts_grid">
						<div class="agileits_recent_posts_gridl">
							<img src="images/7.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="agileits_recent_posts_gridr">
							<h4><a href="learn-more.jsp">molestiae conseq</a></h4>
							<ul>
								<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="#">5</a></li>
								<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>6:00 AM</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="agileits_recent_posts_grid">
						<div class="agileits_recent_posts_gridl">
							<img src="images/8.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="agileits_recent_posts_gridr">
							<h4><a href="learn-more.jsp">dolorem eum fugiat</a></h4>
							<ul>
								<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="#">3</a></li>
								<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>6:30 AM</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="agileits_recent_posts_grid">
						<div class="agileits_recent_posts_gridl">
							<img src="images/9.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="agileits_recent_posts_gridr">
							<h4><a href="learn-more.jsp">quo voluptas nulla</a></h4>
							<ul>
								<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="#">7</a></li>
								<li><span class="glyphicon glyphicon-time" aria-hidden="true"></span>8:30 AM</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
					</div> -->
				</div>
				<div class="agileits_twitter_posts">
					<h3>Twitter Posts</h3>
					<p>Please post your Twitter's comments</p>
					<!-- <ul>
						<li><i>01 day ago</i><span>Non numquam <a href="#">http://sd.ds/13jklf#</a>
							eius modi tempora incidunt ut labore et
							<a href="#">http://sd.ds/1389kjklf#</a>quo nulla.</span></li>
						<li><i>02 day ago</i><span>Con numquam <a href="#">http://fd.uf/56hfg#</a>
							eius modi tempora incidunt ut labore et
							<a href="#">http://fd.uf/56hfg#</a>quo nulla.</span></li>
						<li><i>03 day ago</i><span>Qon numquam <a href="#">http://gf.ds/gre21#</a>
							eius modi tempora incidunt ut labore et
							<a href="#">http://gf.ds/gre21#</a>quo nulla.</span></li>
					</ul> -->
				</div>
				<div class="agileits_tags">
					<h3>Tags</h3>
					<ul>
						<li><a href="#">Internet</a></li>
						<li><a href="#">SMS</a></li>
						<li><a href="#">Products</a></li>
						<li><a href="#">Business</a></li>
						<li><a href="#">Profits</a></li>
						<li><a href="#">Charges</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-8 agile_single_right">
				<div class="w3_comments">
					<ul>
						<li><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>today Date</li>
						<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span><a href="#">Users</a></li>
						<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="#">0 Comments</a></li>
						<li><span class="glyphicon glyphicon-tags" aria-hidden="true"></span><a href="#">6 Tags</a></li>
					</ul>
				</div>
				<h3>We provide Transactional information solution on the other hand is an information which help to take a decision in the current transaction.
				</h3>

				<div class="w3_comments_bottom">
					<img src="images/insta4.jpg" alt=" " class="img-responsive" />
					<p><i>There are many solution get provided by the world but thing is homover have best ,smsaware provides unique feature in the unity world.
					</i>To distinguish ourselves from our competitors, we concentrate on how we conduct business and treat people. 
					Being polite and professional doesn't cost anything but it is hard work and it is emotionally tiring but is truly important in delivering a best in Transactional information solution.
					Attracting, selecting and supporting executive talent is vital. These important decisions need to be evidence based. We believe in providing thorough due diligence and comparative analysis to support those decisions</p>
				</div>
				<div class="agile_single_right_grids">
					<div class="col-md-6 agile_single_right_grid">
						<p>"Such transformations are surely hard but should work that achieves less be considered easy? Probably not.Those things which are not worthwhile
It's relegated precisely to those activities which achieve less.<span>Often referred to as a "co-op"a cooperative is a limited-liability
Cooperatives are typically classified.</span></p>
					</div>
					<div class="col-md-6 agile_single_right_grid">
						<img src="images/insta2.jpg" alt=" " class="img-responsive">
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="agile_single_right_grids_two">
					<div class="col-md-6 agile_single_right_grids_two_grid">
						<img src="images/insta3.jpg" alt=" " class="img-responsive">
						<p>sms less sms chat more</p>
					</div>
					<div class="col-md-6 agile_single_right_grids_two_grid">
						<h4>Directions and counted the stars observed
Business can refer to a particular organization expenditures resulting in a profit.</h4>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- comments response start-->
			<table border="1" cellpadding="5" cellspacing="5">
				<tr>
				<th>CommentId</th>
				<th>Name</th>
				<th>Comment</th>
				<th>Date</th>
				</tr> 
			<c:forEach var="comment" items="${comments}">
				<tr>
				<td>${comment.commentsId}</td>
				<td>${comment.username}</td>
				<td>${comment.comments}</td>
				<td>${comment.commentDate}</td>
				</tr>
				</c:forEach> 
			
			</table> 
			
			
			<%--For displaying Previous link except for the 1st page --%>
	<c:if test="${currentPage != 1}">
		<td><a href="CommentRetrieveServlet.do?page=${currentPage - 1}">Previous</a></td>
	</c:if>

	<%--For displaying Page numbers. 
	The when condition does not display a link for the current page--%>
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<td>${i}</td>
					</c:when>
					<c:otherwise>
						<td><a href="CommentRetrieveServlet.do?page=${i}">${i}</a></td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
	
	<%--For displaying Next link --%>
	<c:if test="${currentPage lt noOfPages}">
		<td><a href="CommentRetrieveServlet.do?page=${currentPage + 1}">Next</a></td>
	</c:if>

<div class="w3agile_comments">
				<h4>0 Comments</h4>
				<p>There is no Comments for desplay now,Lets starts</p>
				 <div class="comments-grid" style="border-style: solid;border-color:#E6E6FA;">
					<div class="w3agile_grid_left">
						<img src="images/new_logo.png" alt=" " class="img-responsive">
					</div>
					<div class="w3agile_grid_right">
						<h3><a href="#">Adam Smith</a></h3>
						<h5><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> On 25th July, 2016</h5>
						<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
						<div class="reply">
							<a href="#">Reply</a>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="comments-grid" style="border-style: solid;border-color:#E6E6FA;">
					<div class="w3agile_grid_left">
						<img src="images/new_logo.png" alt=" " class="img-responsive">
					</div>
					<div class="w3agile_grid_right">
						<h3><a href="#">James Rick</a></h3>
						<h5><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> On 26th July, 2016</h5>
						<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
						<div class="reply">
							<a href="#aClass">Reply</a>
							<!-- Reply contents starts-->
							<div class="replyDiv" id="aClass">
							<div class="agileinfo_write_reply" id="replyDiv" style="border-style: solid;border-color:#E6E6FA;">
								<form action="CommentServlet.do" method="post">
									<div class="col-md-6 agileinfo_write_reply_left">
										<input type="text" name="Name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
										<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
										<textarea  name="Comment" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Comment...';}" required="">Comment...</textarea>
									</div>
									<div class="clearfix"> </div>
									<input type="hidden" name="parentsId" value="${parentsId}"/>
									<input type="submit" value="Reply">
								</form>
							</div></div>
						<!-- Reply contents ends-->
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				
			</div>
			<!-- comments response start-->
			<div class="agileinfo_write_reply">
				<h3>Write a Reply or Comment</h3>
				<form action="CommentServlet.do" method="post">
					<div class="col-md-6 agileinfo_write_reply_left">
						<input type="text" name="Name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
						<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
						<input type="text" name="Website" value="Website" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Website';}" required="">
						<input type="text" name="Subject" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}" required="">
					</div>
					<div class="col-md-6 agileinfo_write_reply_left">
						<textarea  name="Comment" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Comment...';}" required="">Comment...</textarea>
					</div>
					<div class="clearfix"> </div>
					<input type="hidden" name="parentsId" value="${parentsId}"/>
					<input type="submit" value="Send Your Comment">
				</form>
			</div>
		</div>
	</div>
<!-- //single -->
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
	<script src="js/comments.js"></script>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>

<script type="text/javascript">
 jQuery(document).ready(function($) {
  $('.replyDiv') .hide()
$('a[href^="#"]').on('click', function(event) {
$('.replyDiv') .hide()
    var target = $(this).attr('href');

    $('.replyDiv'+target).toggle();

});
});
</script>

<script type="text/javascript">

	 function goToURL(url) {
		 location.href = 'CommentRetrieveServlet.do';

		}
 </script>

</html>