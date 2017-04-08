<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/homepageonere.jpg" class="img-responsive">
      <div class="carousel-caption">
       <h4>Search</h4>
                  <p>Find landmarks and tourist attractions by city</p>
      </div>
    </div>

    <div class="item">
     <img src="img/registrationre.jpg" alt="">
      <div class="carousel-caption">
        <h4>Join Us!</h4>
                  <p>Sign up for a Tour du City account</p>
                </div>
    </div>

    <div class="item">
      <img src="img/computerre.jpg" alt="">
      <div class="carousel-caption">
        <h4>Create and Save</h4>
                  <p>Create and save itineraries</p>
                </div>
    </div>

    <div class="item">
      <img src="img/enjoyre.jpg" alt="">
      <div class="carousel-caption">
        <h3>Enjoy!</h3>
        <p>Use your itinerary to help make your trip a breeze</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />