<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Smsaware Profile | smsaware.in</title>
<link rel="icon" href="../images/logo2.gif">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.superfish.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.scripts.js"></script>
</head>

<body>

<div class="top_bottom">
		<div class="search-container">
			<form id="search" action="" method="get" autocomplete="off">
				<input
					style="display: inline-block; width: 150px; max-width: 194px;"
					name="q" placeholder="Search" value="" tabindex="1"
					autocomplete="off" maxlength="240" type="text">
			</form>
			<a href="LogoutServlet">Logout</a> 
		</div>

	</div>
	
	<div id="wrap">
		<div class="top_corner"></div>
		<div id="main_container">

			<div id="header">
			<div id="logo">
				<a href="home.html"><img src="../images/logo2.gif" alt="" title=""
					border="0" height="80" width="200" /></a>
			</div>

			<a href="make-a-donation.html" class="make_donation"></a>

			<div id="menu">
				<ul>
					<li><a href="../home.html" title="">Home</a></li>
					<li><a href="../about.html" title="">About Company</a></li>
					<li><a href="../projects.html" title="">Projects</a></li>
					<li><a href="../clients.html" title="">Clients</a></li>
					<li><a href="../testimonials.html" title="">Testimonials</a></li>
					<li><a href="../contact.html" title="">Contact</a></li>
				</ul>
			</div>


		</div>
		
		 <div class="center_content_pages" >
		 <h1 class="regi">Your Profile: </h1><br><br>
		 
		  <form action="">
		  <table style="border-collapse: collapse">
				<tr class="form_row">
					<td >
						<label>Username:</label>
					</td>
					<td>
						 <b> <c:out value="${email}"/></b>
					</td>
					
					
				</tr>
				
				<tr class="form_row">
					<td >
						<label>Name:</label>
					</td>
					<td>
						<b> <c:out value="${name}"/></b>
					</td>
					
					
				</tr>
				
			
				
				
				
				</table>
				</form>
				
			   
		</div>					
					
					
			
	</div>
	</div>
	<div>
	<div class="footer_bottom">
		<div class="copyright">
			<a href="http://csstemplatesmarket.com/" target="_blank">Smsaware © 2016 Privacy Policy Terms Of Use</a>
		</div>
		<div class="footer_links">
			<a class="current" href="../home.html" title="">Home</a> <a
				class="current" href="../about.html" title="">About Company</a> <a
				class="current" href="../projects.html" title="">Projects</a> <a
				class="current" href="../clients.html" title="">Clients</a> <a
				class="current" href="../testimonials.html" title="">Testimonials</a>
			<a class="current" href="../contact.html" title="">Contact</a>
		</div>
		
		<div class="share-buttons"><br><br><br><br><br>
    
		<!-- Buffer -->
		<a href="https://bufferapp.com/add?url=https://simplesharebuttons.com&amp;text=Simple Share Buttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/buffer.png" alt="Buffer" />
		</a>
		
		<!-- Digg -->
		<a href="http://www.digg.com/submit?url=https://simplesharebuttons.com" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/diggit.png" alt="Digg" />
		</a>
		
		<!-- Email -->
		<a href="mailto:?Subject=Simple Share Buttons&amp;Body=I%20saw%20this%20and%20thought%20of%20you!%20 https://simplesharebuttons.com">
			<img src="https://simplesharebuttons.com/images/somacro/email.png" alt="Email" />
		</a>
	 
		<!-- Facebook -->
		<a href="http://www.facebook.com/sharer.php?u=https://simplesharebuttons.com" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" />
		</a>
		
		<!-- Google+ -->
		<a href="https://plus.google.com/share?url=https://simplesharebuttons.com" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/google.png" alt="Google" />
		</a>
		
		<!-- LinkedIn -->
		<a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=https://simplesharebuttons.com" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/linkedin.png" alt="LinkedIn" />
		</a>
		
		<!-- Pinterest -->
		<a href="javascript:void((function()%7Bvar%20e=document.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','http://assets.pinterest.com/js/pinmarklet.js?r='+Math.random()*99999999);document.body.appendChild(e)%7D)());">
			<img src="https://simplesharebuttons.com/images/somacro/pinterest.png" alt="Pinterest" />
		</a>
		
		<!-- Print -->
		<a href="javascript:;" onclick="window.print()">
			<img src="https://simplesharebuttons.com/images/somacro/print.png" alt="Print" />
		</a>
		
		<!-- Reddit -->
		<a href="http://reddit.com/submit?url=https://simplesharebuttons.com&amp;title=Simple Share Buttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/reddit.png" alt="Reddit" />
		</a>
		
		<!-- StumbleUpon-->
		<a href="http://www.stumbleupon.com/submit?url=https://simplesharebuttons.com&amp;title=Simple Share Buttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/stumbleupon.png" alt="StumbleUpon" />
		</a>
		
		<!-- Tumblr-->
		<a href="http://www.tumblr.com/share/link?url=https://simplesharebuttons.com&amp;title=Simple Share Buttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/tumblr.png" alt="Tumblr" />
		</a>
		 
		<!-- Twitter -->
		<a href="https://twitter.com/share?url=https://simplesharebuttons.com&amp;text=Simple%20Share%20Buttons&amp;hashtags=simplesharebuttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/twitter.png" alt="Twitter" />
		</a>
		
		<!-- VK -->
		<a href="http://vkontakte.ru/share.php?url=https://simplesharebuttons.com" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/vk.png" alt="VK" />
		</a>
		
		<!-- Yummly -->
		<a href="http://www.yummly.com/urb/verify?url=https://simplesharebuttons.com&amp;title=Simple Share Buttons" target="_blank">
			<img src="https://simplesharebuttons.com/images/somacro/yummly.png" alt="Yummly" />
		</a>

	</div>

	</div>
	</div>

</body>
</html>
