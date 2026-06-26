package com.veta.servlets;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String root() {
        return "redirect:/home";
    }

    @GetMapping("/index")
    public String index() {
        return "redirect:/home";
    }
}