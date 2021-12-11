package com.doanTN.startupDN.controllers.StartUp;

import com.doanTN.startupDN.entities.Projects;
import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomepageController {
    @Autowired
    private ProjectService projectService;

    @GetMapping("startup/listProject")
    public String getListProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("listProjects", projectService.getAllProjects());
            return "startup/listProject";
        }
    }

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

    @PostMapping("/startup/voteStar")
    public String postRate (HttpServletRequest request){
        String star = request.getParameter("ratedStar");
        if(star.equals("") || star == null){
            star = String.valueOf(5);
            System.out.println(star);
        }
        int starRated = Integer.parseInt(star);
        Long projectId = Long.valueOf(request.getParameter("projectId"));
        Projects project = projectService.getProjectById(projectId);
        float totalRate = project.getTotalvoted();
        int sumRate = project.getSumvoted();
        projectService.updateRating(projectId, (totalRate*sumRate+starRated)/(sumRate+1), project.getSumvoted()+1);
        return "redirect:/startup/projectDetail/" + projectId;
    }



}
