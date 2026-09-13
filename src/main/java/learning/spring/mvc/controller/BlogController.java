package learning.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import learning.spring.mvc.model.Post;
import learning.spring.mvc.model.User;
import learning.spring.mvc.service.PostService;

@Controller
public class BlogController {

    @Autowired
    private PostService postService;


    // ================= ADD BLOG PAGE =================

    @GetMapping("/addBlog")
    public String showAddBlog(
            HttpSession session) {

        User user =
                (User) session.getAttribute(
                        "loggedInUser");

        // User must login first
        if (user == null) {

            return "redirect:/login";
        }

        return "addblog";
    }


    // ================= SAVE BLOG =================

    @PostMapping("/processBlog")
    public String processBlog(
            @ModelAttribute Post post,
            HttpSession session) {

        User user =
                (User) session.getAttribute(
                        "loggedInUser");

        if (user == null) {

            return "redirect:/login";
        }

        // Automatically set author
        post.setAuthor(
                user.getUsername());

        postService.addPost(post);

        return "redirect:/blogs";
    }


    // ================= ALL BLOGS =================

    @GetMapping("/blogs")
    public String showAllBlogs(
            Model model) {

        List<Post> posts =
                postService.getAllPosts();

        model.addAttribute(
                "posts",
                posts);

        return "blogs";
    }


    // ================= ONE BLOG =================

    @GetMapping("/blogpost/{id}")
    public String showBlog(
            @PathVariable int id,
            Model model) {

        Post post =
                postService.getPostById(id);

        model.addAttribute(
                "post",
                post);

        return "blogpost";
    }


    // ================= SEARCH =================

    @GetMapping("/search")
    public String search(
            @RequestParam("query") String query,
            Model model) {

        List<Post> posts =
                postService.searchPosts(query);

        model.addAttribute(
                "posts",
                posts);

        model.addAttribute(
                "query",
                query);

        return "blogs";
    }


    // ================= DELETE =================

    @GetMapping("/deleteBlog/{id}")
    public String deleteBlog(
            @PathVariable int id,
            HttpSession session) {

        User user =
                (User) session.getAttribute(
                        "loggedInUser");

        if (user == null) {

            return "redirect:/login";
        }

        postService.deletePost(id);

        return "redirect:/blogs";
    }
}
