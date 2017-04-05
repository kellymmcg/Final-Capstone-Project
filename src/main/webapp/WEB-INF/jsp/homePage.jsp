<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<br><br><br><br><br><br><br><br><br><br><br><br><br>   <!-- Creating whitespace for now -- Be sure to delete this! -->

<div class="container-fluid theme-bg padding-50">
	<div class="row">
    	<div class="col-lg-12">
        	<div class="container">
            	<div class="row">
                	<div class="col-lg-6 col-lg-offset-1">
                        <p>
                        	<c:url var="suggestions" value="/landmarkSearch"/>
                            <a href="${suggestions}" class="btn btn-outlined btn-white btn-lg" data-wow-delay="0.7s"><span class="glyphicon glyphicon-search"></span> Search for a Landmark!</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />

