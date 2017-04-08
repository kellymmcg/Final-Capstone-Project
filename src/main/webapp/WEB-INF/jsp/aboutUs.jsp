<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="aboutUs">
	<h1>About Us</h1>
</div>
<div class="container-fluid">
	<div class="row">
		<!-- Kevin Crumedy -->
			<div class="col-md-3">
				<div class="cardClass">
					<img src="img/kevin.jpg" alt="Kevin" style="width: 100%">
					<div class="contactContainer">
						<h2>Kevin Crumedy</h2>
						<p class="cardTitle">Java Developer</p>
						<p class="cardDescript">Tech Elevator</p>
    					<form class="contactButton" action="https://www.linkedin.com/in/kevin-crumedy-b224ab134/">
						<button class="contactButton">LinkedIn</button>
					</form>
					</div>
				</div>
			</div>
		
		
			<!-- Adam Gonzalez-->
			<div class="col-md-3">
			<div class="cardClass">
				<img src="img/adam.jpg" alt="Adam" style="width: 100%">
				<div class="contactContainer">
					<h2>Adam Gonzalez</h2>
					<p class="cardTitle">Java Developer</p>
						<p class="cardDescript">Tech Elevator</p>
					<form class="contactButton" action="https://www.linkedin.com/in/adam-gonzalez-7608917b/">
						<button class="contactButton">LinkedIn</button>
					</form>
				</div>
			</div>
			</div>

			<!-- Kelly McGowan -->
			<div class="col-md-3">
				<div class="cardClass">
					<img src="img/kelly.jpg" alt="Kelly" style="width: 100%">
					<div class="contactContainer">
						<h2>Kelly McGowan</h2>
						<p class="cardTitle">Java Developer</p>
						<p class="cardDescript">Tech Elevator</p>
						<form class="contactButton" action="https://www.linkedin.com/in/iamkellymcg/">
							<button class="contactButton">LinkedIn</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Alexis Thomas -->
			<div class="col-md-3">
				<div class="cardClass">
					<img src="img/alexis.jpg" alt="Alexis" style="width: 100%">
					<div class="contactContainer">
						<h2>Alexis Thomas</h2>
						<p class="cardTitle">Java Developer</p>
						<p class="cardDescript">Tech Elevator</p>
						<form class="contactButton" action="https://www.linkedin.com/in/athomas2197/">
							<button class="contactButton">LinkedIn</button>
						</form>
					</div>
				</div>
			</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />