<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<footer class="footer-distributed">
			<div class="footer-right">
				<a href="https://www.facebook.com/techelevator/"><i class="fa fa-facebook"></i></a>
				<a href="https://twitter.com/Tech_Elevator"><i class="fa fa-twitter"></i></a>
				<a href="https://www.instagram.com/techelevator/"><i class="fa fa-instagram"></i></a>
				<a href="https://www.linkedin.com/school/6630211?pathWildcard=6630211"><i class="fa fa-linkedin"></i></a>
			</div>
			<div class="footer-left">
				<c:url var="aboutUsHref" value="/aboutUs"/>
				<c:url var="home" value="/"/>
				<p class="footer-links" id="mainFooterLinks">
					<a href="${home}">Home</a>
					<a href="${aboutUsHref}">· About Us</a>
				</p>
				<p>© Copyright 2017 Tour du City.</p>
			</div>
		</footer>
	</body>
</html>