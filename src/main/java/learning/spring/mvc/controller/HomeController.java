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


    // =========================================================
    // HOME PAGE
    // =========================================================

    @GetMapping("/")
    public String home(Model model) {

        List<Post> posts =
                postService.getApprovedPosts();

        model.addAttribute(
                "posts",
                posts);

        return "iblog";
    }


    // =========================================================
    // ABOUT PAGE
    // =========================================================

    @GetMapping("/about")
    public String about() {

        return "iblogabout";
    }
}