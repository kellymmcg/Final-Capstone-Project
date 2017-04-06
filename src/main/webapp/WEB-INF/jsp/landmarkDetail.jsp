<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>
	<c:out value="${landmark.name}">
	</c:out>
</h1>
<img src="${landmark.image}" />
<br />
<c:out value="${landmark.longitude}" />
<br />
<c:out value="${landmark.latitude}" />
<br />
<c:out value="${landmark.address}" />
<br />
<c:out value="${landmark.openTime} A.M. to" />
<c:out value=" ${landmark.closeTime} P.M " />
<br />
<c:out value="Admission: ${landmark.admission}" />
<br />
<c:out value="Handicap Accessible: ${landmark.handicapAccessible}" />
<br />
<c:out value="Consessions: ${landmark.consession}" />
<br />
<c:out value="Kid Friendly: ${landmark.kidFriendly}" />
<br />
<c:out value="Water: ${landmark.water}" />
<br />
<c:out value="Restrooms: ${landmark.restroom}" />
<br />

<h3>My Google Maps Demo</h3>
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div id="map"></div>
			<script>
				function initMap() {
					var uluru = {
						lat : ${landmark.longitude},
						lng : -${landmark.latitude}
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