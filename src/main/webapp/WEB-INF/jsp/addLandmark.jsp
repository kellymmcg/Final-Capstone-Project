<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container-fluid">
	<h4>Landmark Details</h4><br>
<c:url var="suggestionHref" value="/suggestions"/>
	<form action="${suggestionHref}" method="POST">
		<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
	
		<label for="landmarkId">Id</label>
			<input type="text" name="id" id="landmarkId" /><br><br>	
		<label for="reviewId">Review Id</label>
			<input type="text" name="reviewId" id="landmarkReviewId" /><br><br>	
		<label for="landmarkName">Name </label>
			<input type="text" name="name" id="landmarkName" /><br><br>
		<label for="landmarkLong">Longitute </label>		
			<input type="text" name="longitude" id="landmarkLong" /><br><br>
		<label for="landmarkLat">Latitude </label>		
			<input type="text" name="latitude" id="landmarkLat" /><br><br>
		<label for="landmarkAddress">Address </label>
			<input type="text" name="address" id="landmarkAddress" /><br><br>
		<label for="landmarkWebsite">Website Link</label>
			<input type="text" name="website" id="landmarkWebsite" /><br><br>
		<label for="landmarkOpenTime">Opening Time</label>
			<input type="text" name="openTime" id="landmarkOpenTime" /><br><br>
		<label for="landmarkCloseTime">Closing Time</label>
			<input type="text" name="closingTime" id="landmarkClosingTime" /><br><br>	
		<label for="landmarkPhone">Phone # </label>
			<input type="text" name="phone" id="landmarkPhone" /><br><br>
		<label for="landmarkImage">Image Link </label>
			<input type="text" name="image" id="landmarkImage" /><br><br>
		
		<input type="submit" value="Submit"/>
	</form>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />