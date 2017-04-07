<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container">
    <div class="row">
      <div class="span12 carousel-container">
          <div id="carousel" class="carousel slide carousel-fade">

            <!-- Carousel items -->
            <div class="carousel-inner">
              <div data-slide-no="0" class="item carousel-item active">
                <img src="img/homepageonere.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Search</h4>
                  <p>Find landmarks and tourist attractions by city</p>
                </div>
              </div>
              <div data-slide-no="1" class="item carousel-item">
                <img src="img/registrationre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Join Us!</h4>
                  <p>Sign up for a Tour du City account</p>
                </div>
              </div>
              <div data-slide-no="2" class="item carousel-item">
                <img src="img/computerre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Create and Save</h4>
                  <p>Create and save itineraries</p>
                </div>
              </div>
               <div data-slide-no="3" class="item carousel-item">
                <img src="img/enjoyre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Enjoy</h4>
                  <p>Use your itinerary to help make your trip a breeze!</p>
                </div>
              </div>
            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#carousel" data-slide="prev"><</a>
            <a class="carousel-control right" href="#carousel" data-slide="next">></a>
          </div>
      </div>
    </div>
  </div>
<c:import url="/WEB-INF/jsp/footer.jsp" />