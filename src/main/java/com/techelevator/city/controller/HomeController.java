package com.techelevator.city.controller;

	import java.util.Map;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.transaction.annotation.Transactional;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		public String displayHomePage() {
			return "homePage";
		}
		
		@RequestMapping(path="/loginPage", method=RequestMethod.GET)
		public String displayLoginPage() {
			return "loginPage";
		}
		
		@RequestMapping(path="/login", method=RequestMethod.POST)
		public String loginUser(@RequestParam String userName, @RequestParam String password, RedirectAttributes redir) {
			userDAO.saveUser(userName, password);
			redir.addFlashAttribute("notice", "Welcome back!");
			return "redirect:/";
		}
		
		@RequestMapping(path="/testPage", method=RequestMethod.GET)
		public String displayTestPage() {
			return "testPage";
		}
		
		@RequestMapping(path="/aboutUs", method=RequestMethod.GET)
		public String displayAboutUsPage() {
			return "aboutUs";
		}
		
}
