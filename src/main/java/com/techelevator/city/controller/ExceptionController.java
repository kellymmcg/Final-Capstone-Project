package com.techelevator.city.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.city.model.ResourceNotFoundException;

@Transactional
@Controller
public class ExceptionController {
		@ExceptionHandler(ResourceNotFoundException.class)
	    public String handleResourceNotFoundException() {
	        return "notfound";
	    }
	}

