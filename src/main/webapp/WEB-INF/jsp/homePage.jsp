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
                  <h4>We Help You Estimate!</h4>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                </div>
              </div>
              <div data-slide-no="1" class="item carousel-item">
                <img src="img/registrationre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>second thumbnail</h4>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                </div>
              </div>
              <div data-slide-no="2" class="item carousel-item">
                <img src="img/computerre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Third Thumbnail label</h4>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                </div>
              </div>
               <div data-slide-no="3" class="item carousel-item">
                <img src="img/enjoyre.jpg" alt="">
                <div class="carousel-caption">
                  <h4>Third Thumbnail label</h4>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                </div>
              </div>
            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#carousel" data-slide="prev"><</a>
            <a class="carousel-control right" href="#carousel" data-slide="next">></a>
          </div>
          <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="myCarousel-target active"></li>
            <li data-target="#carousel" data-slide-to="1" class="myCarousel-target"></li>
            <li data-target="#carousel" data-slide-to="2" class="myCarousel-target"></li>
            <li data-target="#carousel" data-slide-to="3" class="myCarousel-target"></li>
          </ol>

      </div>
    </div>
  </div>
<c:import url="/WEB-INF/jsp/footer.jsp" />