package com.techelevator.city.controller;

	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.jna.platform.win32.Netapi32Util.User;
import com.techelevator.city.model.Landmark;
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
		
		@RequestMapping(path="/loginPage", method=RequestMethod.POST)
		public String userLogin() {
			return "loginPage";
		}
		
		@RequestMapping(path="/login", method=RequestMethod.POST)
		public String loginUser(@RequestParam String userName, @RequestParam String password, RedirectAttributes redir) {
			userDAO.saveUser(userName, password);
			redir.addFlashAttribute("notice", "Welcome back!");
			return "redirect:/";
		}
		
		@RequestMapping(path="/testPage", method=RequestMethod.GET)
		public String displayTestPage(ModelMap model) throws JsonProcessingException {
			ObjectMapper mapper = new ObjectMapper();
			Landmark  landmark = new Landmark();
			landmark.setName("Test");
			model.put("json", mapper.writeValueAsString(landmark));
			return "testPage";
		}
		
		@RequestMapping(path="/aboutUs", method=RequestMethod.GET)
		public String displayAboutUsPage() {
			return "aboutUs";
		}
		
}
