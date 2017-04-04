<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="registrationpage">
		<h3>Registration</h3>
			<div class="registrationbox">
				<form class="form-horizontal" action='' method="POST">
					<fieldset>
						<div class="control-group">
							<!-- Username -->
							<label class="control-label" for="username">Username</label>
							<div class="controls">
								<input type="text" id="username" name="username" placeholder=""
									class="input-xlarge">
							</div>
						</div>

						<div class="control-group">
							<!-- Password-->
							<label class="control-label" for="password">Password</label>
							<div class="controls">
								<input type="password" id="password" name="password"
									placeholder="" class="input-xlarge">
		
						</div>

						<div class="control-group">
							<!-- Password -->
							<label class="control-label" for="password_confirm">Password
								(Confirm)</label>
							<div class="controls">
								<input type="password" id="password_confirm"
									name="password_confirm" placeholder="" class="input-xlarge">
					
							</div>
						</div>

						<div class="control-group">
							<!-- Button -->
							<div class="controls">
			
								<button class="btn btn-success">Register</button>
							
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />