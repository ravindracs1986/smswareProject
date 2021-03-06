

<!--
   author: smsaware
   author URL: http://smsaware.in
   
   -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page
	import="javax.servlet.*,javax.servlet.http.*,java.sql.*,java.io.*,com.smsaware.model.*,com.smsaware.pservice.*,java.util.*,org.apache.commons.codec.binary.Base64"%>
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
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'> -->
<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
<script src="js/paging.js"></script>

<style type="text/css">
.tabStyle {
	border-radius: 25px;
	background: #F5F5DC;
	font-style: italic;
}

.messageClass {
	font-style: italic;
	background: #F5F5DC;
	background-color: #1DC7EA;
}

.cancleChangePassword {
	padding: 10px 104px 8px 16px !important;
	text-align: center !important;
}

.submitChangePassword {
	padding: 10px 10px 8px 34px !important;
	text-align: center !important;
}

.submitAnswer {
	padding: 5px -8px 8px 34px !important;
	text-align: center !important;
}

.paisa p {
	padding: 0 0 10px 0 !important;
	margin: -29px -28px 0px 160px !important;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: 179px auto;
	padding: 0;
	border: 1px solid #888;
	width: 43%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.close1 {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal1-header {
	padding: 2px 16px;
	background-color: #ff9900;
	color: white;
}

.modal-body {
	padding: 2px 77px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal1-footer {
	padding: 2px 16px;
	background-color: #ff9900;
	color: white;
	text-align: right;
}
.pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;    
                cursor: pointer;    
            }
            .pg-selected {
                color: black;
                font-weight: bold;        
                text-decoration: underline;
                cursor: pointer;
            }
</style>
</head>
<body>

	<%
		java.util.List<Contacts> contacts = null;
		java.util.List<com.smsaware.pservice.MessageHistory> smsHistory = null;
		User userBean = (User) session.getAttribute("user");

		if (userBean == null) {
			out.print("welcome to jsp");
		} else {

			String names = userBean.getRegistration().getName();
			contacts = userBean.getContacts();
			smsHistory = userBean.getMessageHistory();
			//out.print("smsHistory==>:"+smsHistory);

		}
	%>
	<c:set var="contactsList" value="<%=contacts%>" scope="request"></c:set>
	<c:set var="smsHistoryList" value="<%=smsHistory%>" scope="request"></c:set>
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
			<input type="hidden" name="reslt" id="reslt"
				value="${changeErrorMessage}" />
			<input type="hidden" name="SecurityMessage" id="SecurityMessage"
				value="${SecurityMessage}" />
			<nav class="navbar navbar-default navbar-fixed">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navigation-example-2">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Welcome
						${user.getRegistration().getName()}</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#" class="tabStyle"> SMS Balance(
								${user.getRegistration().getNo_Of_Sms()})</a></li>
						<li><a href="javascript:showonlyone('buyId');"
							class="tabStyle"> Buy It</a></li>
						<li class="dropdown"><a href="#"
							class="dropdown-toggle tabStyle" data-toggle="dropdown">
								Account <b class="caret"></b>
						</a>
							<ul class="dropdown-menu" class="tabStyle">
								<li><a class="accountSettingClass"
									href="javascript:showonlyone('accountSettingId');">Account
										setting</a></li>
								<li><a class="changePasswordClass"
									href="javascript:showonlyone('changePasswordId');">Change
										Password</a></li>
							</ul></li>
						<li><a href="LogoutServlet.do" class="tabStyle"> Log out
						</a></li>
					</ul>

				</div>
			</div>
			</nav>
			<!--dashboard starts -->
			<div class="content commonClass" id="dashboardId">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="header">
									<h4 class="title">Send SMS</h4>
									<p class="category">quick delevery all sms</p>
								</div>
								<div class="content">
									<form name="form" method="post" action="SmsCommunication.do">
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
												<td>If you agree to the <a href="terms.jsp"
													target="_blank">terms</a>
												</td>
												<input type="hidden" id="userId" name="userId"
													value="${user.getRegistration().getId()}" />
												<td><input type="submit" name="Submit3"
													value="Send Now" class="SendNow"></td>
											</tr>
											<tr align="center" bgcolor="#FFCC66">
												<td colspan="2">Powered by <a href="terms.jsp"
													target="_blank">SMSAWARE </a>
												</td>
											</tr>
										</table>

									</form>
									<div class="messageClass">
										<input type="hidden" id="smsmessage" name="smsmessage"
											value="${smsmessage}">
									</div>
									<div class="messageClass">
										<input type="hidden" id="successMessage" name="successMessage"
											value="${successMessage}">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
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
									<form name="locationTrack" method="post"
										action="LocationTrack.do">
										<div class="regiSearch1">
											<table>
												<tr>
													<th>
														<div class="serLoc">
															<img src="images/location.png" class="serLocId" alt="">
															<input type="text" name="phoneValue" class="serLocInput"
																placeholder="Find Mobile Location" maxlength="10">
														</div>
													</th>
													<th><input class="message_submit" value="Locate"
														type="submit"></th>
												</tr>
											</table>
										</div>
										<input type="hidden" id="userId" name="userId"
											value="${user.getRegistration().getId()}" />
									</form>
								</div>

								<c:if test="${not empty mobileLocator}">
									<table class="table">
										<tbody style="background-color: #ADD8E6">
											<td class="td-actions text-left"
												style="font-weight: bold; color: #008000">Provider</td>
											<td class="td-actions text-left "
												style="font-weight: bold; color: #008000">State</td>
											<tr>
												<td style="font-weight: bold; color: #8B0000">${mobileLocator.provider}</td>
												<td style="font-weight: bold; color: #8B0000">${mobileLocator.state}</td>

											</tr>
										</tbody>
									</table>
								</c:if>
								<c:if test="${not empty errorMessage}">
									<table class="table">
										<tbody style="background-color: #ADD8E6">
											<td class="td-actions text-left" style="font-weight: bold;">Error
												Message</td>
											<tr>

												<td style="font-weight: bold; color: #FF0000">${errorMessage}</td>

											</tr>
										</tbody>
									</table>
								</c:if>

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
									 <table class="table" id="results">
											<tbody>
												<td class="td-actions text-left" style="font-weight: bold;">Number</td>
												<td class="td-actions text-left " style="font-weight: bold;">Message</td>
												<td class="td-actions text-left" style="font-weight: bold;">Date</td>
												<c:forEach items="${smsHistoryList}" var="smsObject">
													<c:if test="${not empty smsObject}">
														<tr>
															<td>${smsObject.phone}</td>
															<td>${smsObject.message}</td>
															<td class="">
																<p>${smsObject.messageDate}</p>
															</td>
														</tr>

													</c:if>

												</c:forEach>

											</tbody>
										</table>
										<div id="pageNavPosition"></div>
										
									 <script type="text/javascript">
									var pager = new Pager('results', 3); 
									pager.init(); 
									pager.showPageNav('pager', 'pageNavPosition'); 
									pager.showPage(1);
								</script>
		 
		 
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
									<form name="updatePfofile" method="post"
										action="UpdateProfileSevlet.do">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>Phone Number</label> <input type="text"
														name="pPhone" class="form-control" disabled
														placeholder="Company"
														value='${user.getRegistration().getPhone()}'>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Email address</label> <input
														type="email" name="email" id="Pemail" class="form-control"
														placeholder="Email"
														value='${user.getRegistration().getEmail()}'>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>First Name</label> <input type="text" name="name"
														id="Pname" class="form-control" placeholder="Company"
														value="${user.getRegistration().getName()}">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Last Name</label> <input type="text" name="lastName"
														id="PlastName" class="form-control"
														placeholder="Last Name"
														value="${user.getRegistration().getLastName()}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>Address</label> <input type="text"
														name="userAddress" id="PuserAddress" class="form-control"
														placeholder="Home Address"
														value="${user.getAddress().getUser_address()}">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label>City</label> <input type="text" class="form-control"
														name="city" id="Pcity" placeholder="City"
														value="${user.getAddress().getCity()}">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>State</label> <input type="text" name="state"
														id="Pstate" class="form-control" placeholder="Country"
														value="${user.getAddress().getState()}">
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label>Postal Code</label> <input type="text" name="zip"
														id="Pzip" class="form-control" placeholder="ZIP Code"
														value='${user.getAddress().getZip()}'>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label>About Me</label>
													<textarea rows="5" class="form-control" name="aboutMe"
														id="PaboutMe" placeholder="Here can be your description"
														value="${user.getRegistration().getAboutMe()}">${user.getRegistration().getAboutMe()}</textarea>
												</div>
											</div>
										</div>
										<input type="hidden" id="userId" name="userId"
											value="${user.getRegistration().getId()}">
										<button type="submit" class="btn btn-info btn-fill pull-right"
											id="updateProfileButton">Update Profile</button>
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
										<a href="#">
											<form method="post" action="UpdateProfileImageServlet.do"
												enctype="multipart/form-data">

												<input type="hidden" id="userId" name="userId"
													value="${user.getRegistration().getId()}">
												<div class="pic">
													<img class="avatar border-gray"
														src="ImageRetrieveServlet.do?userId=${user.getRegistration().getId()}"
														alt="..." />
													<div class="text">
														Please Upload Image
														<table border="0">
															<tr>
																<td><input type="file" name="photo" size="50"
																	style="color: green; cursor: pointer;" /></td>
																<td colspan="2"><input type="submit" value="Upload"></td>
															</tr>

														</table>
													</div>
												</div>
											</form>
											<h4 class="title">
												${user.getRegistration().getName()}
												${user.getRegistration().getLastName()}<br />
											</h4>
										</a>
									</div>
									<p class="description text-center">
										${user.getRegistration().getAboutMe()}</p>
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
											<c:forEach items="${contactsList}" var="listObject">

												<c:if test="${not empty listObject}">
													<tr>
														<td>${listObject.CONTACT_ID}</td>
														<td>${listObject.CONTACT_NAME}</td>
														<td>${listObject.PHONE_NUMBER}</td>
														<td>${listObject.CITY}</td>
														<td>${listObject.STATE}</td>
														<td class="td-actions text-right">
															<button type="button" rel="tooltip" title="Remove"
																class="btn btn-danger btn-simple btn-xs">
																<i class="fa fa-times"></i>
															</button>
														</td>
													</tr>
												</c:if>

											</c:forEach>

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
									<form id="addContact-form" name="addContact-form" method="post"
										action="UserContacts.do">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>Phone Number</label> <input type="text"
														class="form-control" id="phoneValue" name="phoneValue"
														placeholder="Phone Number" value="+91">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Name</label> <input
														type="text" class="form-control" name="nameValue"
														id="nameValue" placeholder="Name">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label>City</label> <input type="text" name="cityValue"
														id="cityValue" class="form-control" placeholder="City">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">State</label> <input
														type="text" class="form-control" name="stateValue"
														id="stateValue" placeholder="State">
												</div>
											</div>
										</div>
										<button type="submit" class="btn btn-info btn-fill pull-right"
											id="addContact">Add</button>
										<div class="clearfix"></div>
										<input type="hidden" id="userId" name="userId"
											value="${user.getRegistration().getId()}">

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
							
						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-6">
									
								</div>
								<div class="col-md-6">
									
								</div>
							</div>
							<br> <br>
							<div class="places-buttons">
								
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--change password starts -->


			<div class="content commonClass" id="changePasswordId"
				style="display: none;">
				<div class="container-fluid">
					<div class="card">
						<div class="header">
							<h4 class="title">Change Password</h4>

						</div>
						<div class="content">
						<font size="4"><div class="message" id="message" style="color:#DC143C"></div></h3> </font>
							<form name="changePasswordForm" method="post"
								action="ChangePassword.do" id="changePasswordForm" onsubmit="return(regvalidate())">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Old Password</label> <input type="password"
												class="form-control" name="oldPassword" id="oldPassword"
												placeholder="OldPassword">
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>New Password</label> <input type="password"
												class="form-control" name="newPassword" id="newPassword"
												placeholder="NewPassword">
										</div>
									</div>
									<div class="col-md-6"></div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Confirmed Password</label> <input type="password"
												class="form-control" name="confirmPassword"
												id="confirmPassword" placeholder="Confirmed Password">
										</div>
									</div>
									<div class="col-md-6"></div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-3">
										<button type="submit"
											class="btn btn-info btn-fill submitChangePassword"
											id="changePass">Change Password</button>
									</div>

								</div>

								<div class="places-buttons"></div>
								<input type="hidden" id="userId" name="userId"
									value="${user.getRegistration().getId()}">
							</form>
						</div>
					</div>
				</div>
			</div>

			<!--change password ends -->

			<!--Account Setting  starts -->
			<div class="content commonClass" id="accountSettingId"
				style="display: none;">
				<div class="container-fluid">
					<div class="card">
						<div class="header">
							<h4 class="title">Account Setting</h4>

						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-6">
									<h4 class="title" style="text-decoration: underline;">Security
										Setting</h4>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<form name="AccountSettingForm" method="post"
								action="SecurityServlet.do">
										<select name="quasions" style="width: 214px; height: 30px;">
											<option value="What is your pets Name?">What is your
												pets Name?</option>
											<option value="What is your school Name?">What is
												your school Name?</option>
											<option value="Mother's Middel Name?">Mother's
												Middel Name?</option>
											<option value="Favourite website name?">Favourite
												website name?</option>
										</select> <br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<input type="text" id="answer" name="answer"
										style="width: 214px; height: 30px;">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<button type="submit"
										class="btn btn-info btn-fill submitAnswer" id="changePass">submit
										Answer</button>
								</div>
							</div>
								<input type="hidden" id="userId" name="userId"
									value="${user.getRegistration().getId()}"/>
							</form>



							<div class="row">
								<div class="col-md-6">
									<h4 class="title" style="text-decoration: underline;">Deactivate
										Account</h4>
								</div>
							</div>
							<br> <br>


							<p>Hope so you will be back you can deactivate Your account
								while clicking Link</p>
							<a class="deactivateAccount" href="#">
								<p>deactivate Account</p>
							</a>


						</div>

						<div class="places-buttons"></div>
					</div>
				</div>
			</div>


			<!--Account Setting  ends -->


			<!--BUY SMS  starts -->
			<div class="content commonClass" id="buyId" style="display: none;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title" style="text-decoration: underline;">Buy
										SMS Service</h4>

								</div>
								<div class="content">
									<p>Price of each SMS is :</p>
									<a class="paisa" href="#"><p>0.5 Paisa</p></a>
									<p>Max SMS should 50 or less then 50</p>
								</div>


								<table class="table">
									<tbody>
										<td class="td-actions text-left">Provider Number of SMS:</td>
										<td class="td-actions text-left "><input type="number"
											id="smsNumber" name="smsNumber"
											style="width: 214px; height: 30px;" min="1" max="50"
											onchange="updateRangeValue();" /></td>
										<tr>
											<td style="font-weight: bold; color: #8B0000">Price of
												SMS:</td>
											<td style="font-weight: bold; color: #8B0000"><strong><output
														id="intNumberValue"
														style="text-decoration: underline;color:red">&nbsp;
													</output></strong></td><td>INR</td>

										</tr>
									</tbody>
								</table>
								<script type="text/javascript">
									function updateRangeValue() {
										intNumberValue.innerHTML = smsNumber.value;
										intNumberValue.innerHTML = intNumberValue.innerHTML * 0.5;

									}
									var intNumber = document
											.getElementById("smsNumber");
									var intNumberValue = document
											.getElementById("intNumberValue");

									updateRangeValue();
								</script>


							</div>
						</div>
						<div class="col-md-6">
							<div class="card ">
								<div class="header">
									<h4 class="title" style="text-decoration: underline;">Payment</h4>

								</div>
								<div class="content">
									<h5>
										Currently payment system is not available please credit the
										amount mannually and send mail to us payment Reciept
										<h5>
											<p>Name :</p>
											<a class="paisa" href="#"><p>Ravindra kumar</p></a>
											<p>Bank Name:</p>
											<a class="paisa" href="#"><p>HDFC Bank</p></a>
											<p>Account Number:</p>
											<a class="paisa" href="#"><p>5241781000168941</p></a>
											<p>IFSC Code:</p>
											<a class="paisa" href="#"><p>HDFC0000323</p></a>
											<p>Email:</p>
											<a class="paisa" href="#"><p>ravindra.kumar@smsaware.in</p></a>
								</div>
							</div>
						</div>


						<div class="col-md-8">
							<div class="card ">
								<div class="header">
									<h4 class="title" style="text-decoration: underline;">Buy
										Call Service</h4>

								</div>
								<div class="content">
									<h3>This service is not available,Please try after some
										days</h3>
								</div>
							</div>
						</div>


					</div>

				</div>
			</div>


			<!--BUY SMS ends -->


			<!-- The Modal -->
			<div id="myModal" class="modal" style='display: none;'>
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>
						<h2>Message</h2>
					</div>
					<div class="modal-body">
						<p style="font-style: italic">${changeErrorMessage}</p>

					</div>
					<div class="modal-footer">
						<h3>SMSAWARE.IN</h3>
					</div>
				</div>

			</div>

			<div id="myModal1" class="modal1" style='display: none;'>
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal1-header">
						<span class="close1">&times;</span>
						<h2>Message</h2>
					</div>
					<div class="modal-body">
						<p style="color: red; font-style: italic">${changeErrorMessage}</p>
					</div>
					<div class="modal1-footer">
						<h3>SMSAWARE.IN</h3>
					</div>
				</div>

			</div>



			<!-- footer -->
			<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
				<ul>
					<li><a href="index.jsp"> Home </a></li>
					<li><a href="about.jsp"> Company History </a></li>
					<li><a href="about.jsp"> Portfolio </a></li>
					<li><a href="CommentRetrieveServlet.do"> Blog </a></li>
				</ul>
				</nav>
				<div class="agileinfo_copy_right_left">
					<p>
						Smsaware � 2016 Privacy Policy Terms Of Use<a
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
	$(document)
			.ready(
					function() {

						demo.initChartist();
						var cont = document.getElementById('smsmessage').value;
						var sucessmsg = document
								.getElementById('successMessage').value;
						var popupResponse = document.getElementById("reslt").value;
						var securityResponse = document.getElementById("SecurityMessage").value;
						if (cont !== '') {
							$.notify({
								icon : 'pe-7s-gift',
								message : cont

							}, {
								type : 'danger',
								timer : 4000
							});

						} else if (sucessmsg !== '') {
							$.notify({
								icon : 'pe-7s-gift',
								message : sucessmsg

							}, {
								type : 'success',
								timer : 4000
							});
						} else if (popupResponse == 'Password change successfully') {
							var modal = document.getElementById('myModal');
							var btn = document.getElementById("myBtn");
							var span = document.getElementsByClassName("close")[0];
							modal.style.display = "block";
							// When the user clicks on <span> (x), close the modal
							span.onclick = function() {
								modal.style.display = "none";
							}
							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						} else if (popupResponse == 'Old Password is not correct'
								|| popupResponse == 'Something Wrong,Please try again') {
							var modal = document.getElementById('myModal1');
							var span = document
									.getElementsByClassName("close1")[0];
							modal.style.display = "block";
							// When the user clicks on <span> (x), close the modal
							span.onclick = function() {
								modal.style.display = "none";
							}
							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						}else if (securityResponse == 'Security setting change successfully') {
							$.notify({
								icon : 'pe-7s-gift',
								message : securityResponse

							}, {
								type : 'success',
								timer : 4000
							});
						}else if (securityResponse == 'Something Wrong,Please try again') {
							$.notify({
								icon : 'pe-7s-gift',
								message : securityResponse

							}, {
								type : 'danger',
								timer : 4000
							});
						} else {
							$
									.notify(
											{
												icon : 'pe-7s-gift',
												message : "Welcome to <b>SMSAWARE</b> - utilised your account free services."

											}, {
												type : 'info',
												timer : 4000
											});

						}
						$('.num').click(
								function() {
									var num = $(this);
									var text = $.trim(num.find('.txt').clone()
											.children().remove().end().text());
									var telNumber = $('#telNumber');
									$(telNumber).val(telNumber.val() + text);
								});

						$("#NewContactId").click(function() {
							$("#addContacts").toggle("slow");
						});

					});

	function showonlyone(thechosenone) {
		$('.commonClass').each(function(index) {
			if ($(this).attr("id") == thechosenone) {
				//if($(this).attr("id")=='contactListId'){
				// alert("inside"); 
				//}

				$(this).show();

			} else {

				$(this).hide();

			}

		});

	}
	function regvalidate() {
		
		
		         var illegalChars = /[\W_]/; // allow only letters and numbers
				 var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
				 var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
				 var enoughRegex = new RegExp("(?=.{4,}).*", "g");
		
					if ((document.changePasswordForm.oldPassword.value == "")) {
						document.getElementById('message').innerHTML = " *Old Password should not be Empty";
						changePasswordForm.oldPassword.focus();
						return (false);
					}if ((document.changePasswordForm.newPassword.value == "")) {
						document.getElementById('message').innerHTML = " *New Password should not be Empty";
						changePasswordForm.newPassword.focus();
						return (false);
					}else if (false == enoughRegex.test(document.changePasswordForm.newPassword.value)) {
						//strength.innerHTML = "More Characters";
						document.getElementById('message').innerHTML = " *Password lenght minimum should 4 to 8 Character";
						changePasswordForm.newPassword.focus();
						return (false);
						} 
					if ((document.changePasswordForm.confirmPassword.value == "")) {
						document.getElementById('message').innerHTML = " *Confirmed Password should not be Empty";
						changePasswordForm.confirmPassword.focus();
						return (false);
					}
					if ((document.changePasswordForm.newPassword.value != document.changePasswordForm.confirmPassword.value)) {
						document.getElementById('message').innerHTML = " *Password and Confirmed password should be Same";
						changePasswordForm.confirmPassword.focus();
						return (false);
					}
		
	}
	(function($) {
		window.numberArray = [], window.phoneNumber = '', window.updateDisplay,
				window.numberDisplayEl, window.inCallModeActive,
				window.dialpadButton = $('div#dialpad li'),
				window.dialpadCase = $('div#dialpad'),
				window.clearButton = $('#actions .clear'),
				window.callButton = $('#actions .call'),
				window.actionButtons = $('#actions'),
				window.skipButton = $('#actions .skip'),
				window.numberDisplayEl = $('#numberDisplay input');

		function compilePhoneNumber(numberArray) {
			if (window.numberArray.length > 1) {
				window.phoneNumber = window.numberArray.join('');
			} else {
				window.phoneNumber = window.numberArray
			}
			return this.phoneNumber;
		}
		;

		function updateDisplay(phoneNumber) {
			window.numberDisplayEl.val(window.phoneNumber);
		}
		;

		function clearPhoneNumber() {
			window.numberDisplayEl.val('');
			window.phoneNumber = '';
			window.numberArray = [];
		}
		;

		function callNumber() {
			window.numberDisplayEl.val('Calling...');
			activateInCallInterface();
			// Need timer interval to animate . . .
			// Trigger  "Hangup"
			// Trigger  "Call timer"
		}
		;

		function holdNumber() {
			window.numberDisplayEl.val('On Hold.');
			changeHoldIntoUnhold();
		}
		;

		function changeHoldIntoUnhold() {
			window.skipButton.html('Unhold');
			window.skipButton.addClass('ready');
		}
		;

		function changeUnholdIntoHold() {
			window.skipButton.html('Hold');
		}
		;

		function activateInCallInterface() {
			changeClearIntoHangUp();
			changeSkipIntoHold();
			disableCallButton();
			disableDialButton();
			removeReadyFromCall();
			enableReadOnlyInput();
			window.inCallModeActive = true;
		}
		;

		function disableInCallInterface() {
			removeReadOnlyInput();
			enableCallButton();
			changeHoldIntoSkip();
			window.inCallModeActive = false;
		}

		function disableCallButton() {
			window.callButton.addClass('deactive');
		}
		;

		function enableCallButton() {
			window.callButton.removeClass('deactive');
		}
		;

		function enableDialButton() {
			window.dialpadCase.removeClass('deactive');
		}
		;

		function disableDialButton() {
			window.dialpadCase.addClass('deactive');
		}
		;

		function changeSkipIntoHold() {
			window.skipButton.html('Hold');
		}
		;

		function changeHoldIntoSkip() {
			window.skipButton.html('Skip');
		}
		;

		function changeClearIntoHangUp() {
			window.clearButton.html('Hang Up');
			window.clearButton.addClass('hangup');
		}
		;

		function changeHangUpIntoClear() {
			if (window.clearButton.html('Hang Up')) {
				window.clearButton.html('Clear');
				window.clearButton.removeClass('hangup');
			}
		}
		;

		function enableReadOnlyInput() {
			window.numberDisplayEl.attr('readonly', 'readonly');
		}

		function removeReadOnlyInput() {
			window.numberDisplayEl.removeAttr('readonly');
		}

		function refreshInputArray() {
			this.numberDisplayElContent = window.numberDisplayEl.val();
			window.numberArray = this.numberDisplayElContent.split('');
		}
		;

		window.dialpadButton.click(function() {
			if (!$(dialpadCase).hasClass('deactive')) {
				var content = $(this).html();
				refreshInputArray();
				window.numberArray.push(content);
				compilePhoneNumber();
				updateDisplay();
				checkDisplayEl();
				saveNumberDisplayEl();
			}
		});

		window.skipButton.click(function() {
			if (window.inCallModeActive == true) {
				holdNumber();
			}
		});

		function checkDisplayEl() {
			if (window.numberDisplayEl.val() != "") {
				addReadyToClear();
				addReadyToCall();
				enableActionButtons();
			} else if (window.numberDisplayEl.val() == "") {
				removeReadyFromClear();
				removeReadyFromCall();
				disableActionButtons();
			}
		}

		function disableActionButtons() {
			window.actionButtons.addClass('deactive');
		}

		function enableActionButtons() {
			window.actionButtons.removeClass('deactive');
		}

		function addReadyToCall() {
			window.callButton.addClass('ready');
		}

		function removeReadyFromCall() {
			window.callButton.removeClass('ready');
		}

		function addReadyToClear() {
			window.clearButton.addClass('ready');
		}

		function removeReadyFromClear() {
			window.clearButton.removeClass('ready');
		}

		function saveNumberDisplayEl() {
			lastNumberDisplayEl = window.numberDisplayEl.val()
		}

		function displayLastSavedNumberDisplayEl() {
			console.log('Last displayed element value: ' + lastNumberDisplayEl);
		}

		$('div#actions li.clear').click(function() {
			enableCallButton();
			enableDialButton();
			clearPhoneNumber();
			removeReadOnlyInput();
			changeHangUpIntoClear();
			updateDisplay();
			checkDisplayEl();
			disableInCallInterface();
		});

		$('div#actions li.call').click(function() {
			callNumber();
		});

	})(jQuery);
</script>
</html>