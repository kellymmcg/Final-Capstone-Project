<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

		<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
		<div class="container">
			<div class="col-sm-12">
				<div class="bs-calltoaction bs-calltoaction-primary">
					<div class="row sBox">
						<div class="col-md-9 cta-contents">
							<h1 class="cta-title">Search our Database of Landmarks!</h1>
							<div class="cta-desc">
								<p>Simply enter the name of the landmark into the text box:</p>
								<p class="bullet">&bull; Click "Submit" and let's see what we find!</p><br><br>
								<p>If the landmark isn't in our database <a href="#" class="spLink">suggest it to our Admins!</a></p>
							</div>
						</div>
						<div class="col-md-3 cta-button">
							<c:url var="searchAction" value="/landmarkSearch"/>
							<form action="${searchAction}" method="GET" id="searchForm">
								<input type="text" name="landmarkName" id="landmarkName" placeholder="Landmark Name"/>
								<button type="submit" class="btn btn-lg btn-block btn-primary" id="searchLink">Search!</button>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />