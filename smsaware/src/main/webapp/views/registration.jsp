<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Smsaware | smsaware.in</title>
<link rel="icon" href="../images/logo2.gif">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/registration.css" media="screen" />
<script type="text/javascript" src="js/jquery.core.js"></script>
<script type="text/javascript" src="js/jquery.superfish.js"></script>
<script type="text/javascript" src="js/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.scripts.js"></script>
<script>
$(window).load(function() {
$('form').children('input:not(#submit)').val('')
}
</script>
</head>

<body>

<div class="top_bottom">
		<div class="search-container">
			<form id="search" action="" method="get">
			<div class="ser">
				<img src="../images/search-icon.gif" class="serId"alt="">
				<input type="text" class="serInput1">
			</div>
		</form>
		</div>
		<div class="login">
	<a href="../views/smsawarelogin.html"  title="">Login</a>
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

 <form action="RegistrationServlet" name="registrationForm" class="register" method="post" onsubmit="return(regvalidate())">
            <h1 class="regiClass">Registration</h1><br>
			<div class="message RegiError" id="message"></div>
			<div class="message userExist" id="message"><c:out value="${userExist}"/></div>
            
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>Email *
                    </label>
                    <input type="text" id="email" name="email"/>
                    <label>Phone Number *
                    </label>
                    <input type="text" id="phone" name="phone" maxlength="10"/>
                </p>
                <p>
                    <label>Password*
                    </label>
                    <input type="password" id="password" name="password" size="4" maxlength="8"/>
                    <label>Confirmed Password*
                    </label>
                    <input type="password" id="Cpassword" name="Cpassword" size="4" maxlength="8"/>
                   
                </p><br/><span id="strength" class="strength"></span>
            </fieldset>
            <fieldset class="row2">
                <legend>Personal Details
                </legend>
                <p>
                    <label>Name *
                    </label>
                    <input type="text" class="long" id="name" name="name"/>
                </p>
                <p>
                    <label>Address *
                    </label>
                    <input type="text" class="long" id="userAddress" name="userAddress"/>
                </p>
                <p>
                    <label class="optional">Street
                    </label>
                    <input type="text" class="long" id="street" name="street"/>
                </p>
                <p>
                    <label>City *
                    </label>
                    <input type="text" class="long" id="city" name="city"/>
                </p>
				<p>
                    <label>state *
                    </label>
                    <input type="text" class="long" id="state" name="state"/>
                </p>
				<p>
                    <label>ZipCode *
                    </label>
                    <input type="text" class="long" id="zipCode" name="zipCode" maxlength="6"/>
                </p>
				
				
                
                <p>
                    <label class="optional">Website
                    </label>
                    <input class="long" type="text" value="http://" id="website" name="website"/>

                </p>
            </fieldset>
            <fieldset class="row3">
                <legend>Further Information
                </legend>
                <p>
                    <label>Gender *</label>
                    <input type="radio" value="M" id="gender" name="gender"/>
                    <label class="gender">Male</label>
                    <input type="radio" value="F" id="gender" name="gender"/>
                    <label class="gender">Female</label>
                </p>
                <p>
                    <label>Date of Birth *
                    </label>
                    <select class="date" id="date" name="date">
                        <option value="0">Date
                        </option>
						<option value="1">01
                        </option>
                        <option value="2">02
                        </option>
                        <option value="3">03
                        </option>
                        <option value="4">04
                        </option>
                        <option value="5">05
                        </option>
                        <option value="6">06
                        </option>
                        <option value="7">07
                        </option>
                        <option value="8">08
                        </option>
                        <option value="9">09
                        </option>
                        <option value="10">10
                        </option>
                        <option value="11">11
                        </option>
                        <option value="12">12
                        </option>
                        <option value="13">13
                        </option>
                        <option value="14">14
                        </option>
                        <option value="15">15
                        </option>
                        <option value="16">16
                        </option>
                        <option value="17">17
                        </option>
                        <option value="18">18
                        </option>
                        <option value="19">19
                        </option>
                        <option value="20">20
                        </option>
                        <option value="21">21
                        </option>
                        <option value="22">22
                        </option>
                        <option value="23">23
                        </option>
                        <option value="24">24
                        </option>
                        <option value="25">25
                        </option>
                        <option value="26">26
                        </option>
                        <option value="27">27
                        </option>
                        <option value="28">28
                        </option>
                        <option value="29">29
                        </option>
                        <option value="30">30
                        </option>
                        <option value="31">31
                        </option>
                    </select>
                    <select id="month" name="month">
                        <option value="0">Month
                        </option>
						<option value="1">January
                        </option>
                        <option value="2">February
                        </option>
                        <option value="3">March
                        </option>
                        <option value="4">April
                        </option>
                        <option value="5">May
                        </option>
                        <option value="6">June
                        </option>
                        <option value="7">July
                        </option>
                        <option value="8">August
                        </option>
                        <option value="9">September
                        </option>
                        <option value="10">October
                        </option>
                        <option value="11">November
                        </option>
                        <option value="12">December
                        </option>
                    </select>
                    <input class="year" type="text" size="4" maxlength="4" id="year" name="year"/>e.g 1976
                </p>
                <p>
                    <label>Nationality *
                    </label>
                    <select id="nationality" name="nationality">
                       <option value="Select">Select
                        </option>
					   <option value="Indian">Indian
                        </option>
                    </select>
                </p>
                
                <div class="infobox"><h4>Helpful Information</h4>
                    <p>Here comes some explaining text, sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                </div>
            </fieldset>
            <fieldset class="row4">
                <legend>Terms and Mailing
                </legend>
                <p class="agreement">
                    <input type="checkbox" value="" name="termCheckBox" id="termCheckBox"/>
                    <label>*  I accept the <a href="#">Terms and Conditions</a></label>
                </p>
                <p class="agreement">
                    <input type="checkbox" value="" name="offerCheckBox" id="offerCheckBox"/>
                    <label>I want to receive personalized offers by your site</label>
                </p>
                <p class="agreement">
                    <input type="checkbox" value="" name="servicesCheckBox" id="servicesCheckBox"/>
                    <label>Allow partners to send me personalized offers and related services</label>
                </p>
            </fieldset>
            <div><button class="button">Register &raquo;</button></div>
        </form>
 
</div>					
					
		</tr>
			</table>
			</tr>


			<SCRIPT type="Text/JavaScript">
				function regvalidate() {
				 var illegalChars = /[\W_]/; // allow only letters and numbers
				 var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
				 var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
				 var enoughRegex = new RegExp("(?=.{4,}).*", "g");
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
					if ((document.registrationForm.phone.value == "")) {
						document.getElementById('message').innerHTML = " *Phone should not be Empty";
						registrationForm.phone.focus();
						return (false);
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
						} else if (strongRegex.test(document.registrationForm.password.value)) {
						//strength.innerHTML = "<span style="color:green">Strong!</span>";
						document.getElementById('strength').innerHTML = "<span>Strong Password!</span>";
						} else if (mediumRegex.test(document.registrationForm.password.value)) {
						strength.innerHTML = "<span>Medium Password!</span>";
						} else {
						document.getElementById('strength').innerHTML = "<span>Weak Password!</span>";
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
					}if ((document.registrationForm.name.value == "")) {
						document.getElementById('message').innerHTML = " *Name should not be Empty";
						registrationForm.name.focus();
						return (false);
					}
					if ((document.registrationForm.userAddress.value == "")) {
						document.getElementById('message').innerHTML = " *Address should not be Empty";
						registrationForm.userAddress.focus();
						return (false);
					}if ((document.registrationForm.city.value == "")) {
						document.getElementById('message').innerHTML = " *City should not be Empty";
						registrationForm.city.focus();
						return (false);
					}if ((document.registrationForm.state.value == "")) {
						document.getElementById('message').innerHTML = " *State should not be Empty";
						registrationForm.state.focus();
						return (false);
					}if ((document.registrationForm.zipCode.value == "")) {
						document.getElementById('message').innerHTML = " *Zip Code should not be Empty";
						registrationForm.zipCode.focus();
						return (false);
					}
					if ((document.registrationForm.gender.value == "")) {
						var gender = document.getElementsByName('gender');
						var genValue = false;

						for(var i=0; i<gender.length;i++){
							if(gender[i].checked == true){
								genValue = true;    
							}
						}
						if(!genValue){
							document.getElementById('message').innerHTML = " *Please Choose the gender";
							return false;
						}
					
					       document.getElementById('message').innerHTML = " *Please Choose the gender";
							return false;
					}
					if ((document.registrationForm.date.value == "0")) {
						document.getElementById('message').innerHTML = " *Please select a Date";
						return (false);
					}if ((document.registrationForm.month.value == "0")) {
						document.getElementById('message').innerHTML = " *Please select a Month";
						return (false);
					}if ((document.registrationForm.year.value == "")) {
						document.getElementById('message').innerHTML = " *Year should not be Empty";
						registrationForm.year.focus();
						return (false);
					}if ((document.registrationForm.nationality.value == "Select")) {
						document.getElementById('message').innerHTML = " *Please select a Nationality";
						return (false);
					}
					if(!document.getElementById('termCheckBox').checked) {
						document.getElementById('message').innerHTML = " *Please checked Term and Conditions";
						return false; 
					
					}else if(!document.getElementById('offerCheckBox').checked){
						document.getElementById('message').innerHTML = " *Please checked Offer CheckBox";
						return false;
					}else if(!document.getElementById('servicesCheckBox').checked){
						document.getElementById('message').innerHTML = " *Please checked Services CheckBox";
						return false;
					}else{
					 return true;
					}
					
				}
			</SCRIPT>
			</td>
			</tr>
			</table>
			</center>			
			
	</div>
	</div>
	<div>
	<div class="footer_bottom">
		<div class="copyright">
			<a href="http://csstemplatesmarket.com/" target="_blank">Smsaware � 2016 Privacy Policy Terms Of Use</a>
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
