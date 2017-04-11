<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class = "suggestlandmark">

	<c:url var="submitSuggestion" value="/suggestions" />


	<h3>Suggest a Landmark!</h3>
	<form action= "${submitSuggestion}" method="POST">
	<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
		<label for="Name">Name </label>
		<input type="text" name="name" id="name" /><br/>
		<label for ="address">Address</label>
		<input type="text" name="address" id="address"/><br/>
		<label for ="Description"> Description</label>
		<textarea rows="5" cols="20" name="description" id="description">Describe your experience</textarea><br/>
		<input type="hidden" name="user" value="${currentUser}" />
		<input type="submit" value="Submit"/>
		
	</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />
