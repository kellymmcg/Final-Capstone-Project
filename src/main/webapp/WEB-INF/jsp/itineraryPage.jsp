<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>${itinerary.name}</strong> : ${itinerary.description}</div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Number</th>
                                <th>Landmark Name</th>
                                <th>???</th>
                                <th class="text-center">Admission</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${landmarks}" var="landmark" varStatus="count">
                            <tr>
                                <td class="col-md-1 text-center">${count.count}</td>
                                <td class="col-md-3">${landmark.name}</td>
                                <td class="col-md-3" style="text-align: center"></td>
                                <td class="col-md-2 text-center"><strong>${landmark.admission}</strong></td>
                                <td class="col-md-1 text-center"><strong><i class="glyphicon glyphicon-remove"></i></strong></td>
                                
                            </tr>
                            </c:forEach> 
                           
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-right"><h5>???</h5></td>
                                <td class="text-center"><h5><strong>???</strong></h5></td>
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