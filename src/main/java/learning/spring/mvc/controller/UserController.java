package learning.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import learning.spring.mvc.model.User;
import learning.spring.mvc.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userservice;

    @ResponseBody
    @PostMapping("/addUser")
    public User addUser(@RequestBody User user) {

        userservice.addUser(user);

        return user;
    }

    @ResponseBody
    @GetMapping("/getUser/{id}")
    public User getUser(@PathVariable(name = "id") int id) {

        return userservice.validateUser(id);
    }

    @ResponseBody
    @GetMapping("/getAllUser")
    public List<User> getAllUser() {

        return userservice.getAllUsers();
    }
    
    @GetMapping("/signup")
    public String showSignup() {
        return "iblogsignup";
    }
    @PostMapping("/processSignup")
    public String processSignup(@ModelAttribute("user") User user) {

        userservice.addUser(user);

        System.out.println("New User Registered: " + user);

        return "ibloglogin";
    }
    @GetMapping("/login")
    public String showLogin() {
        return "ibloglogin";
    }
    @PostMapping("/processLogin")
    public String processLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model) {

        User user = userservice.loginUser(username, password);

        if (user != null) {
            model.addAttribute("user", user);
            return "redirect:/";
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";
    }
}