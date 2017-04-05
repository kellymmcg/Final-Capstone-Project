<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1> ${landmark.getName()}</h1> <br/>
${landmark.getLongitude()} <br/>
${landmark.getLatitude()} <br/>
${landmark.getAddress()} <br/>
<p> ${landmark.getOpenTime()} A.M. to ${landmark.getCloseTime()} P.M </p> <br/>
 


<c:import url="/WEB-INF/jsp/footer.jsp" />