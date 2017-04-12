<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="suggestlandmarkpage">
	<div class="container suggestlandmarkcontainer">
		<form id="contact" class="suggestform" action="${formAction}" method="POST">
			<c:url var="submitSuggestion" value="/suggestions" />
			<h3>Suggest a Landmark!</h3>
			
			<fieldset>
				<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" /> <input type="text"name="name" id="name" placeholder="Name" />
			</fieldset>
			
			<fieldset>
				<input type="text" name="address" id="address" placeholder="Address" />	
			</fieldset>
			
			<fieldset>
				<textarea rows="5" cols="20" name="description" id="description" placeholder="Description"></textarea>
			</fieldset>
			
			<fieldset>
				<input type="hidden" name="user" value="${currentUser}" />
			</fieldset>
			
			<fieldset>
				<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
			</fieldset>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />
