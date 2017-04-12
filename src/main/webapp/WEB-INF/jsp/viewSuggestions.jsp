<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="container">
	<div class="row currentRow">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<p class="iTitle">Landmark Suggestions</p>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-list">
							<tr>
								<th><h4>Username</h4></th>
								<th><h4>Landmark Name</h4></th>
								<th><h4>Address</h4></th>
								<th><h4>Description</h4></th>
								<th align="center" class="aLine"><h4>Action</h4></th>

							</tr>
							<c:forEach items="${suggestions}" var="suggestions">
								<tr>
									<td>${suggestions.userName}</td>
									<td>${suggestions.name}</td>
									<td>${suggestions.address}</td>
									<td>${suggestions.description}</td>
									
									<c:url var="deleteAction" value="/viewSuggestions"/>
									<td align="center" class="aLine">
										<form action="${deleteAction}" method="POST" id="postSuggestionForm" class="aForm">
										<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
										<input type="hidden" name="id" value="${suggestions.id}"/>
										<span><button class="btn btn-default dButton" type="submit"><i class="glyphicon glyphicon-trash"></i></button></span>
										</form>
									</td>
									
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />