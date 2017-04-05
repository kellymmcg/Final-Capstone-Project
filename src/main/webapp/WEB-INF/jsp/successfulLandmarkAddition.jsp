<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container-fluid">
	<h1>You've successfully added a new landmark to the database!!!</h1>

	<c:url var="landmarkAdditionHref" value="/addLandmark"/>
	<form action="${landmarkAdditionHref}" method="GET">
		<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
		
		<input type="submit" value="Submit another landmark"/>	
	</form>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />