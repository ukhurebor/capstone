package com.claim.FinalCapstone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AppController {
	
	@GetMapping("index")
	public String home(Model model) {
		return "index";
	}
	
	@GetMapping("home")
	public String homePage(Model model) {
		return "home";
	}
	
	@GetMapping("products")
	public String products(Model model) {
		return "products";
	}
	
//	@GetMapping("shop")
//	public String shopPage(Model model) {
//		return "shop";
//	}
	
	@GetMapping("contact")
	public String contactus(Model model) {
		model.addAttribute("msg", "this is contact page");
		return "contact";
	}
	
	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("msg", "Login");
		return "login";
	}
	
	@GetMapping("register")
	public String register(Model model) {
		model.addAttribute("msg", "Register");
		return "register";
	}
	
//	@GetMapping("admin")
//	public String admin(Model model) {
//		return "admin";
	
	}	



