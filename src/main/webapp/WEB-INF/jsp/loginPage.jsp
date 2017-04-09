<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="loginpage">
<c:url var="pwValidationSrc" value="js/password.js" />
	<script src="${pwValidationSrc}"></script>
		<script type="text/javascript">
			$(document).ready(function() {
		
				$("#contact").validate({
					rules : {
						password : {
							required : true,
							
						},
						userName : {
							required : true
						}
					},
					messages : {
						password : {
							required : "This field is required!",
						},
						userName: {
							required : "A username is required!"
						}
					},
					errorClass : "error"
				});
		
			});
		</script>
		
		
<div class="container" id="logincontainer">
			<c:url var="formAction" value="/loginPage" />
				<form id="contact" class="loginform" action='${formAction}' method="POST">
					<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
					
		    			<h3>Login</h3>
		
						<!-- Username -->					
						<fieldset class="loginusername">
							<input placeholder="Username" type="text" name="userName" tabindex="1" required autofocus>
						</fieldset>
		
						<!-- Password-->
						<fieldset>
							<input placeholder="Password" type="password" name="password" id="loginPassword" tabindex="2" required>
						</fieldset>
						
						<!-- Button -->
						<fieldset>
							<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Login</button>	
						</fieldset>
				</form>
		</div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />