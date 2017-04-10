<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="container">
	<div class="row">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">Your Itineraries</h3>
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create">Create
							New</button>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th><em class="fa fa-cog"></em></th>
							<th class="hidden-xs">ID</th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${itineraries}" var="itinerary">
						<tr>
							<td align="center">
							<c:url var="itineraryAction" value="/manageItinerary"/>
							<form action="${itineraryAction}" method="GET" id="detailForm">
								<input type="hidden" name="id" value="<c:out value='${itinerary.id}'/>"/>
								<span><button class="btn btn-default eButton" type="submit"><i class="glyphicon glyphicon-open-file"> View</i></button></span> 
							</form>	
							<td class="hidden-xs">${itinerary.id}</td>
							<td>${itinerary.name}</td>
							<td>${itinerary.description}</td>
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