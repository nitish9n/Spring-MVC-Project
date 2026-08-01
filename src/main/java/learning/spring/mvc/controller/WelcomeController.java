package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
	
	@RequestMapping("/greet")
	public String hello() {
		System.out.println("hello");
		return "index.jsp";
	}
	

}


