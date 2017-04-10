<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h3><strong>Itinerary Name:</strong>${itinerary.name}</h3> 
<h3><strong>Itinerary Description:</strong> ${itinerary.description}</h3>
<c:forEach items="${landmarks}" var="landmark">
	<p>${landmark.name}</p>
</c:forEach>

<c:import url="/WEB-INF/jsp/footer.jsp" />