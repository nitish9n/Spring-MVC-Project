package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api2")
public class WelcomeController2 {
	
	@GetMapping("/")
	public String hello() {
		System.out.println("hello2");
		return "index1";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		System.out.println("admin2");
		return "admin";
	}
	@RequestMapping("/order")
	public String order() {
		System.out.println("order2");
		return "order";
	}
	@RequestMapping("/CEO")
	public String redirect() {
		System.out.println("redirect to admin");
		return "redirect:/admin";        
	}
	

}


