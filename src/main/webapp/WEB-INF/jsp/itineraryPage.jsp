<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="panel panel-default">
            <c:url var="searchHref" value="/search"/>
                <div class="panel-heading"><strong>${itinerary.name}</strong> : ${itinerary.description} </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Number</th>
                                <th>Landmark Name</th>
                                <th class="text-center">Admission</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:url var="deleteLandmark" value="/itineraryPage"/>
                        	<c:forEach items="${landmarks}" var="landmark" varStatus="count">
                            <tr>
                                <td class="col-md-1 text-center">${count.count}</td>
                                <td class="col-md-3">${landmark.name}</td>
                                <td class="col-md-2 text-center"><strong>${landmark.admission}</strong></td>
                                <td class="col-md-1 text-center">
                                <form action="${deleteLandmark}" method="POST" id="removeItineraryForm" class="aForm">
									<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
									<input type="hidden" name="user" value="<c:out value='${itinerary.userName}'/>"/>
									<input type="hidden" name="id" value="<c:out value='${landmark.id}'/>"/>
									<input type="hidden" name="iId" value="<c:out value='${itinerary.id}'/>"/>
									<span><button class="btn btn-default dButton" type="submit"><i class="glyphicon glyphicon-trash"></i></button></span>
								</form>	
								</td>     
                            </tr>
                            </c:forEach> 
                           
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center"></td>
                            </tr>
                           
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-8">
                        	<c:url var="formAction" value="/generatedRoute" />
                        	<form id="contact" class="itineraryForm" action='${formAction}' method="GET">
                        		<input type="hidden" name="id" value="${itinerary.id}" />
                            	<button type="submit" class="btn btn-md btn-block btn-primary sButton" id="searchLink">Generate my Route!</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />