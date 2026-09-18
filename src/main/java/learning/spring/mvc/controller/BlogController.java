package learning.spring.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import learning.spring.mvc.model.Post;
import learning.spring.mvc.model.User;
import learning.spring.mvc.service.PostService;

@Controller
public class BlogController {

    @Autowired
    private PostService postService;


    // =========================================================
    // SHOW ADD BLOG PAGE
    // =========================================================

    @GetMapping("/addBlog")
    public String showAddBlog(HttpSession session) {

        User user =
                (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        return "iblogaddblog";
    }


    // =========================================================
    // PROCESS NEW BLOG
    // =========================================================

    @PostMapping("/processBlog")
    public String processBlog(
            @ModelAttribute Post post,
            @RequestParam(
                    value = "image",
                    required = false)
            MultipartFile image,
            HttpSession session)
            throws IOException {

        User user =
                (User) session.getAttribute("loggedInUser");

        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }

        // Set author from logged-in user
        post.setAuthor(user.getUsername());


        // =====================================================
        // IMAGE UPLOAD
        // =====================================================

        if (image != null && !image.isEmpty()) {

            String originalFileName =
                    image.getOriginalFilename();

            String fileExtension = "";

            if (originalFileName != null
                    && originalFileName.contains(".")) {

                fileExtension =
                        originalFileName.substring(
                                originalFileName.lastIndexOf("."));
            }

            String fileName =
                    System.currentTimeMillis()
                    + fileExtension;


            String uploadDirectory =
                    session.getServletContext()
                           .getRealPath("/img/blogs");

            File directory =
                    new File(uploadDirectory);

            if (!directory.exists()) {
                directory.mkdirs();
            }


            File destination =
                    new File(directory, fileName);

            image.transferTo(destination);

            post.setImageName(fileName);
        }


        // PostService automatically sets:
        // createdAt = current time
        // status = PENDING

        postService.addPost(post);

        // After submitting, return to homepage
        return "redirect:/";
    }


    // =========================================================
    // SHOW ALL APPROVED BLOGS
    // =========================================================

    @GetMapping("/blogs")
    public String showAllBlogs(Model model) {

        List<Post> posts =
                postService.getApprovedPosts();

        model.addAttribute(
                "posts",
                posts);

        return "iblogblogs";
    }


    // =========================================================
    // SHOW ONE APPROVED BLOG
    // =========================================================

    @GetMapping("/blogpost/{id}")
    public String showBlog(
            @PathVariable("id") int id,
            Model model) {

        Post post =
                postService.getApprovedPostById(id);

        // If post doesn't exist OR isn't approved
        if (post == null) {
            return "redirect:/";
        }

        model.addAttribute(
                "post",
                post);

        return "iblogblogpost";
    }


    // =========================================================
    // SEARCH APPROVED BLOGS
    // =========================================================

    @GetMapping("/search")
    public String search(
            @RequestParam("query") String query,
            Model model) {

        List<Post> posts =
                postService.searchApprovedPosts(query);

        model.addAttribute(
                "posts",
                posts);

        model.addAttribute(
                "query",
                query);

        return "iblogblogs";
    }


    // =========================================================
    // SHOW UPDATE BLOG PAGE
    // =========================================================

    @GetMapping("/updateBlog/{id}")
    public String showUpdateBlog(
            @PathVariable("id") int id,
            HttpSession session,
            Model model) {

        User user =
                (User) session.getAttribute("loggedInUser");

        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        // Get post regardless of status
        Post post =
                postService.getPostById(id);

        if (post == null) {
            return "redirect:/";
        }


        // Only the owner can update the blog
        if (!post.getAuthor()
                .equals(user.getUsername())) {

            return "redirect:/";
        }


        model.addAttribute(
                "post",
                post);

        return "iblogupdateblog";
    }


    // =========================================================
    // PROCESS BLOG UPDATE
    // =========================================================

    @PostMapping("/processUpdateBlog")
    public String processUpdateBlog(
            @ModelAttribute Post updatedPost,
            @RequestParam(
                    value = "image",
                    required = false)
            MultipartFile image,
            HttpSession session)
            throws IOException {

        User user =
                (User) session.getAttribute("loggedInUser");


        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        // Get existing post
        Post existingPost =
                postService.getPostById(
                        updatedPost.getId());

        if (existingPost == null) {
            return "redirect:/";
        }


        // Only owner can update
        if (!existingPost.getAuthor()
                .equals(user.getUsername())) {

            return "redirect:/";
        }


        // Update title
        existingPost.setTitle(
                updatedPost.getTitle());


        // Update content
        existingPost.setContent(
                updatedPost.getContent());


        // =====================================================
        // NEW IMAGE
        // =====================================================

        if (image != null && !image.isEmpty()) {

            String originalFileName =
                    image.getOriginalFilename();

            String fileExtension = "";

            if (originalFileName != null
                    && originalFileName.contains(".")) {

                fileExtension =
                        originalFileName.substring(
                                originalFileName.lastIndexOf("."));
            }

            String fileName =
                    System.currentTimeMillis()
                    + fileExtension;


            String uploadDirectory =
                    session.getServletContext()
                           .getRealPath("/img/blogs");

            File directory =
                    new File(uploadDirectory);

            if (!directory.exists()) {
                directory.mkdirs();
            }


            File destination =
                    new File(directory, fileName);

            image.transferTo(destination);

            existingPost.setImageName(fileName);
        }


        // =====================================================
        // IMPORTANT:
        // Edited blog needs admin approval again
        // =====================================================

        existingPost.setStatus("PENDING");


        postService.updatePost(existingPost);


        return "redirect:/";
    }


    // =========================================================
    // DELETE BLOG
    // =========================================================

    @GetMapping("/deleteBlog/{id}")
    public String deleteBlog(
            @PathVariable("id") int id,
            HttpSession session) {

        User user =
                (User) session.getAttribute("loggedInUser");


        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        Post post =
                postService.getPostById(id);

        if (post == null) {
            return "redirect:/";
        }


        // Only owner can delete
        if (!post.getAuthor()
                .equals(user.getUsername())) {

            return "redirect:/";
        }


        postService.deletePost(id);


        return "redirect:/";
    }
}