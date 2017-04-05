<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<form action= "landmarkSearch" method="POST">
<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
	<div class="bs-calltoaction bs-calltoaction-primary">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">Its a Call To Action</h1>
                            <div class="cta-desc">
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-primary">Go for It!</a>
                        </div>
                     </div>
                </div>
		<input type="text" name="landmarkName" id="landmarkName" /><br/>	
		<input type="submit" value="Submit"/>
</form>



<c:import url="/WEB-INF/jsp/footer.jsp" />