package com.doanTN.startupDN.controllers.Investors;


import com.doanTN.startupDN.entities.Investors;
import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.forms.InvestorForm;
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

@Controller
public class InvestorsController {
    @Autowired
    private InvestorsServices investorsServices;
    @Autowired
    private InvestorsProjectServices investorsProjectServices;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;
    @Autowired
    private ProjectService projectService;

    @GetMapping("/investor")
    public String getAllInvestors(Model model) {
            model.addAttribute("investors", investorsServices.getAllInvestors());
            return "investor";
    }

    @GetMapping("/investor/details/{id}")
    public String deDetailsInvestors(@PathVariable("id") Long investorsId, Model model) {
            model.addAttribute("details", investorsServices.getInvestorsById(investorsId));
            return "investorsdetails";

    }
//    @GetMapping("/investors/project/{userId}")
//    public List<Projects> getinvestorsProject(@PathVariable Long userId, Model model){
//        List<Projects> investedProjectsList = projectService.geta(userId);
//        model.addAttribute("investedProjects",investedProjectsList);
////        return "investorsProject";
//        return investedProjectsList;
//    }
@GetMapping("investor/save/{id}")
public String getUpdateInvestor(Model model, HttpSession session, @PathVariable("id") Long investorId){
    Users user = (Users) session.getAttribute("user");
    Investors investors = investorsServices.getInvestorsById(investorId);
    if(("").equals(user) || user == null){
        return "redirect:/login";
    }
    else{
        if(!user.getUsername().equals(investors.getUser().getUsername())){
            return "page404";
        } else{
            model.addAttribute("investors", investors);
            model.addAttribute("provinces", provinceService.getAllProvinces());
            model.addAttribute("investorsForm", new InvestorForm(investors.getId(),investors.getUser().getId(),
                    investors.getInvestorsname(), investors.getAbbreviations(), investors.getLogo(), investors.getContent(),
                    investors.getCountry(), investors.getProvince(), investors.getDistrict(), investors.getSubdistrict(),investors.getHouseno(),investors.getSdt(),investors.getEmail()));
            return "startup/saveProject";
        }
    }
}

    @GetMapping("investor/save")
    public String getInvestor(Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("provinces", provinceService.getAllProvinces());
            model.addAttribute("projectForm", new InvestorForm());
            return "startup/saveProject";
        }
    }

    //    @PostMapping("investor/save")
//    public String postInvestor (Model model, @RequestParam("logo") MultipartFile logo,
//                               @Valid @ModelAttribute("projectForm") InvestorForm investorForm, BindingResult bindingResult, HttpSession session) throws IOException {
//        Users user = (Users) session.getAttribute("user");
//        if(bindingResult.hasErrors()){
//            model.addAttribute("error");
//        }
//        String fileName =investorForm.getId().toString() + logo.getOriginalFilename();
//        if (!fileName.contains(".jpg") && !fileName.contains(".png")) {
//            model.addAttribute("message", "Invalid image file");
//            return "investor/save";
//        }
//        Path imagePath = Paths.get("src/main/resources/static/images/" + fileName);
//        Files.write(imagePath, logo.getBytes());
//        investorsServices.saveInvestor(userDAO.getUsersByUsername(user.getUsername()),investorForm.getInvestorsname(), investorForm.getAbbreviations(), fileName, investorForm.getContent(), investorForm.getCountry(),
//                provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
//                subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(), investorForm.getSdt(),investorForm.getEmail());
//                return "redirect:/startup/listProject";
//            }
    @PostMapping("investor/save")
    public String postInvestor (Model model, @RequestParam("logo") MultipartFile logo,
                                @Valid @ModelAttribute("projectForm")/*????*/ InvestorForm investorForm, BindingResult bindingResult, HttpSession session) throws IOException {
        Users user = (Users) session.getAttribute("user");
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }
        String imgPresent = logo.getOriginalFilename();
        Path imgPresentPath = Paths.get("src/main/resources/static/images/projects/" + imgPresent);
        Files.write(imgPresentPath, logo.getBytes());
        investorsServices.updateInvestor(investorForm.getId(),
                investorForm.getInvestorsname(), investorForm.getAbbreviations(),imgPresent, investorForm.getContent(),investorForm.getCountry(),
                provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
                subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(),investorForm.getSdt(),investorForm.getEmail());
        return "redirect:/startup/listProject";
    }
}
