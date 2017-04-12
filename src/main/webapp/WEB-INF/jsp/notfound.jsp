<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404 Not Found</title>
<style>
.notfound {
	color: #21074F;
	text-align: center;
	font-family: "Roboto", Helvetica, Arial, sans-serif;
	font-weight: 500;
	line-height: 30px;
	padding: 20px; 
	}
	
.notfound p {
	font-size: 36px;
}

.notfound .col-md-6 {
	color: #21074F;
	margin: 50px 25px 50px 25px;
}

.notfound .button1 {
    background-color: rgba(33, 7, 79, 0.8);
    color: #FCB12F;
    padding: 20px 32px;
    text-align: center;
    display: center;
    font-size: 24px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
    border: 3px solid #FCB12F;
    border-radius: 15px;
}

.notfound .button1:hover{
    background-color: #FCB12F;
    color: #21074F;
    padding: 20px 32px;
    text-align: center;
    text-decoration: none;
    display: center;
    font-size: 24px;
    margin: 4px 2px;
    cursor: pointer;
    border: 3px solid  #21074F;
    border-radius: 15px;
}

</style>
</head>
<body>
<div class ="notfound">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<p>The page you are looking for is not available.</p>
	<iframe width="560" height="315" src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1" frameborder="0" allowfullscreen>
	</iframe><br><br>
	<p>Be like the .Net instructor Josh Tucholski and don't give up on Tour du City</p>
	<a href="/capstone" class="button1">Click here to go home!</a>
	</div>
	<div class="col-md-3"></div>
	
</div>
</body>
</html>
