<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="container dWhole">
	<div class="card">
		<div class="container-fliud">
			<div class="wrapper row">
				<div class="preview col-md-6">
					<div class="preview-pic tab-content">
						<div class="tab-pane active" id="pic-1">
							<img src="${landmark.image}" class="img-responsive" height="400" />
						</div>
					</div>

				</div>
				<div class="details col-md-6">
					<h3 class="product-title">${landmark.name}</h3>
					<p>${landmark.address}</p>
					<div class="rating">
						<div class="stars">
							<span class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</div>
					</div>
					<br>
					<p class="product-description">${landmark.description}</p>
					<h4 class="price">
						Cost : <span>${landmark.admission}</span>
					</h4>

					<p class="dIcon c${landmark.handicapAccessible}">
						<span class="fa fa-wheelchair"></span> Handicap
					</p>
					<p class="dIcon c${landmark.consession}">
						<span class="fa fa-cutlery"></span> Concession
					</p>
					<p class="dIcon c${landmark.restroom}">
						<span class="fa fa-male"></span><span class="fa fa-female"></span>
						Restrooms
					</p>
					<p class="dIcon c${landmark.kidFriendly}">
						<span class="fa fa-users"></span> Kid Friendly
					</p>
					<p>
						<strong>Phone:</strong> ${landmark.phone}
					</p>
					<p>
						<strong>Website:</strong> ${landmark.website}
					</p>
				</div>
			</div>

			<div class="wrapper row">
				<div class="col-md-6">
					<h3></h3>
					<div id="mapD"></div>
					<script>
					function initMap() {
						var location = {
							lat : ${landmark.latitude},
							lng : ${landmark.longitude}
						};
						var map = new google.maps.Map(document.getElementById('mapD'), {
							zoom : 16,
							center : location
						});
						var marker = new google.maps.Marker({
							position : location,
							map : map
						});
					}
					</script>
					<script async defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5Cyxiz7vexNLr_2SLi_HoFXh4-xC31T8&callback=initMap"></script>
				</div>
				<c:choose>
					<c:when test="${not empty currentUser}">

						<div class="col-md-3">
							<div class="action">
								<c:url var="formAction" value="/addToItinerary" />
								<form id="contact" class="itineraryForm" action='${formAction}'
									method="POST">
									<p class="iAdd">Add to an existing Itinerary</p>
									<input type="hidden" name="CSRF_TOKEN"
										value="<c:out value='${CSRF_TOKEN}' />" /> <input
										type="hidden" name="landmarkId" value="${landmark.id}" /> <select
										name="id" class="iSelect">
										<c:forEach items="${itineraries}" var="itinerary">
											<option value="${itinerary.id}">${itinerary.name}</option>
										</c:forEach>
									</select>
									<button class="add-to-cart btn btn-default" type="submit">Add to Itinerary</button>
								</form>
							</div>
						</div>
						<div class="col-md-3">
							<div class="action">
								<c:url var="formAction" value="/landmarkDetails" />

								<form id="contact" class="itineraryForm" action='${formAction}'
									method="POST">
									<p class="iAdd">Create and add to a new Itinerary</p>
									<input type="hidden" name="CSRF_TOKEN"
										value="<c:out value='${CSRF_TOKEN}' />" /> <input
										type="hidden" name="user" value="${currentUser}" /> <input
										type="hidden" name="landmarkId" value="${landmark.id}" /> <input
										type="text" name="name" placeholder="New Itinerary Name" /> <input
										type="text" name="description"
										placeholder="Give a short description about it!" />
									<button class="add-to-cart btn btn-default" type="submit">Add to Itinerary</button>
								</form>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>


			<!--  REVIEWS GO HERE -->

			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<p class="iTitle">Reviews</p>
								</div>
								<div class="panel-body">
									<table class="table table-striped table-bordered table-list">
										<col width="80">
  										<col width="130">
  										<col width="270">
  										<col width="80">
										<tr>
											<th>User Name</th>
											<th>Title</th>
											<th>Review</th>
											<th class="col-md-3" align="center">Stars</th>
										</tr>
										<c:forEach items="${reviews}" var="review">
											<tr>
												<td>${review.userName}</td>
												<td>${review.title}</td>
												<td>${review.review}</td>
												<td><c:choose>
														<c:when test="${review.stars} == 5">

															<c:forEach begin="1" end="5">
																<img src="img/star.png">
															</c:forEach>

														</c:when>
														<c:otherwise>
															<c:forEach begin="1" end="${review.stars}">
																<img src="img/star.png">
															</c:forEach>
															<c:forEach begin="1" end="${5-review.stars}">
																<img src="img/emptystar.png">
															</c:forEach>
														</c:otherwise>
													</c:choose></td>

											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:url var="submitReview" value="/landmarkReviewSubmitted" />
			<form action="${submitReview}" method="POST">
				<input type="hidden" name="CSRF_TOKEN"
					value="<c:out value='${CSRF_TOKEN}' />" />
				<h5>Leave a review!</h5>
				<input type="text" name="title" id="title" placeholder="Title"/><br><br>
				<textarea rows="4" cols="10 " name="review" id="review" placeholder="Write your review here..."
					style="width: 100%"></textarea><br>
				<input type="hidden" name="user" value="${currentUser}" /> <input
					type="hidden" name="landmarkId" value="${landmark.id}" /> <select
					name="stars">
					<option value="1">1 Star</option>
					<option value="2">2 Star</option>
					<option value="3">3 Star</option>
					<option value="4">4 Star</option>
					<option value="5">5 Star</option>
				</select> <input type="submit" value="Submit" />

			</form>
		</div>
	</div>
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />