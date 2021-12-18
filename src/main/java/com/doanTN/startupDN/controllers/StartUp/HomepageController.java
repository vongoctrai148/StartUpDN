package com.doanTN.startupDN.controllers.StartUp;

import com.doanTN.startupDN.entities.Projects;
import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.services.ProjectService;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

@Controller
public class HomepageController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private UserService userService;
    public static final int PAGE_SIZE = 3;
    @GetMapping("startup/listProject")
    public String getListProject(Model model, HttpSession session,
    @RequestParam(value = "page", defaultValue = "1") int page) {

        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            model.addAttribute("listProjects", projectService.getAllProjects(PageRequest.of(page-1,PAGE_SIZE)));
            model.addAttribute("pageSize",(projectService.getTotalProject()/PAGE_SIZE)+1);
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
            model.addAttribute("comments", projectService.getAllCommentByProjectId(projectId));
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
        }
        float starRated = Float.parseFloat((star));
        Long projectId = Long.valueOf(request.getParameter("projectId"));
        Projects project = projectService.getProjectById(projectId);
        float totalRate = project.getTotalvoted();
        int sumRate = project.getSumvoted();
        projectService.updateRating(projectId, (totalRate*sumRate+starRated)/(sumRate+1), project.getSumvoted()+1);
        return "redirect:/startup/projectDetail/" + projectId;
    }


    @PostMapping("/startup/postComment")
    public String postComment (HttpServletRequest request, Model model){
        String comment = request.getParameter("binhluan");
        Long projectId = Long.valueOf(request.getParameter("projectId"));
        String username = request.getParameter("username");
        java.util.Date posteddate = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String strDate = formatter.format(posteddate);
        if(comment.equals("") || comment == null) {
            return "redirect:/startup/projectDetail/" + projectId;
        }
        projectService.addComment(userService.getUserByUserName(username), projectService.getProjectById(projectId), comment, strDate);
        return "redirect:/startup/projectDetail/" + projectId;
    }


}
