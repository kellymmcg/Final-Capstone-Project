package com.techelevator.city.controller;

	import java.util.Map;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.transaction.annotation.Transactional;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;

	
	import com.techelevator.city.model.UserDAO;

	@Transactional
	@Controller
	public class HomeController {

		private UserDAO userDAO;

		@Autowired
		public HomeController(UserDAO userDAO) {
			this.userDAO = userDAO;
		}
		
		@RequestMapping(path="/", method=RequestMethod.GET)
		public String showHomePage() {
			return "homePage";
		}
		
}
