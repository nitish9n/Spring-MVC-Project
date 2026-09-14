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

        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }

        return "iblogaddblog";
    }


    // =========================================================
    // PROCESS ADD BLOG
    // =========================================================

    @PostMapping("/processBlog")
    public String processBlog(
            @ModelAttribute Post post,
            @RequestParam(value = "image", required = false)
            MultipartFile image,
            HttpSession session) throws IOException {

        User user =
                (User) session.getAttribute("loggedInUser");

        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }

        // Set logged-in user's username as author
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


            // Create a unique filename
            String fileName =
                    System.currentTimeMillis()
                    + fileExtension;


            // Get /img/blogs directory
            String uploadDirectory =
                    session.getServletContext()
                           .getRealPath("/img/blogs");


            File directory =
                    new File(uploadDirectory);


            // Create directory if it doesn't exist
            if (!directory.exists()) {
                directory.mkdirs();
            }


            // Create destination file
            File destination =
                    new File(directory, fileName);


            // Save uploaded image
            image.transferTo(destination);


            // Store only filename in database
            post.setImageName(fileName);
        }


        // Save post in MySQL
        postService.addPost(post);


        // Go back to homepage
        return "redirect:/";
    }


    // =========================================================
    // SHOW ALL BLOGS
    // =========================================================

    @GetMapping("/blogs")
    public String showAllBlogs(Model model) {

        List<Post> posts =
                postService.getAllPosts();

        model.addAttribute("posts", posts);

        return "iblogblogs";
    }


    // =========================================================
    // SHOW SINGLE BLOG
    // =========================================================

    @GetMapping("/blogpost/{id}")
    public String showBlog(
            @PathVariable("id") int id,
            Model model) {

        Post post =
                postService.getPostById(id);


        // If post doesn't exist
        if (post == null) {
            return "redirect:/";
        }


        model.addAttribute("post", post);

        return "iblogblogpost";
    }


    // =========================================================
    // SEARCH BLOGS
    // =========================================================

    @GetMapping("/search")
    public String search(
            @RequestParam("query") String query,
            Model model) {

        List<Post> posts =
                postService.searchPosts(query);

        model.addAttribute("posts", posts);
        model.addAttribute("query", query);

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

        // Get logged-in user
        User user =
                (User) session.getAttribute("loggedInUser");


        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        // Find the post
        Post post =
                postService.getPostById(id);


        // If post doesn't exist
        if (post == null) {
            return "redirect:/";
        }


        // =====================================================
        // OWNERSHIP CHECK
        // =====================================================

        /*
         * Only the user who created the post
         * can update it.
         */

        if (!post.getAuthor().equals(user.getUsername())) {
            return "redirect:/";
        }


        // Send existing post to update JSP
        model.addAttribute("post", post);

        return "iblogupdateblog";
    }


    // =========================================================
    // PROCESS UPDATE BLOG
    // =========================================================

    @PostMapping("/processUpdateBlog")
    public String processUpdateBlog(
            @ModelAttribute Post updatedPost,
            @RequestParam(value = "image", required = false)
            MultipartFile image,
            HttpSession session) throws IOException {

        // Get logged-in user
        User user =
                (User) session.getAttribute("loggedInUser");


        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        // Find the existing post from database
        Post existingPost =
                postService.getPostById(
                        updatedPost.getId());


        // If post doesn't exist
        if (existingPost == null) {
            return "redirect:/";
        }


        // =====================================================
        // OWNERSHIP CHECK
        // =====================================================

        /*
         * Only the original author can update the post.
         */

        if (!existingPost.getAuthor()
                .equals(user.getUsername())) {

            return "redirect:/";
        }


        // =====================================================
        // UPDATE TITLE AND CONTENT
        // =====================================================

        existingPost.setTitle(
                updatedPost.getTitle());

        existingPost.setContent(
                updatedPost.getContent());


        // =====================================================
        // IMAGE UPDATE
        // =====================================================

        /*
         * If the user does NOT select a new image,
         * the existing image remains unchanged.
         */

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


            // Create a new unique filename
            String fileName =
                    System.currentTimeMillis()
                    + fileExtension;


            // Get /img/blogs directory
            String uploadDirectory =
                    session.getServletContext()
                           .getRealPath("/img/blogs");


            File directory =
                    new File(uploadDirectory);


            // Create directory if it doesn't exist
            if (!directory.exists()) {
                directory.mkdirs();
            }


            // Create destination file
            File destination =
                    new File(directory, fileName);


            // Save new image
            image.transferTo(destination);


            // Replace old filename in database
            existingPost.setImageName(fileName);
        }


        // =====================================================
        // SAVE UPDATED POST
        // =====================================================

        postService.updatePost(existingPost);


        // Return to homepage
        return "redirect:/";
    }


    // =========================================================
    // DELETE BLOG
    // =========================================================

    @GetMapping("/deleteBlog/{id}")
    public String deleteBlog(
            @PathVariable("id") int id,
            HttpSession session) {

        // Get logged-in user
        User user =
                (User) session.getAttribute("loggedInUser");


        // User must be logged in
        if (user == null) {
            return "redirect:/login";
        }


        // Find the post
        Post post =
                postService.getPostById(id);


        // If post doesn't exist
        if (post == null) {
            return "redirect:/";
        }


        // =====================================================
        // OWNERSHIP CHECK
        // =====================================================

        /*
         * Only the user who created the post
         * can delete it.
         */

        if (!post.getAuthor()
                .equals(user.getUsername())) {

            return "redirect:/";
        }


        // Delete post from database
        postService.deletePost(id);


        // Return to homepage
        return "redirect:/";
    }
}