<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="pwValidationSrc" value="/script.js" />
<script src="${pwValidationSrc}"></script>

<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({
			rules : {
				password : {
					required : true,
					minlength : 10,
					maxlength : 128,
					complexPassword : true,
					noMoreThan2Duplicates : true
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
		<form class="form-horizontal" action='${formAction}' method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
			<fieldset>
			
				<div class="control-group">
					<!-- Username -->
					<label class="control-label" for="username">Username</label>
					<div class="controls">
						<input type="text" id="userName" name="userName" placeholder="Username" class="input-xlarge regBox">
					</div>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" id="password" name="password" placeholder="Password" class="input-xlarge regBox">
					</div>
				</div>	
					

				<div class="control-group">
						<!-- Password -->
					<label class="control-label" for="password_confirm">Verify Password</label>
					<div class="controls">
						<input type="password" id="password_confirm" name="password_confirm" placeholder="Re-Type Password" class="input-xlarge regBox">
					</div>
				</div>

				<div class="control-group">
					<br>
						<!-- Button -->
					<div class="controls">
						<button class="btn btn-success">Register</button>
					</div>
				</div>
				<!--  
				<p> Passwords must be at least 10 characters long, 
				No more than two identical characters in a row.
				Must contain at least 3 of the following 4 types of characters: Uppercase letter (A-Z),
				Lowercase letter (a-z), Number (0-9), or A "special character (#, $, %, etc...)"
						<li>Uppercase letter (A-Z)</li>
						<li>Lowercase letter (a-z)</li>
						<li>Number (0-9)</li>
						<li>A "special" character (#, $, space, etc)</li>
					</ol>
				</li>
				No more than two identical characters in a row -->
		</div></p>
			</fieldset>
	</form>
	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />