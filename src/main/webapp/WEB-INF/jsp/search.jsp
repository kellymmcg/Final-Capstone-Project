<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<center>
	<div class="searchpage">
		<br> <br> <br>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-3" style="background-color: #21074f;">
				<h2>Search by Name</h2><br>
				<c:url var="searchAction" value="/search" />
				<form action="${searchAction}" method="GET" id="searchForm">
					<input type="text" name="name" id="name"
						placeholder="Landmark Name" /> <br>
					<button type="submit"
						class="btn btn-md btn-block btn-primary sButton" id="searchLink">Search!
					</button>
					<br>
				</form>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-3" style="background-color: #21074f;">
				<h2>Search by Proximity</h2><br>
				<c:url var="searchAction" value="/proximitySearch" />
				<form action="${searchAction}" method="GET" id="searchForm">
					<input type="text" name="city" id="city" placeholder="City" /><br>
					<br> 
					<input type="radio" name="radius" value="1"> 1 Miles <br>
					<input type="radio" name="radius" value="3"> 3 Miles <br>
					<input type="radio" name="radius" value="5"> 5 Miles <br>
					<input type="radio" name="radius" value="10"> 10 Miles <br>
					<input type="radio" name="radius" value="15"> 15 Miles <br>
					<button type="submit"
						class="btn btn-md btn-block btn-primary sButton" id="searchLink">Search!</button>
				</form>
			</div>
			
			<div class="col-sm-2"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
		</div>


	</div>
	<br>
	<br>
	<br>
</center>



<c:import url="/WEB-INF/jsp/footer.jsp" />