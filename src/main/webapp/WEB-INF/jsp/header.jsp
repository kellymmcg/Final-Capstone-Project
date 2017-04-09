<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Tour du City</title>
<c:url var="cssHref" value="css/style.css" />
<c:url value="js/script.js" var="jsHref" />
<c:url value="js/homePageSlideShow.js" var="hpjsHref" />
<c:url var="loginPageHref" value="css/loginPage.css" />
<c:url var="addLandmarkHref" value="css/addLandmarkForm.css" />
<c:url var="registrationHref" value="css/registrationForm.css" />
<c:url var="detailsHref" value="css/landmark.css" />
<c:url var="contactCardHref" value="css/contactCard.css" />
<c:url var="footerStyleHref" value="css/footerStyle.css" />
<c:url var="homePageHref" value="css/homePage.css" />

<!-- LISTS OF SCRIPTS AND CSS FILES -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src = "https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js "></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="${jsHref}"></script>
<script src="${hpjsHref}"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all">

<link rel="stylesheet" type="text/css" href="${cssHref}">
<link rel="stylesheet" type="text/css" href="${loginPageHref}">
<link rel="stylesheet" type="text/css" href="${addLandmarkHref}">
<link rel="stylesheet" type="text/css" href="${registrationHref}">
<link rel="stylesheet" type="text/css" href="${detailsHref}">
<link rel="stylesheet" type="text/css" href="${contactCardHref}">
<link rel="stylesheet" type="text/css" href="${footerStyleHref}">
<link rel="stylesheet" type="text/css" href="${homePageHref}">


</head>
<body>
	<header>
		
	
		<!-- IMAGE LOCATION FOR LOGO -->
		<img src="img/logo.png" class="img-responsive" height="200"/>
		<!-- NAVIGATION BAR INFORMATION -->
		<c:url var="suggestions" value="/search"/>
		<nav class="navbar navbar-default mNav" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				
					<!--  LEFT SIDE OF THE NAVIGATION BAR  -->
					<ul class="nav navbar-nav navbar-left">
						<c:url var="home" value="/"/>
						<li><a href="${home}" id="hButton">Home</a></li>
					</ul>
					
					<!-- RIGHT SIDE OF THE NAVIGATION BAR  -->
					<c:url var="suggestions" value="/search"/>
					<c:url var="addLandmarkAction" value="/addLandmark" />
					<c:url var="changePassAction" value="/changePassword" />
					<c:url var="logoutAction" value="/logout" />
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${not empty currentUser}">
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><b>${currentUser}</b><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li>
											<div class="row">
												<div class="col-md-12">
													<form id="logoutForm" action="${logoutAction}" method="POST">
														<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
													</form>
													<li><a href="${suggestions}" class="" data-wow-delay="0.7s"><span class="glyphicon glyphicon-search"></span> Search</a></li>
													<li><a href="#" id="manageItinerary"><span class="glyphicon glyphicon-folder-open"></span> Manage Itineraries</a></li>
													<li><a href="${changePassAction}" id="changePassLink"><span class="glyphicon glyphicon-lock"></span> Change Password</a></li>
													<li><a href="#" id="logoutLink"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
													
													<p id="adminControls">Admin Controls</p>
													<li><a href="${addLandmarkAction}" id="addLandmark"><span class="glyphicon glyphicon-plus-sign"></span> Add Landmark</a></li>
												</div>
											</div>
										</li>	
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<c:url var="formAction" value="/"/>
								<c:url var="registration" value="/registration" />
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown"><b>Login | Signup</b> <span class="caret"></span></a>
									<ul id="login-dp" class="dropdown-menu">
										<li class="loginTab">
											<div class="row">
												<div class="col-md-12">
													<p id="lHeader">&bull; Login &bull;</p> 
													<form class="form" role="form" method="POST" action="${formAction}" id="login-nav">
														<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
														<div class="form-group">
															<input type="text" class="form-control" name="userName" id="userName" placeholder="Username" required autofocus>
														</div>
														<div class="form-group">
															<input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
														</div>
														<div class="form-group">
															<button type="submit" class="btn btn-primary btn-block">Sign in</button>
														</div>
													</form>
												</div>
												<div class="bottom text-center">
													New here? <a href="${registration}"><b>Join Us</b></a>
												</div>
											</div>
										</li>
									</ul>
								</li>
							</c:otherwise>
						</c:choose>	
					</ul>
				</div>
			</div>
			
			<!--  NOTICE BAR UNDERNEATHE THE NAVIGATION BAR  -->
			<div id="noticeBar">
			<c:choose>
				<c:when test="${not empty currentUser}">
					<p> <!-- Something could go here eventually... maybe... --></p>
				</c:when>
				<c:otherwise>
					<p id="fHeader">${notice}</p>
				</c:otherwise>
			</c:choose>	
			</div>
			
		</nav>

	</header>
