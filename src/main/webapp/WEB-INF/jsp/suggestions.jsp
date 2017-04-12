<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<style>



</style>

<div class = "suggestlandmark">
<br><br><br><br>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-1"></div>
		<div class="col-md-4">
		<form id="contact" class="regform" action='${formAction}' method="POST">
			<c:url var="submitSuggestion" value="/suggestions" />
			<h3>Suggest a Landmark!</h3><br>
			<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
				<input type="text" name="name" id="name" placeholder="Name"/><br/><br>
				<input type="text" name="address" id="address" placeholder="Address"/><br/><br>
				<textarea rows="5" cols="20" name="description" id="description" placeholder="Description"></textarea><br/>
				<input type="hidden" name="user" value="${currentUser}" />
				  <fieldset>
           			 <button name="submit" type="submit" id="contact-submit"
                data-submit="...Sending">Submit</button>
        </fieldset>
			</form>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-1"></div>
	</div>
<br><br><br><br>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />
