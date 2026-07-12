package com.clinic.controller;

import com.clinic.dto.RegisterRequestDTO;
import com.clinic.service.UserService;
import com.clinic.validator.RegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private RegisterValidator registerValidator;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("registerRequest", new RegisterRequestDTO());
        return "auth/register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("registerRequest") RegisterRequestDTO request,
                           BindingResult bindingResult, Model model) {
        registerValidator.validate(request, bindingResult);
        if (bindingResult.hasErrors()) {
            return "auth/register";
        }
        userService.registerUser(request);
        return "redirect:/login?registered=true";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "auth/login";
    }
}
