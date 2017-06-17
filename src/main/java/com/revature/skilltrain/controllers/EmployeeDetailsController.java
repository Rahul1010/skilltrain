package com.revature.skilltrain.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeDetailsController {
	
	@GetMapping("/")
	public String home(){
		return "/index.html";
	}
	
}
