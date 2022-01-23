package com.doanTN.startupDN.controllers.Investors;

import com.doanTN.startupDN.daos.UserDAO;
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
public class InvestorProfile {

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
    @Autowired
    private UserService userService;
    @Autowired
    private InvestorsServices investorsServices;

    @GetMapping("/investor/company")
    public String getUserListProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        }
            model.addAttribute("profileUser", userService.getUserByUserName(user.getUsername()));
            model.addAttribute("listInvesterOfUser", investorsServices.getAllProjectByUsername(user.getUsername()));
            return "company";
    }
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
                return "saveCompany";
            }
        }
    }
    @PostMapping("investor/save")
    public String postUpdateInvestor(Model model, @RequestParam("logo") MultipartFile logo,
                                     @Valid @ModelAttribute("projectForm") InvestorForm investorForm, BindingResult bindingResult, HttpSession session) throws IOException {
        Users user = (Users) session.getAttribute("user");
        if (bindingResult.hasErrors()) {
            model.addAttribute("error");
        }
        if (investorForm.getId() == null || investorForm.getId().equals("")) {
            String imgPresent = logo.getOriginalFilename();
            Path imgPresentPath = Paths.get("src/main/resources/static/ndt/images/nhadautu/" + imgPresent);
            Files.write(imgPresentPath, logo.getBytes());
            investorsServices.saveInvestor(userDAO.getUsersByUsername(user.getUsername()),investorForm.getInvestorsname(), investorForm.getAbbreviations(), imgPresent, investorForm.getContent(), investorForm.getCountry(),
                    provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
                    subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(), investorForm.getSdt(), investorForm.getEmail());
            return "redirect:/investor/company";
        }
        String imgPresent = logo.getOriginalFilename();
        Path imgPresentPath = Paths.get("src/main/resources/static/ndt/images/nhadautu/" + imgPresent);
        Files.write(imgPresentPath, logo.getBytes());
        investorsServices.updateInvestor(investorForm.getId(),
                investorForm.getInvestorsname(), investorForm.getAbbreviations(), imgPresent, investorForm.getContent(), investorForm.getCountry(),
                provinceService.findProvinceNameById(investorForm.getProvince()), districtService.findDistrictNameById(investorForm.getDistrict()),
                subDistrictService.findSubDistrictNameById(investorForm.getSubdistrict()), investorForm.getHouseno(), investorForm.getSdt(), investorForm.getEmail());
        return "redirect:/investor/company";
    }

    @GetMapping("investor/save")
    public String getProject(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("user");
        if (("").equals(user) || user == null) {
            return "redirect:/login";
        } else {
            if (!user.getRoles().equals("investors")) {
                return "page404";
            } else {
                model.addAttribute("provinces", provinceService.getAllProvinces());
                model.addAttribute("categories", categoryService.getALlCategories());
                model.addAttribute("investorsForm", new InvestorForm());
                return "saveCompany";
            }
        }
    }
    @GetMapping("/investor/delete/{id}")
    public String deleteInvestors(@PathVariable("id") Long investorsId) {
        investorsServices.delete(investorsId);
        return "redirect:/investor/company";
    }
}
