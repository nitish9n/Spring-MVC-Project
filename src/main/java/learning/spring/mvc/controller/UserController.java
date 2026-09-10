package learning.spring.mvc.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import learning.spring.mvc.model.User;
import learning.spring.mvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
    	
        model.addAttribute("user", new User());
        
        return "signup"; 
    }

    @PostMapping("/processSignup")
    public String processSignupForm(@ModelAttribute("user") User user, Model model) {
    	
    	userservice.addUser(user);
    	System.out.println("New User Registered: " + user.toString());
    	model.addAttribute("savedUser", user);
    	
    	return "admin"; 
    	
    }
//    @PostMapping("/login")
//    public String logIn(@ModelAttribute("user") User user, Model model) {
//    	 
//    	System.out.println("You have login successfuly");
//    	
//    	return "login"; 
//    	 
//    }
    
    @GetMapping("/login")
    public String showLogInForm(Model model) {
    	System.out.println("showlogin");
        return "login"; 
    }
    
    
    @PostMapping("/login")
    public String processLoginFormByRequestParam(@RequestParam("username") String username,
    		@RequestParam("password") String password, Model model) {
    	
    	User validateUser = userservice.validateUser(username, password);
    	model.addAttribute("savedUser", validateUser);
    	
    	System.out.println("processLoginform");
    	if(validateUser != null) {
    		return "profile";
    	}else 
    	
        return "error"; 
    }
}
