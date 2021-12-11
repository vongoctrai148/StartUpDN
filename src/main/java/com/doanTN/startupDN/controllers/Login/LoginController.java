package com.doanTN.startupDN.controllers.Login;

import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.forms.LoginForm;
import com.doanTN.startupDN.forms.RegisForm;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String getLogin(Model model){
        model.addAttribute("loginForm", new LoginForm());
        return "login";
    }

    @PostMapping("/login")
    public String postLogin(Model model, @Valid @ModelAttribute("loginForm") LoginForm loginForm, BindingResult bindingResult,
    HttpSession session){
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }
        String username = loginForm.getUsername();
        String password = loginForm.getPassword();
        if(userService.loginUser(username, password) == 1){
            Users user = userService.getUserByUserName(username);
            session.setAttribute("user", user);
            if(("startup").equals(user.getRoles())){
                return "redirect:/startup/listProject";
            } else if (("investors").equals(user.getRoles())) {
                return "redirect:/investor/";
            } else if (("admin").equals(user.getRoles())) {
                return "redirect:/admin/";
            }
        }
        model.addAttribute("message", "Username or password is incorrect!");
        return "login";
    }

    @GetMapping("/register")
    public String getRegister(Model model){
        model.addAttribute("enrollForm", new RegisForm());
        return "register";
    }

//    @GetMapping("/logout")
//    public String logout(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        if (session != null) {
//            session.invalidate();
//        }
//        return "/login";
//    }


}
