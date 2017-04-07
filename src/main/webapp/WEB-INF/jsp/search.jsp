<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="imgNameLink" value="img/openBook.png" />
<c:url var="imgProxLink" value="img/mapOnTable.png" />
<br><br>
<div class="container">
    <div class="col-sm-5 col-sm-offset-1">
    	 <h3>&bull; Search by Name &bull;</h3>
         <div class="thumbnail">
                <div class="caption">
                    <c:url var="searchAction" value="/search"/>
					<form action="${searchAction}" method="GET" id="searchForm">
						<h2 class="hOverlay">&bull; Search by Name &bull;</h2>
						<p class="sOverlay">Returns a list of Landmarks with names matching your search!</p><br>
						<input type="text" name="name" id="name" placeholder="Landmark Name"/><br>
						<button type="submit" class="btn btn-md btn-block btn-primary sButton" id="searchLink">Search!</button>
					</form>
                </div>
                <img src="${imgNameLink}">
            </div>
      </div>
      
      <div class="col-sm-5">
      	 <h3>&bull; Search by Proximity &bull;</h3>
         <div class="thumbnail">
                <div class="caption">
                    <h2 class="hOverlay">&bull; Search by Proximity &bull;</h2>
                    <p class="sOverlay">Returns a list of Landmarks around your area!</p><br>
                    <input type="text" name="cityName" id="cityName" placeholder="City"/>
                    <input type="text" name="stateName" id="stateName" placeholder="State"/><br><br>
                    <input type="text" name="radius" id="radius" placeholder="Radius"/>
                    
                </div>
                <img src="${imgNameLink}">
            </div>
      </div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />