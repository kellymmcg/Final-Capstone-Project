<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<ol>
	<c:forEach var="landmark" items="${results}">
		<p>${landmark.name}</p>
	</c:forEach>	
</ol>

<c:import url="/WEB-INF/jsp/footer.jsp" />