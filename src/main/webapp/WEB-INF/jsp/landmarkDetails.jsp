<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container dCon">
	<div class="row">
		<div class="col-md-12 dName" >
			<c:out value="${landmark.name}"/>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<img src="${landmark.image}" class="dImage" />
		</div>
		
		<div class="col-md-4 dInfo">
			<p id="dAddress">${landmark.address}</p>
			<p>Open from ${landmark.openTime} to ${landmark.closeTime}</p>
			<p>Admission: ${landmark.admission}</p>
			<table>
				<tr>
					<td class="glyphicon glyphicon-thumbs-up"></td><td>${landmark.handicapAccessible}</td>
				</tr>
				<tr>	
					<td>Consession available? </td> <td>${landmark.consession}</td>
				</tr>
				<tr>
					<td>Kid Friendly? </td> <td>${landmark.kidFriendly}</td>
				</tr>
				<tr>
					<td>Restrooms? </td> <td>${landmark.restroom}</td>
				</tr>
			</table>
		</div>
		<div class="col-md-4">
			<div id="map"></div>
			<script>
				function initMap() {
					var location = {
						lat : ${landmark.longitude},
						lng : ${landmark.latitude}
					};
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom : 16,
						center : location
					});
					var marker = new google.maps.Marker({
						position : location,
						map : map
					});
				}
			</script>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8&callback=initMap"></script>
		</div>	
	</div>
</div>





<c:import url="/WEB-INF/jsp/footer.jsp" />