<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="addlandmark">
	<div class="container-fluid" id="landmarkcontainer">
		<c:url var="addLandmarkHref" value="/addLandmark"/>
		<form id="contact" action="${addLandmarkHref}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
			
			<h3>Add a new Landmark</h3>
	    	<h4>Landmark details</h4>
		
			<fieldset>
				<input placeholder="Review Id" type="text" name="reviewId" tabindex="1" required autofocus>
			</fieldset>
				
			<fieldset>
				<input placeholder="Landmark Name" type="text" name="name" tabindex="2" required />
			</fieldset>
			
			<fieldset>	
				<input placeholder="Longitute" type="text" name="longitude" tabindex="3" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Latitude" type="text" name="latitude" tabindex="4" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Address" type="text" name="address" tabindex="5" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Website Link" type="text" name="website" tabindex="6" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Opening Time" type="text" name="openTime" tabindex="7" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Closing Time" type="text" name="closeTime" tabindex="8" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Phone #" type="text" name="phone" tabindex="9" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Image Link" type="text" name="image" tabindex="10" required />
			</fieldset>
			
			<fieldset>
				<input placeholder="Price of admission " type="text" name="admission" tabindex="11" required />
			</fieldset>
			
			<input type="checkbox" name="handicapAccessible" value="true"> Handicap Accessible<br>
	  		<input type="checkbox" name="concession" value="true" > Concession<br>
	  		<input type="checkbox" name="kidFriendly" value="true" > Kid-Friendly<br>
	  		<input type="checkbox" name="water" value="true" > Water<br>
	  		<input type="checkbox" name="restroom" value="true" > Public Restroom<br><br>
			
			<fieldset>
	      		<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
	    		</fieldset>
	    	
	    		<p class="copyright">Designed by Team Bravo</p>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />