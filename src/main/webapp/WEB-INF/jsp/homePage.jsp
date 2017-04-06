<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
         <div class="item active">
                <img src="img/homepageone.jpg">
             
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="img/registration.jpg" width="auto" height="auto">
           
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="img/computer.jpg" width="1000" height="100">
        
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="img/enjoy.jpg" width="1000" height="100">
            </div>
            <!-- End Item -->
        </div>
        <!-- End Carousel Inner -->
        <ul class="nav nav-pills nav-justified">
            <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#">Search<br><small>Search landmarks and tourist attraction</small></a></li>
            <li data-target="#myCarousel" data-slide-to="1"><a href="#">Join Us!<br><small>Sign up for an account to get added Tour du City perks!</small></a></li>
            <li data-target="#myCarousel" data-slide-to="2"><a href="#">Create & Save<br><small>Create and save itineraries when you sign up with Tour du City!</small></a></li>
            <li data-target="#myCarousel" data-slide-to="3"><a href="#">Enjoy!</a></li>
        </ul>
    </div>
    <!-- End Carousel -->
</div>

<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
         <div class="item active">
                <img src="http://images.yuppcdn.net/bazaar/20161124204954623186/1480000794638.jpg">
             
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="http://images.yuppcdn.net/bazaar/20161219130950950809/1482133190966.jpg">
           
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="http://images.yuppcdn.net/bazaar/20161219120644711101/1482129404711.jpg">
        
            </div>
            <!-- End Item -->
            <div class="item">
                <img src="http://images.yuppcdn.net/images/20161021150745619424/1477042665635.jpg">
            </div>
            <!-- End Item -->
        </div>
        <!-- End Carousel Inner -->
        <ul class="nav nav-pills nav-justified">
            <li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#">About<small>Lorem
                ipsum dolor sit</small></a></li>
            <li data-target="#myCarousel" data-slide-to="1"><a href="#">Projects<small>Lorem ipsum
                dolor sit</small></a></li>
            <li data-target="#myCarousel" data-slide-to="2"><a href="#">Portfolio<small>Lorem ipsum
                dolor sit</small></a></li>
            <li data-target="#myCarousel" data-slide-to="3"><a href="#">Services<small>Lorem ipsum
                dolor sit</small></a></li>
        </ul>
    </div>
    <!-- End Carousel -->
</div>





<c:import url="/WEB-INF/jsp/footer.jsp" />