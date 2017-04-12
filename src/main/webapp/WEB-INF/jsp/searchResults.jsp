<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8"></script>
<script>
$("#detailLink").click(function(event){
	$("#detailForm").submit();
});

</script>

<div class="container-fluid sCon">
    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger">${landmarks.size()}</strong> results were found for the search for <strong class="text-danger">${search}</strong></h2>								
	</hgroup>
	<c:forEach items="${landmarks}" var="landmark">
	    <section class="col-xs-12 col-sm-6 col-md-12">
			<article class="search-result row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<a title="Lorem ipsum" class="thumbnail"><img src="${landmark.image}" alt="Lorem ipsum" /></a>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2">
					<ul class="meta-search">
					
						<li><i class="fa fa-money"></i> <span>${landmark.admission}</span></li>
						<li><i class="glyphicon glyphicon-phone"></i> <span> ${landmark.phone}</span></li>
						<li><i class="glyphicon glyphicon-tags"></i> <span>People</span></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
					<c:url var="detailAction" value="/searchResults"/>
					<form action="${detailAction}" method="GET" id="detailForm">
						<h2 id="detailLink">${landmark.name}</h2>
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

<c:import url="/WEB-INF/jsp/footer.jsp" />