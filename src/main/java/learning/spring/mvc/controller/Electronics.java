
package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api3")
public class Electronics {
	
	@RequestMapping("/")
	public String hello() {
		System.out.println("Welcome3");
		return "/electronics";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		System.out.println("admin3");
		return "/admin";
	}
	@RequestMapping("/order")
	public String order() {
		System.out.println("order3");
		return "order";
	}
	@RequestMapping("/CEO")
	public String redirect() {
		System.out.println("redirect to admin3");
		return "redirect:/api3/admin";       
	}
	

}


