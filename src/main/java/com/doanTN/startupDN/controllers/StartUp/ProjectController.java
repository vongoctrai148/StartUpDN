package com.doanTN.startupDN.controllers.StartUp;

import com.doanTN.startupDN.daos.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProjectController {


//    @PostMapping("/listProject")
//    public List<UserDto> getListProject(Model model){
//        List<UserDto> userDto = userDAO.getAllUsers();
//////        model.addAttribute("userDto", userDto);
//        return userDto;
//    }
//
//    @GetMapping("/projectDetail")
//    public String getProjectDetail(Model model){
//        return "projectDetail";
//    }
//
//    @PostMapping("/test")
//    public List<UserDto> getABC (){
//        List<UserDto> userDto = userDAO.getAllUsers();
////        model.addAttribute("userDto", userDto);
//        return userDto;
//    }
}
