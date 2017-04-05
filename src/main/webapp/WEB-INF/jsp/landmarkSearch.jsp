<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<form action= "landmarkSearch" method="POST">
<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
<label for="landmarkName">Landmark Name </label>
	<input type="text" name="landmarkName" id="landmarkName" /><br/>	
<input type="submit" value="Submit"/>
</form>



<c:import url="/WEB-INF/jsp/footer.jsp" />