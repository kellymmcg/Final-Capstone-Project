<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8"></script>

<script type="text/javascript">
	var url_base = "<c:url value="/"/>";
</script>

<c:url var="proximityHref" value="js/proximity.js" />
<script src="${proximityHref}"></script>

<div style="width:1000px;height:300px;" id="mapT"></div>


<c:import url="/WEB-INF/jsp/footer.jsp" />