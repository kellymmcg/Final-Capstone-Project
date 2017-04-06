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


<c:import url="/WEB-INF/jsp/footer.jsp" />