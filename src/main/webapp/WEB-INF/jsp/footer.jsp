<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<footer>
			<div class="footerContent">
				<c:url var="contactUsHref" value="/contactUs"/>
				<b><a href="#">About Us</a><br>
				<a href="${contactUsHref}">Contact Us</a></b><br>
				<p>© Copyright 2017 Tour du City.</p>
			</div>
		</footer>
	</body>
</html>