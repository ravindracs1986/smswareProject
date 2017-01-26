

<!--
   author: smsaware
   author URL: http://smsaware.in
   
   -->
  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page
	import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*,com.smsaware.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Smsaware | smsaware.in</title>
<link rel="icon" href="images/logo2.gif">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="css/bootstrap.css" rel="stylesheet" />
<!-- Animation library for notifications   -->
<link href="css/animate.min.css" rel="stylesheet" />
<!--  Light Bootstrap Table core CSS    -->
<link href="css/light-bootstrap-dashboard.css" rel="stylesheet" />
<!--  CSS for profile Purpose, don't include it in your project     -->
<link href="css/account.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="#FFA534"
			data-image="images/sidebar-5.jpg">
			<!--
               Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
               Tip 2: you can also add an image using data-image tag
               
               -->
			<div class="sidebar-wrapper">
				<div class="logo logo_grid">
					<h2>
						<a href="http://www.smsaware.in">Sms<span>A</span>ware
						</a>
					</h2>
				</div>
				<ul class="nav">
					<li><a class="dashboard-link"
						href="javascript:showonlyone('dashboardId');"> <i
							class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a class="user-link"
						href="javascript:showonlyone('userProfileId');"> <i
							class="pe-7s-user"></i>
							<p>User Profile</p>
					</a></li>
					<li><a class="contect-link"
						href="javascript:showonlyone('contactListId');"> <i
							class="pe-7s-note2"></i>
							<p>Contacts List</p>
					</a></li>
					<li><a class="notifications-link"
						href="javascript:showonlyone('notificationId');"> <i
							class="pe-7s-bell"></i>
							<p>Notifications</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						
						
						
						<a class="navbar-brand" href="#">Welcome ${user.getRegistration().getName()}</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"> SMS Baleance( ${user.getRegistration().getNo_Of_Sms()})</a></li>
							<li><a href="#"> Buy Sms or Calls </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> Account <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Account setting</a></li>
									<li><a href="#">Change Password</a></li>
								</ul></li>
							<li><a href="LogoutServlet.do"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!--dashboard starts -->
			<div class="content commonClass" id="dashboardId">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="header">
									<h4 class="title">Send SMS</h4>
									<p class="category">quick delevery all sms</p>
								</div>
								<div class="content">
									<form name="form" method="post"
										action="http://www.smseverywhere.com/sendsms.htm?from=a1">
										<table width="305" border="0" cellspacing="1"
											class="sms-table">
											<tr>
												<td colspan="2" align="center" bgcolor="#FFCC66"><strong><font
														size="2">Send a Message to a Cell Phone</font></strong></td>
											</tr>
											<tr bgcolor="#FFFFFF">
												<td colspan="2">India Phone only:<br> <input
													name="Send_To" type="text" value="+91" class="sms-input"
													style="width: 99%;" size="30" maxlength="13">
												</td>
											</tr>
											<tr bgcolor="#FFFFFF">
												<td colspan="2">Optional Subject:<br> <input
													name="Subject" type="text" class="sms-input"
													style="width: 99%;" size="30" maxlength="10"></td>
											</tr>
											<tr bgcolor="#FFFFFF">
												<td colspan="2">Message:<font size="1">(up to
														140 chars)</font><br> <textarea name="Message" cols="30"
														rows="3" class="sms-input" style="width: 99%;"></textarea>
												</td>
											</tr>
											<tr>
												<td>If you agree to the <a
													href="http://www.smsaware.in/termsofuse.html?frm"
													target="_blank">terms</a>
												</td>
												<td><input type="submit" name="Submit3"
													value="Send Now" class="SendNow"></td>
											</tr>
											<tr align="center" bgcolor="#FFCC66">
												<td colspan="2">Powered by <a
													href="http://www.smsaware.in/?msnger" target="_blank">SMSAWARE
												</a>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">Free 1 minute Call to any Number in
										India</h4>
									<p class="category">mobile dialect</p>
								</div>
								<div class="content">
									<!-- mobile dialer start-->
									<div class="">
										<div class="row">
											<div class="col-md-3 col-md-offset-4-4 phone">
												<div class="row1">
													<div class="col-md-9-9">
														<div id="numberDisplay">
															<input type='tel'>
														</div>
														<div id="dialpad" class="button-3">
															<ul id="dial1">
																<li class="first">1</li>
																<li>2</li>
																<li class="last">3</li>
																<li class="first">4</li>
																<li>5</li>
																<li class="last">6</li>
																<li class="first">7</li>
																<li>8</li>
																<li class="last">9</li>
															</ul>
														</div>
														<div id="actions" class="button-3 deactive">
															<ul id="dial1">
																<li href="" class="call">Call</li>
																<li href="" class="skip">Skip</li>
																<li href="" class="clear">Clear</li>
															</ul>
														</div>
													</div>
												</div>

												<div class="clearfix"></div>
											</div>
										</div>
									</div>
									<!-- mobile dialer ends-->
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title">Mobile Tracking</h4>
									<p class="category">track any number in india</p>
								</div>
								<div class="content">
									<div class="regiSearch1">
										<table>
											<tr>

												<th>
													<div class="serLoc">
														<img src="images/location.png" class="serLocId" alt="">
														<input type="text" class="serLocInput"
															placeholder="Find Mobile Location">
													</div>
												</th>
												<th><input class="message_submit" value="Locate"
													onclick="javascript:showLocation();" type="button"></th>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title">SMS Send History</h4>
									<p class="category">History</p>
								</div>
								<div class="content">
									<div class="table-full-width">
										<table class="table">
											<tbody>
												<td class="td-actions text-left" style="font-weight: bold;">Number</td>
												<td class="td-actions text-left " style="font-weight: bold;"">Message</td>
												<td class="td-actions text-left" style="font-weight: bold;">Date</td>
												<tr>
													<td>1234567890</td>
													<td>10/10/2014</td>
													<td class="">
														<p>how r you?</p>
													</td>
												</tr>
												<tr>
													<td>1234567890</td>
													<td>10/10/2014</td>
													<td class="">
														<p>how r you?</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--dashboard ends -->

			<!-- user Starts -->
			<div class="content commonClass" id="userProfileId"
				style="display: none;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">Edit Profile</h4>
								</div>
								<div class="content">
									<form name="updatePfofile" method="post" action="UpdateProfileSevlet.do">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>Phone Number</label> <input type="text" name="pPhone"
														class="form-control" disabled placeholder="Company"
														value='${user.getRegistration().getPhone()}'>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Email address</label> <input
														type="email" name="email" id="Pemail" class="form-control" placeholder="Email" value='${user.getRegistration().getEmail()}'>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>First Name</label> <input type="text" name="name" id="Pname"
														class="form-control" placeholder="Company" value="${user.getRegistration().getName()}">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Last Name</label> <input type="text" name="lastName" id="PlastName"
														class="form-control" placeholder="Last Name"
														value="${user.getRegistration().getLastName()}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Address</label> <input type="text" name="userAddress" id="PuserAddress"
														class="form-control" placeholder="Home Address"
														value="${user.getAddress().getUser_address()}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>City</label> <input type="text" class="form-control" name="city" id="Pcity"
														placeholder="City" value="${user.getAddress().getCity()}">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>State</label> <input type="text" name="state" id="Pstate"
														class="form-control" placeholder="Country" value="${user.getAddress().getState()}">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Postal Code</label> <input type="text" name="zip" id="Pzip"
														class="form-control" placeholder="ZIP Code" value='${user.getAddress().getZip()}'>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>About Me</label>
													<textarea rows="5" class="form-control"name="aboutMe" id="PaboutMe"
														placeholder="Here can be your description" value="${user.getRegistration().getAboutMe()}">${user.getRegistration().getAboutMe()}</textarea>
												</div>
											</div>
										</div>
										<input type="hidden" id="userId" name="userId" value="${user.getRegistration().getId()}">
										<button type="submit" class="btn btn-info btn-fill pull-right" id="updateProfileButton">Update
											Profile</button>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card card-user">
								<div class="image"></div>
								<div class="content">
									<div class="author">
										<a href="#"> <img class="avatar border-gray"
											src="images/faces/face-3.jpg" alt="..." />
											<h4 class="title">
												${user.getRegistration().getName()} ${user.getRegistration().getLastName()}<br />
											</h4>
										</a>
									</div>
									<p class="description text-center">
										${user.getRegistration().getAboutMe()}
									</p>
								</div>
								<hr>
								<div class="text-center">
									<button href="#" class="btn btn-simple">
										<i class="fa fa-facebook-square"></i>
									</button>
									<button href="#" class="btn btn-simple">
										<i class="fa fa-twitter"></i>
									</button>
									<button href="#" class="btn btn-simple">
										<i class="fa fa-google-plus-square"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- user Ends -->
			<!-- Contect List Starts -->
			<div class="content commonClass" id="contactListId"
				style="display: none;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">Contact List</h4>
									<p class="category">update yours contact list</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<th>No.</th>
											<th>Name</th>
											<th>Phone Number</th>
											<th>City</th>
											<th>State</th>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>John</td>
												<td>123456789</td>
												<td>Hazaribag</td>
												<td>jharkhand</td>
												<td class="td-actions text-right">
													<button type="button" rel="tooltip" title="Remove"
														class="btn btn-danger btn-simple btn-xs">
														<i class="fa fa-times"></i>
													</button>
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Deao</td>
												<td>987654332</td>
												<td>Ranchi</td>
												<td>jharkhand</td>
												<td class="td-actions text-right">
													<button type="button" rel="tooltip" title="Remove"
														class="btn btn-danger btn-simple btn-xs">
														<i class="fa fa-times"></i>
													</button>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>ravindra</td>
												<td>3345568877</td>
												<td>chennai</td>
												<td>Tamilnadu</td>
												<td class="td-actions text-right">
													<button type="button" rel="tooltip" title="Remove"
														class="btn btn-danger btn-simple btn-xs">
														<i class="fa fa-times"></i>
													</button>
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>kumar</td>
												<td>4567892222</td>
												<td>chennai</td>
												<td>Tamilnadu</td>
												<td class="td-actions text-right">
													<button type="button" rel="tooltip" title="Remove"
														class="btn btn-danger btn-simple btn-xs">
														<i class="fa fa-times"></i>
													</button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card card-plain">
								<div class="header">
									<button type="submit" id="NewContactId"
										class="btn btn-info btn-fill">Add New Contact</button>
									<div class="clearfix"></div>
								</div>

								<!-- Adding contacts start in contact list -->
								<div class="content card" id="addContacts" style="display: none">
									<form>
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>Phone Number</label> <input type="text"
														class="form-control" placeholder="Phone Number"
														value="+91">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Name</label> <input
														type="text" class="form-control" placeholder="Name">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>City</label> <input type="text" class="form-control"
														placeholder="City">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">State</label> <input
														type="text" class="form-control" placeholder="State">
												</div>
											</div>
										</div>
										<button type="submit" class="btn btn-info btn-fill pull-right">Add</button>
										<div class="clearfix"></div>
									</form>
								</div>

								<!-- Adding contacts ends in contact list -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Contect List Ends -->

			<!-- notification starts -->
			<div class="content commonClass" id="notificationId"
				style="display: none;">
				<div class="container-fluid">
					<div class="card">
						<div class="header">
							<h4 class="title">Notifications</h4>
							<p class="category">
								Handcrafted by our friend <a target="_blank"
									href="https://github.com/mouse0270">Robert McIntosh</a>. Please
								checkout the <a
									href="http://bootstrap-notify.remabledesigns.com/"
									target="_blank">full documentation.</a>
							</p>
						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-6">
									<h5>Notifications Style</h5>
									<div class="alert alert-info">
										<span>This is a plain notification</span>
									</div>
									<div class="alert alert-info">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span>This is a notification with close button.</span>
									</div>
									<div class="alert alert-info alert-with-icon"
										data-notify="container">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span data-notify="icon" class="pe-7s-bell"></span> <span
											data-notify="message">This is a notification with
											close button and icon.</span>
									</div>
									<div class="alert alert-info alert-with-icon"
										data-notify="container">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span data-notify="icon" class="pe-7s-bell"></span> <span
											data-notify="message">This is a notification with
											close button and icon and have many lines. You can see that
											the icon and the close button are always vertically aligned.
											This is a beautiful notification. So you don't have to worry
											about the style.</span>
									</div>
								</div>
								<div class="col-md-6">
									<h5>Notification states</h5>
									<div class="alert alert-info">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span><b> Info - </b> This is a regular notification
											made with ".alert-info"</span>
									</div>
									<div class="alert alert-success">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span><b> Success - </b> This is a regular notification
											made with ".alert-success"</span>
									</div>
									<div class="alert alert-warning">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span><b> Warning - </b> This is a regular notification
											made with ".alert-warning"</span>
									</div>
									<div class="alert alert-danger">
										<button type="button" aria-hidden="true" class="close">×</button>
										<span><b> Danger - </b> This is a regular notification
											made with ".alert-danger"</span>
									</div>
								</div>
							</div>
							<br> <br>
							<div class="places-buttons">
								<div class="row">
									<div class="col-md-6 col-md-offset-3 text-center">
										<h5>
											Notifications Places
											<p class="category">Click to view notifications</p>
										</h5>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('top','left')">Top
											Left</button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('top','center')">Top
											Center</button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('top','right')">Top
											Right</button>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('bottom','left')">Bottom
											Left</button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('bottom','center')">Bottom
											Center</button>
									</div>
									<div class="col-md-2">
										<button class="btn btn-default btn-block"
											onclick="demo.showNotification('bottom','right')">Bottom
											Right</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- footer -->
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>
							<li><a href="#"> Home </a></li>
							<li><a href="#"> Company History </a></li>
							<li><a href="#"> Portfolio </a></li>
							<li><a href="#"> Blog </a></li>
						</ul>
					</nav>
					<div class="agileinfo_copy_right_left">
						<p>
							Smsaware © 2016 Privacy Policy Terms Of Use<a
								href="http://smsaware.in/"> Smsaware</a>
						</p>
					</div>
				</div>
			</footer>
			<!-- //footer -->
		</div>
	</div>
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
</body>
<!--   Core JS Files   -->
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
<!-- Light Bootstrap Table profile methods, don't include it in your project! -->
<script src="js/profile.js"></script>
<script type="text/javascript">
      $(document).ready(function(){
      
         	demo.initChartist();
      
         	$.notify({
             	icon: 'pe-7s-gift',
             	message: "Welcome to <b>SMSAWARE</b> - utilised your account free services."
      
             },{
                 type: 'info',
                 timer: 4000
             });
			 
			   $('.num').click(function () {
					var num = $(this);
					var text = $.trim(num.find('.txt').clone().children().remove().end().text());
					var telNumber = $('#telNumber');
					$(telNumber).val(telNumber.val() + text);
				});
			 
			 $( "#NewContactId" ).click(function() {
			  $( "#addContacts" ).toggle( "slow" );
			});
			 
			 
      
      });
      
      function showonlyone(thechosenone) {
      $('.commonClass').each(function(index) {
      if ($(this).attr("id") == thechosenone) {
      $(this).show();
      
               }
      else {
      
                    $(this).hide();
      
               }
      
          });
      
      }
      
      (function ($){
  window.numberArray = [],
  window.phoneNumber = '',
  window.updateDisplay,
  window.numberDisplayEl,
  window.inCallModeActive,
  window.dialpadButton = $('div#dialpad li'),
  window.dialpadCase = $('div#dialpad'),
  window.clearButton = $('#actions .clear'),
  window.callButton = $('#actions .call'),
  window.actionButtons = $('#actions'),
  window.skipButton = $('#actions .skip'),
  window.numberDisplayEl = $('#numberDisplay input');

  function compilePhoneNumber(numberArray){
    if (window.numberArray.length > 1){ 
      window.phoneNumber = window.numberArray.join('');
    } else {
      window.phoneNumber = window.numberArray
    }
    return this.phoneNumber;
  };

  function updateDisplay(phoneNumber){
    window.numberDisplayEl.val(window.phoneNumber);
  };

  function clearPhoneNumber(){
    window.numberDisplayEl.val('');
    window.phoneNumber = '';
    window.numberArray = [];
  };

  function callNumber(){
    window.numberDisplayEl.val('Calling...');
    activateInCallInterface();
    // Need timer interval to animate . . .
    // Trigger  "Hangup"
    // Trigger  "Call timer"
  };

  function holdNumber(){
    window.numberDisplayEl.val('On Hold.');
    changeHoldIntoUnhold();
  };

  function changeHoldIntoUnhold(){
    window.skipButton.html('Unhold');
    window.skipButton.addClass('ready');
  };

  function changeUnholdIntoHold(){
    window.skipButton.html('Hold');
  };

  function activateInCallInterface(){
    changeClearIntoHangUp();
    changeSkipIntoHold();
    disableCallButton();
    disableDialButton();
    removeReadyFromCall();
    enableReadOnlyInput();
    window.inCallModeActive = true;
  };

  function disableInCallInterface(){
    removeReadOnlyInput();
    enableCallButton();
    changeHoldIntoSkip();
    window.inCallModeActive = false;
  }

  function disableCallButton(){
    window.callButton.addClass('deactive');
  };

  function enableCallButton(){
    window.callButton.removeClass('deactive');
  };

  function enableDialButton(){
    window.dialpadCase.removeClass('deactive');
  };

  function disableDialButton(){
    window.dialpadCase.addClass('deactive');
  };

  function changeSkipIntoHold(){
    window.skipButton.html('Hold');
  };

  function changeHoldIntoSkip(){
    window.skipButton.html('Skip');
  };

  function changeClearIntoHangUp(){
    window.clearButton.html('Hang Up');
    window.clearButton.addClass('hangup');
  };

  function changeHangUpIntoClear(){
    if( window.clearButton.html('Hang Up') ){
      window.clearButton.html('Clear');
      window.clearButton.removeClass('hangup');
    }
  };

  function enableReadOnlyInput(){
    window.numberDisplayEl.attr('readonly','readonly');
  }

  function removeReadOnlyInput(){
    window.numberDisplayEl.removeAttr('readonly');
  }

  function refreshInputArray(){
    this.numberDisplayElContent = window.numberDisplayEl.val(); 
    window.numberArray = this.numberDisplayElContent.split('');
  };

  window.dialpadButton.click(function(){
    if( !$(dialpadCase).hasClass('deactive') ){
      var content = $(this).html();
      refreshInputArray();
      window.numberArray.push(content);
      compilePhoneNumber();
      updateDisplay();
      checkDisplayEl();
      saveNumberDisplayEl();
    }
  });

  window.skipButton.click(function(){
    if (window.inCallModeActive == true){
      holdNumber();
    }
  });

  function checkDisplayEl(){
    if( window.numberDisplayEl.val() != "" ){
      addReadyToClear();
      addReadyToCall();
      enableActionButtons();
    } else if ( window.numberDisplayEl.val() == "" ) {
      removeReadyFromClear();
      removeReadyFromCall();
      disableActionButtons();
    }
  }

  function disableActionButtons(){
    window.actionButtons.addClass('deactive');
  }

  function enableActionButtons(){
    window.actionButtons.removeClass('deactive');
  }

  function addReadyToCall(){
    window.callButton.addClass('ready');
  }

  function removeReadyFromCall(){
    window.callButton.removeClass('ready');
  }

  function addReadyToClear(){
    window.clearButton.addClass('ready');
  }

  function removeReadyFromClear(){
    window.clearButton.removeClass('ready');
  }

  function saveNumberDisplayEl(){
    lastNumberDisplayEl = window.numberDisplayEl.val()
  }

  function displayLastSavedNumberDisplayEl(){
    console.log('Last displayed element value: ' + lastNumberDisplayEl);
  }

  $('div#actions li.clear').click(function(){
    enableCallButton();
    enableDialButton();
    clearPhoneNumber();
    removeReadOnlyInput();
    changeHangUpIntoClear();
    updateDisplay();
    checkDisplayEl();
    disableInCallInterface();
  });

  $('div#actions li.call').click(function(){
    callNumber();
  });

})(jQuery);
   </script>
</html>

