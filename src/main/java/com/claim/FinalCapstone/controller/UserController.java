package com.claim.FinalCapstone.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.claim.FinalCapstone.model.Addressess;
import com.claim.FinalCapstone.model.Role;
import com.claim.FinalCapstone.model.Users;
import com.claim.FinalCapstone.repository.AddressRepository;
import com.claim.FinalCapstone.repository.PaymentMethodRepository;
import com.claim.FinalCapstone.repository.RoleRepository;
import com.claim.FinalCapstone.repository.UserRepository;
import com.claim.FinalCapstone.utils.WebUtils;

@Controller
@SessionAttributes({"loggedInuser","role"})
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private WebUtils webUtils;
	
//	@Autowired
//	private DataValidation dataValidation;
	
	@Autowired
	private AddressRepository addressRepository;

	@Autowired
	private PaymentMethodRepository paymentMethodRepository;
	
	
	@Autowired
	private RoleRepository roleRepository;

	@PostMapping("register")
	@Transactional
	public String register(@ModelAttribute("users") Users user, Model model, BindingResult result, RedirectAttributes red) {	
		
//		dataValidation.validate(user, result);
//		if (result.hasErrors()) {
//		model.addAttribute("profile", "active");
//		return "signup";
//		}
			
		    userRepository.save(user);
		    user.setRole("USER");
			
			model.addAttribute("msg","Profile");
			model.addAttribute("user_account", user);
			model.addAttribute("loggedInuser", user.getEmail());
			//List<String> roles=user.getRoles().stream().map(x-> x.getRole()).distinct().collect(Collectors.toList());
			//model.addAttribute("role", user.getRole().stream().map(x-> x.getRole()).distinct().collect(Collectors.toList()));
		
	    return "profile";
	}
	
	@GetMapping("profile") 
	  String profile(@SessionAttribute(required = false) String loggedInuser, Model model) {
	     try {
	    	
	    	 //if user is not in session return login page expired session
			if(loggedInuser ==null || loggedInuser.isEmpty()) {
			 model.addAttribute("error", "Expired session, please Login");
			 return "login"; 
			 }
			//populate user details from database 
			 userRepository.findByEmail(loggedInuser).ifPresent(a->{
			 model.addAttribute("user_account", a);				 
//			 if(a.getAddress()!=null) {
//			    model.addAttribute("address", a.getAddress());	 
//			 }

			 });
			
			 model.addAttribute("page", "Profile");
		
	     } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	  return "profile";
	 }
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password){
	  // login user
	  Optional<Users> user= userRepository.login(email, password);
	 //add user email and role in session
	  if(user.isPresent()) {
		  model.addAttribute("loggedInuser", email);
		  //model.addAttribute("role", user.get().getRole().stream().map(x-> x.getRole()).distinct().collect(Collectors.toList())); 
		  
	  }else {
		  redirect.addFlashAttribute("error", "Sorry Invalid Credentials");
		  return "redirect:/login";
	  }
	  
	return "redirect:/profile";
		
	}

	@GetMapping("logout")
	String logout(Model model, SessionStatus status, HttpSession session){
		//status.setComplete();
		session.invalidate();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("msg", "You have been Logged out");
	
	return "login";
		
	}

	@GetMapping("expired")
	String expire(Model model, HttpSession session){
		session.invalidate();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");
		model.addAttribute("error", "You have logged out due to inactivity");	
		
	return "login";
		
	}
	
	@GetMapping("signup")
	String signup(Model model){
		model.addAttribute("users", new Users());
	return "signup";
		
	}
	
	
	@GetMapping("deleteUser")
	public String delete(@RequestParam Long id, RedirectAttributes red) {
		
		try {
			userRepository.deleteById(id);
			red.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:admin";
	}
	
	@GetMapping("deleteByemail")
	public String dleteByemail(@RequestParam String email, RedirectAttributes red) {
				
		try {
			userRepository.delete(userRepository.findByEmail(email).get());
			red.addFlashAttribute("success", "user deleted");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			red.addFlashAttribute("error", " Sorry unexpected error delete fail");
		}
		
		return "redirect:admin";
	}
	
	
	@GetMapping("admin")
	public String users(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
				        @RequestParam(value = "size", defaultValue = "4", required = false) Integer size, @SessionAttribute(required = false) String role) {
    	    
    	    try {
    	    	model.addAttribute("users", "active");
    	    	Page<Users> findAllPagable = userRepository.findAll(PageRequest.of(page, size, Sort.by("fname")));				
				model.addAttribute("list", findAllPagable);
				model.addAttribute("msg"," Users found");
			  } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
		return "admin";
		
	}
	
	@PostMapping("updateUsers")
	public String update(@ModelAttribute Users user, Model model, RedirectAttributes red) {	
		
		try {
			
			  userRepository.findById(user.getId()).ifPresent(a->{
			  a.setFname(user.getFname()); a.setLname(user.getLname());
			  a.setRole(user.getRole()); userRepository.save(a);
			  
			  });
			 
			 
			 //userRepository.save(user);
			 red.addFlashAttribute("success", "User Updated"); 
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		//red.addFlashAttribute("error", "User Exists");
			
		
	  return "redirect:admin";
	}
	
	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf|mp4))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addFlashAttribute("error", "Invalid Image type "); 
			      return "redirect:profile";			  
			  }
			
			   //webUtils.addProfilePhoto(file, id, "users");
				
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam String subject,
					 @RequestParam String message, RedirectAttributes red) {
		
			try {
				webUtils.sendMail(email, message+" From "+ name, subject);
				red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Email fail! ");
			}		
	 
	return "redirect:contact";		
	}
	
	@PostMapping("search")
	public String search(Model model, @RequestParam String keyword) {
		
		Page<Users> users=userRepository.search(keyword, PageRequest.of(0, 4, Sort.by("id")));
		//model.addAttribute("list", users);
		model.addAttribute("msg"," Users found");
		
		return "admin";
	}
	
	@PostMapping("editrole")
	public String editrole(Model model, @RequestParam String role, @RequestParam Long id) {
		
		/*
		 * userRepository.findById(id).ifPresent(a->{ a.setRole(role);
		 * userRepository.save(a); });
		 */
		userRepository.findById(id).
		ifPresent(a->{	
			a.setRole(role);
			if(role.equals("ADMIN")) {
				a.setRole("ADMIN");
				userRepository.save(a);
			}
			else {
				a.setRole("USER");
				userRepository.save(a);
			}				
		});
		return "profile";
	
	}
	
	@PostMapping("seachByemailOrlastname")
	public String seachByemailOrlastname(Model model, @RequestParam String lname, @RequestParam String email) {
		
		Page<Users> users=userRepository.customeseacher(lname, email, PageRequest.of(0, 4, Sort.by("id")));
		model.addAttribute("list", users);
		model.addAttribute("msg"," Users found");
		
		return "admin";

	
	}


}


