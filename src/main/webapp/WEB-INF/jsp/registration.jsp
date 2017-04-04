<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div>
	<h1>Registration</h1>
	<div>
		<h2>Search, Discover, and Explore a different city.</h2>
		<h3>Create daily itineraries.</h3>
		<h3>Add and save landmarks.</h3>
	</div>

	<div class = "registration">
			<c:url var="formAction" value="/registration" />
			<form method="POST" action="${formAction}">
				<div class="user">
					<label for="user">Username: </label> <input type="text" name="user"
						id="user" />
				</div>
				<br>
				<div class="password">
					<label for="password">Password: </label> <input
						type="text" name="password" id="password" />
				<br>
					<label for="verifypassword">Verify Password:</label> <input type="text" name="verifypassword" id="verifypassword" />
				</div>
				<input class="formSubmitButton" type="submit" value="Submit" />
			</form>
	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />