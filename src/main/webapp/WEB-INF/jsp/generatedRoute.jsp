<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="routeHref" value="js/generateRoute.js" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8"></script>
<script type="text/javascript"> var url_base = "<c:url value="/"/>"; </script>
<script src="${routeHref}"></script>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div id="mapG"></div>
		</div>
		<div class="col-md-6">
			<div id="routeDetails"></div>
		</div>
	</div>
</div>	

<c:import url="/WEB-INF/jsp/footer.jsp" />