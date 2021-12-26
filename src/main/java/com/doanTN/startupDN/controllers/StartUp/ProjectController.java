package com.doanTN.startupDN.controllers.StartUp;

import com.doanTN.startupDN.daos.UserDAO;
import com.doanTN.startupDN.entities.Projects;
import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.forms.ProjectForm;
import com.doanTN.startupDN.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;

    @GetMapping("/startup/userProfile")
    public String getUserProfile(Model model, HttpSession session ){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            return "startup/userProfile";
        }
    }

    @GetMapping("/startup/userListProject")
    public String getUserListProject (Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("listProjectOfUser", projectService.getAllProjectByUsername(user.getUsername()));
            return "startup/userListProject";
        }
    }

    @GetMapping("startup/saveProject")
    public String getProject(Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("provinces", provinceService.getAllProvinces());
            model.addAttribute("categories", categoryService.getALlCategories());
            model.addAttribute("projectForm", new ProjectForm());
            return "startup/saveProject";
        }
    }

    @GetMapping("startup/saveProject/{id}")
    public String getUpdateProject(Model model, HttpSession session,  @PathVariable("id") Long projectId){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            Projects project = projectService.getProjectById(projectId);
            model.addAttribute("provinces", provinceService.getAllProvinces());
            model.addAttribute("categories", categoryService.getALlCategories());
            model.addAttribute("projectForm", new ProjectForm(project.getId(), project.getCategory().getId(),
                    project.getProjectname(), project.getAmountcalled(), project.getProjectdetail(), project.getTitle(), project.getCountry(),
                    project.getProvince(), project.getDistrict(), project.getSubdistrict(), project.getHouseno()));
            return "startup/saveProject";
        }
    }

    @PostMapping("startup/saveProject")
    public String postProject (Model model, @RequestParam("imageofproject") MultipartFile[] imageOfProject,
                              @Valid @ModelAttribute("projectForm") ProjectForm projectForm, BindingResult bindingResult, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if(projectForm.getId() == null || projectForm.getId().equals("") ){
            java.util.Date posteddate = new java.util.Date();
            Projects project = projectService.saveProject(userDAO.getUsersByUsername(user.getUsername()), categoryService.getCategoryById(projectForm.getCategoryId()),
                    projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), projectForm.getCountry(),
                    provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                    subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno(), posteddate);
            List<String> fileNames = new ArrayList<>();
            Arrays.asList(imageOfProject).stream().forEach(file -> {
                String fileName = project.getId() + file.getOriginalFilename();
                projectService.addImageOfProject( projectService.getProjectById(project.getId()), fileName);
                fileNames.add(fileName);
                Path imagePath = Paths.get("src/main/resources/static/images/projectImages/" + fileName);
                try {
                    Files.write(imagePath, file.getBytes());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
        }else {
            Projects project = projectService.updateProject(projectForm.getId(), categoryService.getCategoryById(projectForm.getCategoryId()),
                    projectForm.getProjectname(), projectForm.getAmountcalled(), projectForm.getProjectdetail(), projectForm.getTitle(), projectForm.getCountry(),
                    provinceService.findProvinceNameById(projectForm.getProvince()), districtService.findDistrictNameById(projectForm.getDistrict()),
                    subDistrictService.findSubDistrictNameById(projectForm.getSubdistrict()), projectForm.getHouseno());
            List<String> fileNames = new ArrayList<>();
            Arrays.asList(imageOfProject).stream().forEach(file -> {
                String fileName = project.getId() + file.getOriginalFilename();
                if(projectService.checkImageExists(fileName)){
                    projectService.deleteImageByName(fileName);
                }
                projectService.addImageOfProject( projectService.getProjectById(project.getId()), fileName);
                fileNames.add(fileName);
                Path imagePath = Paths.get("src/main/resources/static/images/projectImages/" + fileName);
                try {
                    Files.write(imagePath, file.getBytes());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
        }
        return "redirect:/startup/listProject";

    }

    @GetMapping("/startup/userListImage")
    public String getUserListImage (Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("listImageOfUser", projectService.getAllImageByUsername(user.getUsername()));
            return "startup/userListImage";
        }
    }

}
