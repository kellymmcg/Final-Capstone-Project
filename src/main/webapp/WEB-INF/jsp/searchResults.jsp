<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<script>
$("#detailLink").click(function(event){
	$("#detailForm").submit();
});

</script>
<div class="container sCon">
    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger">${landmarks.size()}</strong> results were found for the search for <strong class="text-danger">${search}</strong></h2>								
	</hgroup>
	<c:forEach items="${landmarks}" var="landmark">
	    <section class="col-xs-12 col-sm-6 col-md-12">
			<article class="search-result row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<a href="#" title="Lorem ipsum" class="thumbnail"><img src="${landmark.image}" alt="Lorem ipsum" /></a>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2">
					<ul class="meta-search">
						<li><i class="glyphicon glyphicon-calendar"></i> <span>02/15/2014</span></li>
						<li><i class="glyphicon glyphicon-time"></i> <span>4:28 pm</span></li>
						<li><i class="glyphicon glyphicon-tags"></i> <span>People</span></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
					<c:url var="detailAction" value="/searchResults"/>
					<form action="${detailAction}" method="GET" id="detailForm">
						<h3><a href="#" id="detailLink">${landmark.name}</a></h3>
						<p>Tower City Center, originally known as Cleveland Union Terminal, is a large mixed-use facility located on Public Square in downtown Cleveland, Ohio.</p>
						<input type="hidden" name="id" value="<c:out value='${landmark.id}'/>"/>
	                	<span class="plus"><button type="submit"><i class="glyphicon glyphicon-plus"></i></button></span>
	                </form>
				</div>
				<span class="clearfix borda"></span>
			</article>
		</section>
	</c:forEach>
</div>	


	

<c:import url="/WEB-INF/jsp/footer.jsp" />