<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="createItineraryPage">
	<div class="container" id="newItinerary">
		<c:url var="formAction" value="/createNewItinerary" />
	<form id="contact" class="regform" action='${formAction}' method="POST">
		<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
	
		<h3>Create New Itinerary</h3>
	
		<!-- Username -->
		<fieldset>
			<input placeholder="Itinerary Name" type="text" name="name"
				tabindex="1" required autofocus>
		</fieldset>
	
		<!-- Password-->
		<fieldset>
			<input placeholder="A short description about this itinerary." type="text" name="description"
				tabindex="1" required autofocus>
		</fieldset>
	
		<!-- Button -->
			<fieldset>
				<button name="submit" type="submit" id="contact-submit"
					data-submit="...Sending">Submit</button>
			</fieldset>
		</form>
	</div>
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />