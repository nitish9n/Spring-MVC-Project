package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "redirect:/admin";        // it will redirect to the admin page
	}
	

}


