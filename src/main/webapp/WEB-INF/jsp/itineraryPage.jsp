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
                            <tr>
                            <c:forEach items="${landmarks}" var="landmark" varStatus="count">
                                <td class="col-md-1 text-center">${count.count}</td>
                                <td class="col-md-3">${landmark.name}</td>
                                <td class="col-md-3" style="text-align: center"></td>
                                <td class="col-md-2 text-center"><strong>${landmark.admission}</strong></td>
                                <td class="col-md-1 text-center"><strong><i class="glyphicon glyphicon-remove"></i></strong></td>
                                
                            </c:forEach> 
                            </tr>
                           
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-right"><h5>HOLD</h5></td>
                                <td class="text-center"><h5><strong>$24.59</strong></h5></td>
                            </tr>
                           
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-8">
                            <a href="/checkout" class="btn">
                                Generate Travel Route<span class="glyphicon glyphicon-play"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />