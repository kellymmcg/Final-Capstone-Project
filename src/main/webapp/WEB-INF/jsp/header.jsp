<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Tour du City</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src = "https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.js "></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<c:url var="cssHref" value="css/style.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">

<c:url value="js/script.js" var="jsHref" />
<script src="${jsHref}"></script>

<c:url value="js/homePageSlideShow.js" var="hpjsHref" />
<script src="${hpjsHref}"></script>

<c:url var="addLandmarkHref" value="css/addLandmarkForm.css" />
<link rel="stylesheet" type="text/css" href="${addLandmarkHref}">

<c:url var="registrationHref" value="css/registrationForm.css" />
<link rel="stylesheet" type="text/css" href="${registrationHref}">

<c:url var="detailsHref" value="css/landmark.css" />
<link rel="stylesheet" type="text/css" href="${detailsHref}">

</head>
<body>
	<header>
		<img src="img/logo.png" class="img-responsive" height="200"/>
		<nav class="navbar navbar-default mNav" data-spy="affix" data-offset-top="274" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left">
						<c:url var="home" value="/"/>
						<li><a href="${home}" id="hButton">Home</a></li>
						<c:choose>
							<c:when test="${not empty currentUser}">
								<div class="col-sm-1 uOption">
                       				<li>
                        			<c:url var="suggestions" value="/search"/>
                            		<a href="${suggestions}" class="btn test btn-sm" data-wow-delay="0.7s"><span class="glyphicon glyphicon-search"></span> Search</a>
                       				</li>
                    			</div>
							</c:when>
						</c:choose>		
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${not empty currentUser}">
								<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><b>${currentUser}</b><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li>
											<div class="row">
												<div class="col-md-12">
													<c:url var="logoutAction" value="/logout" />
													<form id="logoutForm" action="${logoutAction}" method="POST">
														<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
													</form>
													<li><a href="#" id="logoutLink">Log out</a></li>
													
													<c:url var="addLandmarkAction" value="/addLandmark" />
													<li><a href="${addLandmarkAction}" id="addLink">Add Landmark</a></li> <!-- Place holder until page is in working order... -->
													
												</div>
											</div>
										</li>	
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown"><b>Login | Signup</b> <span class="caret"></span></a>
									<ul id="login-dp" class="dropdown-menu">
										<li class="loginTab">
											<div class="row">
												<div class="col-md-12">
													<p id="lHeader">&bull; Login &bull;</p> 
													<c:url var="formAction" value="/"/>
													<form class="form" role="form" method="POST" action="${formAction}" id="login-nav">
														<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
														<div class="form-group">
															<input type="text" class="form-control" name="userName" id="userName" placeholder="Username" required>
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
													<c:url var="registration" value="/registration" />
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
			<c:choose>
				<c:when test="${not empty currentUser}">
					<p> <!-- Something could go here eventually... maybe... --></p>
				</c:when>
				<c:otherwise>
					<p id="fHeader">${loginFailure}</p>
				</c:otherwise>
			</c:choose>	
		</nav>
		
		
	</header>