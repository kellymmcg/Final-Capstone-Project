<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class = "changepassword">

<c:url var="pwValidationSrc" value="js/password.js" />
<script src="${pwValidationSrc}"></script>
	<script type="text/javascript">
		$(document).ready(function() {
	
			$("#contact").validate({
				rules : {
					password : {
						required : true,
						minlength : 8,
						maxlength : 128,
						complexPassword : true,
						noMoreThan2Duplicates : true
					},
					confirmPassword : {
						required : true,
						equalTo :"#newPassword"
					}
				},
				messages : {
					password : {
						required : "This field is required!",
						minlenght : "Password must be atleast 8 characters.",
						maxlength : "Password can be no more than 128 characters.",
						complexPassword : "Password must contain at least 1 uppercase letter and 1 number.",
						noMoreThan2Duplicates : "Password cannot have more than 2 duplicates."
					},
					confirmPassword : {
						required : "This field is required!",
						equalTo : "Passwords must match."
					}
				},
				errorClass : "error"
			});
	
		});
	</script>

<div class="container" id="updatePasswordContainer">
	<c:url var="updatePasswordHref" value="/changePassword"/>
	<form id="contact" action="${updatePasswordHref}" method="POST">
		<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
		<input type="hidden" name="userName" value="${currentUser}" />
		
		<h3>Update Password</h3>
		
		<fieldset>
			<input placeholder="New password" type="password" name="password" id="newPassword" tabindex="1" required >
		</fieldset>
		
		<fieldset>
			<input placeholder="Confirm password" type="password" name="confirmPassword" tabindex="2" required autofocus>
		</fieldset>
		
		<fieldset>
      		<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Update</button>
    	</fieldset>
	</form>
</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />