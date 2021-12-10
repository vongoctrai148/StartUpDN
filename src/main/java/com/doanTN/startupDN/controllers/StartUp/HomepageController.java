package com.doanTN.startupDN.controllers.StartUp;

import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
public class HomepageController {
    @Autowired
    private ProjectService projectService;

    @GetMapping("/startup/projectDetail/{id}")
    public String getHomepage(HttpSession session, Model model, @PathVariable("id") Long projectId){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("imageOfProject", projectService.getAllImageByProjectId(projectId));
            model.addAttribute("project", projectService.getProjectById(projectId));
            return "startup/projectDetail";
        }

    }

    @GetMapping("/startup/userListProject")
    public String getUserListProject (Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        model.addAttribute("listProjectOfUser", projectService.getAllProjectByUsername(user.getUsername()));
        return "startup/userListProject";
    }

}
