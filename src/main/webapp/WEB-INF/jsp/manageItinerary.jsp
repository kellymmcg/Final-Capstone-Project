<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="container">
	<div class="row">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="panel-title">Your Itineraries</p>
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create iButton create"><span class="glyphicon glyphicon-plus"></span> Create</button>
						<button type="button" class="btn btn-sm btn-primary btn-create iButton explore"><span class="glyphicon glyphicon-search"></span> Explore Locations</button>
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
					<c:forEach items="${itineraries}" var="itinerary">
						<tr>
							<td align="center" class="view">
							<c:url var="itineraryAction" value="/manageItinerary"/>
							<form action="${itineraryAction}" method="GET" id="itineraryForm">
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default eButton" type="submit"><i class="glyphicon glyphicon-eye-open"></i> View</button></span> 
							</form>	
							<td class="hidden-xs">${itinerary.dateCreated}</td>
							<td>${itinerary.name}</td>
							<td>${itinerary.description}</td>
							<c:url var="itineraryAction" value="/manageItinerary"/>
							<td align="center" class="action">
							<form action="${itineraryAction}" method="POST" id="postItineraryForm">
								<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
								<input type="hidden" name="userName" value="<c:out value='${itinerary.userName}'/>"/>
								<input type="hidden" name="name" value="<c:out value='${itinerary.name}'/>"/>
								<span><button class="btn btn-default dButton" type="submit"><i class="glyphicon glyphicon-trash"></i></button></span>
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