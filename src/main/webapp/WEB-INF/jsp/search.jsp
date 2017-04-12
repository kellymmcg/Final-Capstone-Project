<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

	<div class="searchlandmarkpage">
		<div class="conatiner" id="searchconatiner">
			<div class="row searchrow">
				<div class="col-md-1 blankbox"></div>
				<div class="col-md-5 boxone blankbox">				
					<c:url var="searchAction" value="/search" />
					<form id="contact" class="searchForm" action="${searchAction}" method="GET">
						<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
						
						<h1>Search by Name</h1><br>
	
						<fieldset>
							<input type="text" name="name" id="name" placeholder="Landmark Name" /> <br><br>						
						</fieldset>
						
						<fieldset>
						
						</fieldset>
						
						<fieldset>
							<button type="submit" class="btn btn-md btn-block btn-primary" id="">Search</button>						
						</fieldset>
		
					</form>
				</div>
			
				<div class="col-md-5 blankbox">		
					<c:url var="searchAction" value="/proximitySearch" />
					<form id="contact" class="searchForm" action="${searchAction}" method="GET">
						<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
					
						<h1>Search by Proximity</h1><br>

						<fieldset>
							<input type="text" name="city" id="city" placeholder="City" /><br>	
						</fieldset>	
						
						<fieldset id="search-radio-btn">
							<input type="radio" name="radius" value="1"> 1 Mile
							<input type="radio" name="radius" value="3"> 3 Miles
							<input type="radio" name="radius" value="5"> 5 Miles						
							<input type="radio" name="radius" value="10"> 10 Miles						
							<input type="radio" name="radius" value="15"> 15 Miles
						</fieldset>
						
						<fieldset>
							<button type="submit" class="btn btn-md btn-block btn-primary sButton" id="searchLink">Search</button>	
						</fieldset>
					</form>
				</div>
				<div class="col-md-1 blankbox"></div>
			</div>
		</div>
	</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />