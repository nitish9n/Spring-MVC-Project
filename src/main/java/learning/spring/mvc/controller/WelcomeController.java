package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

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
		model.addAttribute("myModel", bookName);  // adding msg to model
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
	// response body-> it bypass jsp page and return data directly into http response
	@RequestMapping("/response")
	@ResponseBody
	public String responseBody(@RequestParam(value="name") String n1) {
		System.out.println("Welcome "+n1);
		return "Welcome "+n1;     // no need of .jsp page(view)
		
	}
	
	// get system cookies
	@RequestMapping("/getCookie")
	public String getCookies(@CookieValue(value="JSESSIONID") String c, Model model) {
		System.out.println("This is cookie: "+c);
		model.addAttribute("sessionId", c);
		return "cookie";     
		
	}
	// create own cookies
	@RequestMapping("/setMyCookie")
	public String setMyCookies(HttpServletResponse response, Model model) {
		
		Cookie cookie1 = new Cookie("firstCookie", 	"SENSITIVEINFORMAION");
		cookie1.setMaxAge(10);       // expiry
		response.addCookie(cookie1); //it will set cookie to the whoever will search url
		
		return "redirect:/getMyCookie";     
		
	}
	
	@RequestMapping("/getMyCookie")
	public String getMyCookies(@CookieValue(value="firstCookie") String c, Model model) {
		System.out.println("This is cookie: "+c);
		model.addAttribute("sessionId", c);
		return "cookie"; 
	}

}


