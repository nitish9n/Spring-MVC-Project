package learning.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import learning.spring.mvc.model.Post;
import learning.spring.mvc.service.PostService;

@Controller
public class HomeController {

    @Autowired
    private PostService postService;

    @GetMapping("/")
    public String home(Model model) {

        // Get ALL posts from database
        List<Post> posts = postService.getAllPosts();

        // Send posts to homepage
        model.addAttribute("posts", posts);

        return "iblog";
    }

    @GetMapping("/about")
    public String about() {
        return "iblogabout";
    }

    @GetMapping("/contact")
    public String contact() {
        return "iblogcontact";
    }
}