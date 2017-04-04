<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

${landmark.getId()}
${landmark.getName()}
${landmark.getLongitude()}
${landmark.getLatitude()}
${landmark.getAddress()}


<c:import url="/WEB-INF/jsp/footer.jsp" />