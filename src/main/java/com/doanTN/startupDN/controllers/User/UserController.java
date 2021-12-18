package com.doanTN.startupDN.controllers.User;



import com.doanTN.startupDN.forms.RegisForm;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

//    @GetMapping("/users")
//    public List<Users> getAllUsers(){
//        List<Users> usersList = userService.getAllUser();
//        return usersList;
//    }

    @GetMapping("/register")
    public String getRegister(Model model){
        model.addAttribute("enrollForm", new RegisForm());
        return "register";
    }

}
