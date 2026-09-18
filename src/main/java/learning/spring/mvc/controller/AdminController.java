package learning.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpSession;
import learning.spring.mvc.model.Admin;
import learning.spring.mvc.model.Post;
import learning.spring.mvc.service.AdminService;
import learning.spring.mvc.service.PostService;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PostService postService;


    // =========================================================
    // ADMIN LOGIN PAGE
    // =========================================================

    @GetMapping("/adminLogin")
    public String showAdminLogin() {

        return "iblogadminlogin";
    }


    // =========================================================
    // PROCESS ADMIN LOGIN
    // =========================================================

    @org.springframework.web.bind.annotation.PostMapping(
            "/processAdminLogin")
    public String processAdminLogin(
            @org.springframework.web.bind.annotation.RequestParam(
                    "username") String username,
            @org.springframework.web.bind.annotation.RequestParam(
                    "password") String password,
            HttpSession session,
            Model model) {

        Admin admin =
                adminService.loginAdmin(
                        username,
                        password);

        if (admin != null) {

            session.setAttribute(
                    "loggedInAdmin",
                    admin);

            return "redirect:/adminDashboard";
        }

        model.addAttribute(
                "error",
                "Invalid admin username or password.");

        return "iblogadminlogin";
    }


    // =========================================================
    // ADMIN DASHBOARD
    // =========================================================

    @GetMapping("/adminDashboard")
    public String showAdminDashboard(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute(
                        "loggedInAdmin");

        // Admin must be logged in
        if (admin == null) {

            return "redirect:/adminLogin";
        }


        // Get blogs waiting for approval
        List<Post> pendingPosts =
                postService.getPendingPosts();

        model.addAttribute(
                "pendingPosts",
                pendingPosts);

        return "iblogadmindashboard";
    }


    // =========================================================
    // APPROVE BLOG
    // =========================================================

    @GetMapping("/approvePost/{id}")
    public String approvePost(
            @PathVariable("id") int id,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute(
                        "loggedInAdmin");

        // Only admin can approve
        if (admin == null) {

            return "redirect:/adminLogin";
        }


        postService.approvePost(id);

        return "redirect:/adminDashboard";
    }


    // =========================================================
    // REJECT BLOG
    // =========================================================

    @GetMapping("/rejectPost/{id}")
    public String rejectPost(
            @PathVariable("id") int id,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute(
                        "loggedInAdmin");

        // Only admin can reject
        if (admin == null) {

            return "redirect:/adminLogin";
        }


        postService.rejectPost(id);

        return "redirect:/adminDashboard";
    }


    // =========================================================
    // ADMIN LOGOUT
    // =========================================================

    @GetMapping("/adminLogout")
    public String adminLogout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/";
    }
}