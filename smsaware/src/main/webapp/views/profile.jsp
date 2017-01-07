<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Smsaware Profile | smsaware.in</title>
<link rel="icon" href="../images/logo2.gif">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/profile.css" media="screen" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.superfish.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.scripts.js"></script>
</head>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>



<body>

<div class="top_bottom">

<div class="wlcome">
WellCome <c:out value="${name}"/>

</div>
		<div class="search-container-profile">
			<div>
			
			
			</div>
			
			<div class="dropdown">
				<button onclick="myFunction()" class="dropbtn"><c:out value="${name}"/> <img src="../images/UserArrow.png" alt="" title=""
					border="0" height="34" width="48" /></button>
				  <div id="myDropdown" class="dropdown-content">
					<a href="#home">Home</a>
					<a href="#about">About</a>
					<a href="LogoutServlet" style="font-size: 20px; text-decoration: none">Logout</a>
				  </div>
			</div>
			
			 
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
					<li><a href="../about.html" title="">Profile Setting</a></li>
					<li><a href="projects.html" title="">Send</a></li>
					<li><a href="clients.html" title="">Receive</a></li>
					<li><a href="clients.html" title="">Contacts</a></li>
				</ul>
			</div>


		</div>
		
		 				
		
<!-- midle layer-->



<div class="center_contents">
			<div class="profile_section_left">
				<img src="images/icon1.gif" alt="" title=""
					class="profile_section_icon" border="0">

				<h2 class="profile_title">What we do</h2>
				<div class="profile_subtitle">Enhanced rebates</div>

				<div class="profile_section_thumb">
					<img src="images/home_section_thumb1.jpg" alt="" title=""
						border="0">
				</div>
				<p>
					<span>Such transformations are surely hard</span><br> but
					should work that achieves less be considered easy? Probably not <br>
					<br> <span>Those things which are not worthwhile</span><br>
					It's relegated precisely to those activities which achieve less.
				</p>
				<p>
					<span>Such transformations are surely hard</span><br> but
					should work that achieves less be considered easy? Probably not <br>
					<br> <span>Those things which are not worthwhile</span><br>
					It's relegated precisely to those activities which achieve less.
				</p>
				<p>
					<span>Such transformations are surely hard</span><br> but
					should work that achieves less be considered easy? Probably not <br>
					<br> <span>Those things which are not worthwhile</span><br>
					It's relegated precisely to those activities which achieve less.
				</p>
				<a href="" class="more"><img src="images/more.gif" alt=""
					title="" border="0"></a>
				<div class="clear"></div>
			</div>


			<div class="profile_section_next">
				<h2 class="profile_title_next">Send your SMS</h2>
				<div class="profile_subtitle_next"></div>

				<div class="profile_section_thumb_next">
					
				</div>
				<p>
				
				<form action="" method="post">
					<ul>
						  <li>
						   <label for="number">Phone Number</label>
						   <input type="text" name="number" id="number" placeholder="3855550168" style="background-color:#FFFAFA;text-decoration: none"/></li>
						  <li>
						  <label for="heading">Heading</label>
						   <input type="text" name="heading" id="heading" style="background-color:#FFFAFA;text-decoration: none" />
						  </li>
						  <li>
						   <label for="message">Message</label>
						   <textarea name="message" id="message" cols="40" rows="5" style="background-color:#FFFAFA;text-decoration: none"></textarea>
						  </li>
						 <li><input type="submit" name="sendMessages" class="message_submit" id="sendMessages" value="Send Message" /></li>
					</ul>
				</form>
				
				</p>
			
			</div>
		<div class="clear"></div>
		</div>

		<div class="footer"></div>


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
		<a href="https://bufferapp.com/add?url=http://smsaware.in&amp;text=Simple Share Buttons" target="_blank">
			<img src="../images/buffer.png" alt="Buffer" />
		</a>
		
		<!-- Digg -->
		<a href="http://www.digg.com/submit?url=http://smsaware.in" target="_blank">
			<img src="../images/diggit.png" alt="Digg" />
		</a>
		
		<!-- Email -->
		<a href="mailto:?Subject=Simple Share Buttons&amp;Body=I%20saw%20this%20and%20thought%20of%20you!%20 http://smsaware.in">
			<img src="../images/email.png" alt="Email" />
		</a>
	 
		<!-- Facebook -->
		<a href="http://www.facebook.com/sharer.php?u=http://smsaware.in" target="_blank">
			<img src="../images/facebook.png" alt="Facebook" />
		</a>
		
		<!-- Google+ -->
		<a href="https://plus.google.com/share?url=http://smsaware.in" target="_blank">
			<img src="../images/google.png" alt="Google" />
		</a>
		
		<!-- LinkedIn -->
		<a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http://smsaware.in" target="_blank">
			<img src="../images/linkedin.png" alt="LinkedIn" />
		</a>
		
		<!-- Pinterest -->
		<a href="javascript:void((function()%7Bvar%20e=document.createElement('script');e.setAttribute('type','text/javascript');e.setAttribute('charset','UTF-8');e.setAttribute('src','http://assets.pinterest.com/js/pinmarklet.js?r='+Math.random()*99999999);document.body.appendChild(e)%7D)());">
			<img src="../images/pinterest.png" alt="Pinterest" />
		</a>
		
		<!-- Print -->
		<a href="javascript:;" onclick="window.print()">
			<img src="../images/print.png" alt="Print" />
		</a>
		
		<!-- Reddit -->
		<a href="http://reddit.com/submit?url=http://smsaware.in&amp;title=Simple Share Buttons" target="_blank">
			<img src="../images/reddit.png" alt="Reddit" />
		</a>
		
		<!-- StumbleUpon-->
		<a href="http://www.stumbleupon.com/submit?url=http://smsaware.in&amp;title=Simple Share Buttons" target="_blank">
			<img src="../images/stumbleupon.png" alt="StumbleUpon" />
		</a>
		
		<!-- Tumblr-->
		<a href="http://www.tumblr.com/share/link?url=http://smsaware.in&amp;title=Simple Share Buttons" target="_blank">
			<img src="../images/tumblr.png" alt="Tumblr" />
		</a>
		 
		<!-- Twitter -->
		<a href="https://twitter.com/share?url=http://smsaware.in&amp;text=Simple%20Share%20Buttons&amp;hashtags=simplesharebuttons" target="_blank">
			<img src="../images/twitter.png" alt="Twitter" />
		</a>
		
		<!-- VK -->
		<a href="http://vkontakte.ru/share.php?url=http://smsaware.in" target="_blank">
			<img src="../images/vk.png" alt="VK" />
		</a>
		
		<!-- Yummly -->
		<a href="http://www.yummly.com/urb/verify?url=http://smsaware.in&amp;title=Simple Share Buttons" target="_blank">
			<img src="../images/yummly.png" alt="Yummly" />
		</a>
	</div>

	</div>
	</div>

</body>
</html>
