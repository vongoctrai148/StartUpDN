package com.doanTN.startupDN.controllers.admin;

import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdUserController {
    @Autowired
    private UserService userService;
    @GetMapping("/admin/listAccount")
    public String getListAccount(Model model,HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            List<Users> userList = userService.getAllUser();
            model.addAttribute("listUser", userList);
            return "listAcount";
        }
    }
    @GetMapping("/admin/deleteUser/{id}")
    public String deleteUser(@PathVariable Long id,HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            userService.deleteUserById(id);
            return "redirect:/admin/listAccount";
        }
    }
    @GetMapping("/admin/addUser")
    public String getAdd(Model model,HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("addUser", new Users());
            return "addUser";
        }
    }
//    @PostMapping("/admin/addUser")
//    public String postAdduser(@ModelAttribute("addUser") Users users){
//        userService.save(users);
//        return "redirect:/admin/listAccount";
//    }
}
