<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="registrationpage">
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
						userName : {
							required : true
						},
						confirmRegistrationPassword : {
							required : true,
							equalTo :"#registrationPassword"
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
						userName: {
							required : "A username is required!"
						},
						confirmRegistrationPassword : {
							required : "Verification password is requred.",
							equalTo : "Passwords must match."
						}
					},
					errorClass : "error"
				});
		
			});
		</script>
		

		<div class="container" id="registrationcontainer">
			<c:url var="formAction" value="/registration" />
				<form id="contact" class="regform" action='${formAction}' method="POST">
					<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
					
						<h3>Registration</h3>
		    			<h4>Create an account</h4>
		
						<!-- Username -->					
						<fieldset>
							<input placeholder="Username" type="text" name="userName" tabindex="1" required autofocus>
						</fieldset>
		
						<!-- Password-->
						<fieldset>
							<input placeholder="Password" type="password" name="password" id="registrationPassword" tabindex="2" required>
						</fieldset>
			
						<!-- Password -->
						<fieldset>
							<input placeholder="Verify password" type="password" name="confirmRegistrationPassword" tabindex="3" required>
						</fieldset>
						
						<!-- Button -->
						<fieldset>
							<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Register</button>	
						</fieldset>
				</form>
		</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />