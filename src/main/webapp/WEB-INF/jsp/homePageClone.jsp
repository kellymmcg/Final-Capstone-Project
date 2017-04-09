<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="bootstrap-touch-slider"
	class="carousel bs-slider fade  control-round indicators-line"
	data-ride="carousel" data-pause="hover" data-interval="5000">

	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#bootstrap-touch-slider" data-slide-to="0"
			class="active"></li>
		<li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
		<li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper For Slides -->
	<c:url var="formAction" value="/" />
	<c:url var="registration" value="/registration" />
	<div class="carousel-inner" role="listbox">

		<!-- Third Slide -->
		<div class="item active">

			<!-- Slide Background -->
			<img src="img/homepageonere.jpg" alt="Bootstrap Touch Slider"
				class="slide-image" />
			<div class="bs-slider-overlay"></div>

			<div class="container">
				<div class="row">
					<!-- Slide Text Layer -->
					<div class="slide-text slide_style_left">
						<h1 data-animation="animated zoomInRight">Discovery a new
							city!</h1>
						<p data-animation="animated fadeInLeft">Explore the historic
							landmarks your city has to offer.</p>
						<a href="${formAction}" target="_blank" class="btn btn-default"
							data-animation="animated fadeInLeft">Login</a> <a
							href="${registration}" target="_blank" class="btn btn-primary"
							data-animation="animated fadeInRight">Join Us</a>
					</div>
				</div>
			</div>
		</div>
		<!-- End of Slide -->

		<!-- Second Slide -->
		<div class="item">

			<!-- Slide Background -->
			<img src="img/search.jpg" alt="" class="slide-image" />
			<div class="bs-slider-overlay"></div>
			<!-- Slide Text Layer -->
			<div class="slide-text slide_style_center">
				<h1 data-animation="animated flipInX">Search for new landmarks
					to visit!</h1>
				<p data-animation="animated lightSpeedIn">Find details on each
					location.</p>
				<a href="http://bootstrapthemes.co/" target="_blank"
					class="btn btn-default" data-animation="animated fadeInUp">select
					one</a> <a href="http://bootstrapthemes.co/" target="_blank"
					class="btn btn-primary" data-animation="animated fadeInDown">select
					two</a>
			</div>
		</div>
		<!-- End of Slide -->

		<!-- Third Slide -->
		<div class="item">

			<!-- Slide Background -->
			<img src="img/create.jpg" alt="" class="slide-image" />
			<div class="bs-slider-overlay"></div>
			<!-- Slide Text Layer -->
			<div class="slide-text slide_style_right">
				<h1 data-animation="animated zoomInLeft">Create your next
					adventure!</h1>
				<p data-animation="animated fadeInRight">Just choose you
					landmarks and Tour du City will create your itinerary.</p>
				<a href="http://bootstrapthemes.co/" target="_blank"
					class="btn btn-default" data-animation="animated fadeInLeft">select
					one</a> <a href="http://bootstrapthemes.co/" target="_blank"
					class="btn btn-primary" data-animation="animated fadeInRight">select
					two</a>
			</div>
		</div>
		<!-- End of Slide -->


	</div>
	<!-- End of Wrapper For Slides -->

	<!-- Left Control -->
	<a class="left carousel-control" href="#bootstrap-touch-slider"
		role="button" data-slide="prev"> <span class="fa fa-angle-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a>

	<!-- Right Control -->
	<a class="right carousel-control" href="#bootstrap-touch-slider"
		role="button" data-slide="next"> <span class="fa fa-angle-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>

</div>
<!-- End  bootstrap-touch-slider Slider -->

<!-- SECTION 2 -->
<div class="jumbotron"><div>

<div class="container">
	<div class="row">
		<div class="col-sm-4">
			<img src="img/planning.jpg" class="img-circle person" alt="Search" width="255" height="255">
			<h3>Search</h3>
			<p>Visiting a new city? Or maybe </p>
			<p>Just search by city name or zipcode to see all of the nearby landmarks.</p>
		</div>
		<div class="col-sm-4">
			<img src="img/explore.jpg" class="img-circle person" alt="Discover" width="255" height="255">
			<h3>Discover</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
			<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
				laboris...</p>
		</div>
		<div class="col-sm-4">
			<img src="img/planner.jpg" class="img-circle person" alt="Plan" width="255" height="255">
			<h3>Plan</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
			<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
				laboris...</p>
		</div>
	</div>
</div>

<hr>
<div class="jumbotron text-center">
	<h1>My First Bootstrap Page</h1>
	<p>Resize this responsive page to see the effect!</p>
</div>






<div style="text-align: center; margin-top: 150px; margin-bottom: 100px">
	<h3>
		Check this in <a
			href="http://bootstrapthemes.co/demo/resource/BootstrapCarouselTouchSlider/"
			target="_blank"> Full Screen Preview </a> And Drag the Slider ;)
	</h3>
	/ Slide Carousel Also <a href="http://bootsnipp.com/snippets/Padax"
		target="_blank"> Available here </a>
</div>
<div style="text-align: center; margin-top: 150px; margin-bottom: 100px">
	| <a
		href="http://bootstrapthemes.co/item/bootstrap-carousel-touch-slider-with-text-animation/"
		target="_blank"> Snippet By Bootstrapthemes.co </a> |
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />