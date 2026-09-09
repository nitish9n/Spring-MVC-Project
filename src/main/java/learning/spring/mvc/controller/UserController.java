package learning.spring.mvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import learning.spring.mvc.model.User;

@Controller
public class UserController {

    // 1. Show the signup page
    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        // Create an empty User object and add it to the model
        // This links to modelAttribute="user" in the JSP
        model.addAttribute("user", new User());
        
        return "signup"; 
    }

    // 2. Process the submitted form data
    @PostMapping("/processSignup")
    public String processSignupForm(@ModelAttribute("user") User user, Model model) {
    	
    	// At this point, Spring has automatically populated the 'user' object
    	// You can now save it to a database using a Service/DAO layer
//    	@ModelAttribute->takes the values submitted by an HTML/JSP form and puts them into a Java object
    	
    	System.out.println("New User Registered: " + user.toString());
    	
    	model.addAttribute("savedUser", user);
    	
    	return "admin"; 
    	
    }
    	// above code by requestParam
//    @PostMapping("/processSignup")
//    public String processSignupFormByRequestParam(@RequestParam("username") String username,
//    		@RequestParam("password") String password,
//    		@RequestParam("email") String email,
//    		@RequestParam("age") int age,
//    		@RequestParam("gender") String gender,
//    		@RequestParam("address") String address, Model model) {
//    	
//    	User user = new User();
//    	user.setUsername(username);
//        user.setPassword(password);
//        user.setEmail(email);
//        user.setAge(age);
//        user.setGender(gender);
//        user.setAddress(address);
//        System.out.println(user);
//        
//    	System.out.println("UserName is "+username);
//    	System.out.println("Password is "+password);
//    	System.out.println("Email is "+email);
//    	System.out.println("Age is "+age);
//    	System.out.println("Gender is "+gender);
//        System.out.println("Address is "+address);
//
//        
//        return "admin"; 
//    }
}
