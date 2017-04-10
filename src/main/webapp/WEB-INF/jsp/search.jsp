<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<center>
<div class="searchpage">
	<div class="searchbynamecontainer">
		<c:url var="searchAction" value="/search" />
		<form action="${searchAction}" method="GET" id="searchForm">
			<h3>Search by Name</h3>
			<input type="text" name="name" id="name" placeholder="Landmark Name" /><br>
			<button type="submit"
				class="btn btn-md btn-block btn-search sButton" id="searchLink">Search!</button>
		</form>
	<h3>or</h3>
	
		<c:url var="searchAction" value="/search" />
		<form action="${searchAction}" method="GET" id="searchForm">
			<h3>Search by Proximity</h3>
			<input type="text" name="cityName" id="cityName" placeholder="City" /><br>
			<input type="text" name="stateName" id="stateName"
				placeholder="State" /><br> <input type="text" name="radius"
				id="radius" placeholder="Radius" /><br>
			<button type="submit"
				class="btn btn-md btn-block btn-search sButton" id="searchLink">Search!</button>
		</form>
	</div>
</div>
</center>
<c:import url="/WEB-INF/jsp/footer.jsp" />