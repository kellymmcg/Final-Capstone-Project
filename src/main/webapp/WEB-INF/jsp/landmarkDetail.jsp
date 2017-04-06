<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-md-12 dName" >
			<c:out value="${landmark.name}"/>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<img src="${landmark.image}" class="dImage" />
		</div>
		
		<div class="col-md-4">
			<p id="dAddress">${landmark.address}</p>
			<p>Open from ${landmark.openTime} to ${landmark.closeTime}</p>
			<p>Admission: ${landmark.admission}</p>
			<table>
				<tr>
					<td>Handicap accessible?</td> <td>${landmark.handicapAccessible}</td>
					<td>Consession available?</td> <td>${landmark.consession}</td>
					<td>Kid Friendly?</td> <td>${landmark.kidFriendly}</td>
					<td>Restrooms?</td> <td>${landmark.restroom}</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<h3>My Google Maps Demo</h3>
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div id="map"></div>
			<script>
				function initMap() {
					var uluru = {
						lat : ${landmark.longitude},
						lng : ${landmark.latitude}
					};
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom : 16,
						center : uluru
					});
					var marker = new google.maps.Marker({
						position : uluru,
						map : map
					});
				}
			</script>
			<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8&callback=initMap">
				
			</script>
		</div>	
	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />