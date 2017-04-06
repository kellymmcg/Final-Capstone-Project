<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="pwValidationSrc" value="js/password.js" />
<script src="${pwValidationSrc}"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("form #contact").validate({
			rules : {
				mainPassword : {
					required : true,
					minlength : 8,
					maxlength : 128,
					complexPassword : true,
					noMoreThan2Duplicates : true
				},
				userName : {
					required : true
				},
				confirmPassword : {
					required : true,
					equalTo : "#registrationPassword"
				}
			},
			messages : {
				userName: {
					required: "A username is required!"
				}
			},
			errorClass : "error"
		});

	});
</script>

<div class="container" id="registrationcontainer">
	<c:url var="formAction" value="/registration" />
		<form id="contact" action='${formAction}' method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
			
				<h3>Registration</h3>
    			<h4>Create an account</h4>

				<!-- Username -->					
				<fieldset>
					<input placeholder="Username" type="text" name="userName" tabindex="1" required autofocus>
				</fieldset>

				<!-- Password-->
				<fieldset>
					<input placeholder="Password" type="password" name="password" tabindex="2" required>
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


<c:import url="/WEB-INF/jsp/footer.jsp" />