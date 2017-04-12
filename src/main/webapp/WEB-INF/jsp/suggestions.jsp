<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />
<style>


.suggestlandmark .col-md-4 {
	font-family: "Roboto", Helvetica, Arial, sans-serif;
	font-weight: 400;
	font-size: 12px;
	line-height: 30px;
	color:  #fcb12f;
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: #21074F;
	border: 3px solid #fcb12f;
	border-radius: 14px;
	margin-bottom: 30px;
	width: 300px;
	text-align: center;
	display: block;
    margin-left: auto;
    margin-right: auto;
    
}

.suggestlandmark .col-md-3 {
	width: 20%;
}
.suggestlandmark .col-md-1 {
	width: 20%;
}

.suggestlandmark .button {
    background-color: rgba(33, 7, 79, 0.8);
    color: #FCB12F;
    padding: 20px 20px;
    text-align: center;
    display: center;
    font-size: 24px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
    border: 3px solid #FCB12F;
    border-radius: 15px;
}

.suggestlandmark .button:hover{
    background-color: #FCB12F;
    color: #21074F;
    padding: 20px 20px;
    text-align: center;
    text-decoration: none;
    display: center;
    font-size: 24px;
    margin: 4px 2px;
    cursor: pointer;
    border: 3px solid  #21074F;
    border-radius: 15px;
}

</style>

<div class = "suggestlandmark">
<br><br><br><br>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-1"></div>
		<div class="col-md-4">
			<c:url var="submitSuggestion" value="/suggestions" />
			<h3>Suggest a Landmark!</h3><br>
			<form action= "${submitSuggestion}" method="POST">
			<input type="hidden" name="CSRF_TOKEN" value="<c:out value='${CSRF_TOKEN}' />" />
				<input type="text" name="name" id="name" placeholder="Name"/><br/><br>
				<input type="text" name="address" id="address" placeholder="Address"/><br/><br>
				<textarea rows="5" cols="20" name="description" id="description" placeholder="Description"></textarea><br/>
				<input type="hidden" name="user" value="${currentUser}" />
				<button type="submit"
						class="btn btn-md btn-block btn-primary sButton" id="searchLink">Submit</button>
			</form>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-1"></div>
	</div>
<br><br><br><br>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />
