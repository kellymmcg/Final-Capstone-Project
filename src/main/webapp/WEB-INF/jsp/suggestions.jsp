<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h3>Suggest a Landmark!</h3>
<form action= "submitSuggestion" method="POST">
	<label for="Name">Name </label>
	<input type="text" name="landmarkName" id="landmarkName" /><br/>
	<label for="Longitude">Longitude </label>
	<input type="text" name="landmarkLong" id="landmarkLong" /><br/>
	<label for="Latitude">Latitude </label>
	<input type="text" name="landmarkLat" id="landmarkLat" /><br/>
	<label for ="address">Address</label>
	<input type="text" name="landmarkAddress" id="landmarkAddress"/><br/>
	<label for ="openTime">Open From</label>
	<input type="text" name="landmarkOpenTime" id="landmarkOpenTime"/>
	<label for ="closeTime">to</label>
	<input type="text" name="landmarkCloseTime" id="landmarkCloseTime"/><br/>
	<label for ="phone">Phone</label>
	<input type="text" name="landmarkPhone" id="landmarkPhone"/><br/>
	<label for ="review">ReviewId</label>
	<input type="text" name="landmarkReview" id="landmarkReview"/><br/>
	<textarea rows="5" cols="20">Describe your experience</textarea><br/>
	<input type="submit" value="Submit"/>
	
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />
