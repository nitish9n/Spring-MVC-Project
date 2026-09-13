
package learning.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // ================= HOME =================

    @GetMapping("/")
    public String home(Model model) {

        return "iblog";
    }


    // ================= ABOUT =================

    @GetMapping("/about")
    public String about() {

        return "about";
    }


    // ================= CONTACT =================

    @GetMapping("/contact")
    public String contact() {

        return "contact";
    }
}
