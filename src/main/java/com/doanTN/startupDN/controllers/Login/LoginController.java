package com.doanTN.startupDN.controllers.Login;

import com.doanTN.startupDN.forms.LoginForm;
import com.doanTN.startupDN.forms.RegisForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String getLogin(Model model){
        model.addAttribute("loginForm", new LoginForm());
        return "login";
    }

    @PostMapping("/login")
    public String postLogin(Model model, @Valid @ModelAttribute("loginForm") LoginForm loginForm, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();
        if(username.equals("traivo") && password.equals("123")){
            return "redirect:/startup/homepage";
        }
        model.addAttribute("message", "Username or password is incorrect!");
        return "login";
    }

    @GetMapping("/register")
    public String getRegister(Model model){
        model.addAttribute("enrollForm", new RegisForm());
        return "register";
    }

}
