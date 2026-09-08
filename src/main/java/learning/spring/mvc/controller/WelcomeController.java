package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WelcomeController {
	
	@RequestMapping("/")
	public String hello() {
		System.out.println("hello");
		return "index1";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		System.out.println("admin");
		return "admin";
	}
	@RequestMapping("/order")
	public String order() {
		System.out.println("order");
		return "order";
	}
	@RequestMapping("/CEO")
	public String redirect() {
		System.out.println("redirect to admin");
		return "redirect:/admin";        
	}
	
	
	// Request param
	@RequestMapping("/book")
	public String requestParam(@RequestParam(value="bookName", defaultValue="invalid") String bookName,
			@RequestParam(value="price", defaultValue="0") int price, 
			@RequestParam(value="location", defaultValue = "null") String location, 
			Model model) {
		model.addAttribute("myModel", bookName);
		model.addAttribute("mulya", price);
		model.addAttribute("address", location);
		
		return "myView";
		
		// http://localhost:8080/Spring-MVC-Project/book?bookName=java (single parameter)
		// http://localhost:8080/Spring-MVC-Project/book?bookName=java&price=100&location=bxr  (triple parameter)
	}
	
	// Path Variable
	@RequestMapping("/path-var/{id}")
	public String pathVariable(@PathVariable(value="id") int num, Model model) {
		model.addAttribute("pathVariable", num);
		return "myView";
		
	}
	

}


