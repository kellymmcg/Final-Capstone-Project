<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="proximityHref" value="js/proximity.js" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8"></script>
<script type="text/javascript"> var url_base = "<c:url value="/"/>"; </script>
<script src="${proximityHref}"></script>


<!-- HTML SECTION -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
			<div id="mapT"></div>
		</div>	
	<div class="col-md-9 tester">	
		<hgroup class="mb20">
			<h1>Search Results</h1>
			<h2 class="lead"><strong class="text-danger">${landmarks.size()}</strong> results were found for the search for <strong class="text-danger">${search}</strong></h2>								
		</hgroup>
		<c:forEach items="${landmarks}" var="landmark">
		    <section class="col-xs-12 col-sm-6 col-md-12">
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
						<a href="#" title="Lorem ipsum" class="thumbnail"><img src="${landmark.image}" alt="Lorem ipsum"/></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<c:url var="detailAction" value="/searchResults"/>
						<form action="${detailAction}" method="GET" id="detailForm">
							<h3><a href="#" id="detailLink">${landmark.name}</a></h3>
							<p>${landmark.description}</p>
							<input type="hidden" name="id" value="<c:out value='${landmark.id}'/>"/>
		                	<span class="plus"><button type="submit" class="bPad"><i class="fa fa-info-circle"></i> More</button></span>
		                </form>
					</div>
					<span class="clearfix borda"></span>
				</article>
			</section>
		</c:forEach>
		</div>
	</div>
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />