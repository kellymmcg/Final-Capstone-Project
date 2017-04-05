<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="pwValidationSrc" value="js/password.js" />
<script src="${pwValidationSrc}"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("form#registration").validate({
			rules : {
				password : {
					required : true,
					minlength : 8,
					maxlength : 128,
					complexPassword : true
				},
				userName : {
					required : true
				},
				confirmPassword : {
					required : true,
					equalTo : "#password"
				}
			},
			messages : {
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});

	});
</script>

<div class="registrationpage">
	<div class="registrationbox">
		<h3>Registration</h3>
		<c:url var="formAction" value="/registration" />
		<form class="form-horizontal" id = "registration" action='${formAction}' method="POST">
			<input type="hidden" name="CSRF_TOKEN"
				value="<c:out value='${CSRF_TOKEN}' />" />
			<fieldset>

				<div class="control-group">
					<!-- Username -->
					<label class="control-label" for="userName">Username</label>
					<div class="controls">
						<input type="text" id="userName" name="userName"
							placeholder="Username" class="input-xlarge regBox">
					</div>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" id="password" name="password"
							placeholder="Password" class="input-xlarge regBox">
					</div>
				</div>


				<div class="control-group">
					<!-- Password -->
					<label class="control-label" for="confirmPassword">Verify
						Password</label>
					<div class="controls">
						<input type="password" id="confirmPassword"
							name="confirmPassword" placeholder="Re-Type Password"
							class="input-xlarge regBox"><br>
					</div>
				</div>

				<div class="control-group">
					<br>
					<!-- Button -->
					<div class="controls">
						<button class="btn btn-success">Register</button>
					</div>
				</div><br>

			</fieldset>
		</form>
	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />