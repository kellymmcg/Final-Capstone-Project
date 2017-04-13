<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="container">
	<div class="row currentRow">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="iTitle">Current Itineraries</p>
					</div>
					<div class="col col-xs-6 text-right">
						<c:url var="searchHref" value="/search"/>
						<a href="${searchHref}" class="exLink"><span class="glyphicon glyphicon-search"></span> Explore Locations</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th><em class="fa fa-cog"></em></th>
							<th class="hidden-xs">Date Created</th>
							<th>Name</th>
							<th>Description</th>
							<th align="center" class="aLine">Actions</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${cItineraries}" var="itinerary">
						<tr>
							<td align="center" class="viewM">
							<c:url var="itineraryAction" value="/manageItinerary"/>
							<form action="${itineraryAction}" method="GET" id="itineraryForm">
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default eButton" type="submit"><i class="glyphicon glyphicon-eye-open"></i> View</button></span> 
							</form>	
							<td class="hidden-xs">${itinerary.dateCreated}</td>
							<td>${itinerary.name}</td>
							<td>${itinerary.description}</td>
							<c:url var="deleteAction" value="/manageItinerary"/>
							<c:url var="completeAction" value="/completeItinerary"/>
							<td align="center" class="actionM">
							<form action="${deleteAction}" method="POST" id="postItineraryForm" class="aForm">
								<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
								<input type="hidden" name="userName" value="<c:out value='${itinerary.userName}'/>"/>
								<input type="hidden" name="name" value="<c:out value='${itinerary.name}'/>"/>
								<span><button class="btn btn-default dButton" type="submit"><i class="glyphicon glyphicon-trash"></i></button></span>
							</form>	
							<form action="${completeAction}" method="POST" id="postItineraryForm" class="aForm">
								<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default cButton" type="submit"><i class="glyphicon glyphicon-ok"></i></button></span>
							</form>	
							
							</td>
						
							
						</tr>
	
							
					
					</c:forEach>	
					</tbody>
				</table>

			</div>
			<div class="panel-footer">
				<!-- FOOTER ELEMENTS CAN GO HERE IF WANTED/NEEDED -->
			</div>
		</div>
	</div>
	
	<!-- SEPERATION BETWEEN THE TWO TABLES -->
	
	<div class="row completedRow">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="iTitle">Completed Itineraries</p>
					</div>
					<div class="col col-xs-6 text-right">
						
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th><em class="fa fa-cog"></em></th>
							<th class="hidden-xs">Date Created</th>
							<th>Name</th>
							<th>Description</th>
							<th align="center" class="aLine">Actions</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${pItineraries}" var="itinerary">
						<tr>
							<td align="center" class="viewM">
							<c:url var="itineraryAction" value="/manageItinerary"/>
							<form action="${itineraryAction}" method="GET" id="itineraryForm">
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default eButton" type="submit"><i class="glyphicon glyphicon-eye-open"></i> View</button></span> 
							</form>	
							<td class="hidden-xs">${itinerary.dateCreated}</td>
							<td>${itinerary.name}</td>
							<td>${itinerary.description}</td>
							<c:url var="deleteAction" value="/manageItinerary"/>
							<c:url var="incompleteAction" value="/incompleteItinerary"/>
							<td align="center" class="actionM">
							<form action="${deleteAction}" method="POST" id="postItineraryForm" class="aForm">
								<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
								<input type="hidden" name="userName" value="<c:out value='${itinerary.userName}'/>"/>
								<input type="hidden" name="name" value="<c:out value='${itinerary.name}'/>"/>
								<span><button class="btn btn-default dButton" type="submit"><i class="glyphicon glyphicon-trash"></i></button></span>
							</form>	
							<form action="${incompleteAction}" method="POST" id="postItineraryForm" class="aForm">
								<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default inButton" type="submit"><i class="glyphicon glyphicon-minus"></i></button></span>
							</form>	
							
							</td>
						
							
						</tr>
	
							
					
					</c:forEach>	
					</tbody>
				</table>

			</div>
			<div class="panel-footer">
				<!-- FOOTER ELEMENTS CAN GO HERE IF WANTED/NEEDED -->
			</div>
		</div>
	</div>
</div>




<c:import url="/WEB-INF/jsp/footer.jsp" />