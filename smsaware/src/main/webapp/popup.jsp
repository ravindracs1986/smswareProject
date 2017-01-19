<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page
	import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Smsaware OTP | smsaware.in</title>
<link rel="icon" href="../images/logo2.gif">
	<link rel="stylesheet" type="text/css" href="../css/style.css"
		media="screen" />
	<link rel="stylesheet" type="text/css" href="../css/registration.css"
		media="screen" />
	<script type="text/javascript" src="../js/jquery.core.js"></script>
	<script type="text/javascript" src="../js/jquery.superfish.js"></script>
	<script type="text/javascript" src="../js/jquery.jcarousel.pack.js"></script>
	<script type="text/javascript" src="../js/jquery.easing.js"></script>
	<script type="text/javascript" src="../js/jquery.scripts.js"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
</head>


<script>
$(document).ready(function() {	

var id = '#dialog';
	
//Get the screen height and width
var maskHeight = $(document).height();
var maskWidth = $(window).width();
	
//Set heigth and width to mask to fill up the whole screen
$('#mask').css({'width':maskWidth,'height':maskHeight});

//transition effect
$('#mask').fadeIn(500);	
$('#mask').fadeTo("slow",0.9);	
	
//Get the window height and width
var winH = $(window).height();
var winW = $(window).width();
              
//Set the popup window to center
$(id).css('top',  winH/2-$(id).height()/2);
$(id).css('left', winW/2-$(id).width()/2);
	
//transition effect
$(id).fadeIn(2000); 	
	
//if close button is clicked
$('.window .close').click(function (e) {
//Cancel the link behavior
e.preventDefault();

$('#mask').hide();
$('.window').hide();
});

//if mask is clicked
$('#mask').click(function () {
$(this).hide();
$('.window').hide();
});
	
});

</script>
<body>
<!--PopUP -->
<div id="boxes">
  <div id="dialog" class="window">
    Please provide OTP which you have recievd Via Mail and SMS<br><br>
	<form action="ProfileServlet" name="ProfileServlet" method="post" onsubmit="return(proValidate())">
            Please enter OTP:  <input type="password" name="userOTP" style="background-color: #fefefe;border: 3px solid #888; width: 213px;height: 31px;" maxlength="6"/> <br>
			<input type="hidden" name="userId" value="${userId}"/>
			<input type="hidden" name="name" value="${name}"/>
			<input type="hidden" name="email" value="${email}"/>
			<input type="hidden" name="phone" value="${phone}"/>
			<div class="message userOTPError" id="message1"><c:out value="${wrongOTP}"/></div>
			<div id="popupfoot"> <a href="#" class="agree"><input type="submit" name="otpSubt"
									class="message_submit otpSubt otpSubt-submit" value="Submit"/></a>
	</form>
	
	<a class="close agree message_submit otpSubt otpSubt-cancle"style="color:#fff;" href="../views/smsawarelogin.html"> Cancle</a> 
	 
	</div>
  </div>
  <div id="mask"></div>
</div>
	
</body>
</html>
