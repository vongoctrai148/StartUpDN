package com.doanTN.startupDN.controllers.User;

import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public List<Users> getAllUsers(){
        List<Users> usersList = userService.getAllUser();
        return usersList;
    }

}
