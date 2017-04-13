<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="routeHref" value="js/generateRoute.js" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8"></script>
<script type="text/javascript"> var url_base = "<c:url value="/"/>"; </script>
<script src="${routeHref}"></script>

<c:url var="backHref" value="/manageItinerary"/>
<div class="container">
	<div class="row">
		<div class="col-md-6 routeMap">
			<div id="mapG"></div>
		</div>
		<div class="col-md-6 routeDescription">
			<div id="routeDetails"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 rFooter">
			<h3><i class="fa fa-smile-o"></i> Thank you for using <b>Tour du City</b>! Enjoy your trip!</h3>
		</div>
		<div class="col-md-4 rFooterButton">
			<a href="${backHref}" class="btn btn-info w3-button w3-teal w3-padding-large" role="button">Back to Itineraries</a>
		</div>
	</div>
</div>	

<c:import url="/WEB-INF/jsp/footer.jsp" />