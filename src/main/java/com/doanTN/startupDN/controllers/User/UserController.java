package com.doanTN.startupDN.controllers.User;



import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.forms.ProjectForm;
import com.doanTN.startupDN.forms.RegisForm;
import com.doanTN.startupDN.forms.UserForm;
import com.doanTN.startupDN.services.DistrictService;
import com.doanTN.startupDN.services.ProvinceService;
import com.doanTN.startupDN.services.SubDistrictService;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private SubDistrictService subDistrictService;

//    @GetMapping("/users")
//    public List<Users> getAllUsers(){
//        List<Users> usersList = userService.getAllUser();
//        return usersList;
//    }

    @GetMapping("/register")
    public String getRegister(Model model){
        model.addAttribute("provinces", provinceService.getAllProvinces());
        model.addAttribute("enrollForm", new RegisForm());
        return "register";
    }

    @PostMapping("/saveUser")
    public String postRegister(Model model, @Valid @ModelAttribute("enrollForm") RegisForm regisForm, BindingResult bindingResult, HttpSession session){
        model.addAttribute("provinces", provinceService.getAllProvinces());
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }
        if(userService.checkUserExist(regisForm.getUsername()) == 1){
            bindingResult.rejectValue("username", "error.user", "Tài khoản đã tồn tại");
        }else{
            if(!regisForm.getPassword().equals(regisForm.getRePassword())){
                bindingResult.rejectValue("rePassword", "error.user", "Mật khẩu không khớp nhau");
            }else{
                if(regisForm.getBirthday() == null || regisForm.getBirthday().equals("")){
                    bindingResult.rejectValue("birthday", "error.user", "Vui lòng chọn ngày sinh" );
                }else {
                    Date tgiansd = Date.valueOf(regisForm.getBirthday());
                    java.util.Date date = new java.util.Date();
                    if(tgiansd.after(date)) {
                        bindingResult.rejectValue("birthday", "error.user", "Hãy chọn ngày sinh nhỏ hơn!");
                    }else {
                        userService.userRegister(regisForm.getUsername(), regisForm.getPassword(), regisForm.getFullname(), regisForm.getGender(),
                                regisForm.getEmail(), regisForm.getPhone(), regisForm.getCccd(), Date.valueOf(regisForm.getBirthday()), "Việt Nam",
                                regisForm.getProvince(), regisForm.getDistrict(), regisForm.getSubdistrict(), regisForm.getHouseno(), regisForm.getRoles(), "empty.png");
                        Users user = userService.getUserByUserName(regisForm.getUsername());
                        session.setAttribute("user", user);
                        if(("startup").equals(user.getRoles())){
                            return "redirect:/startup/listProject";
                        } else if (("investors").equals(user.getRoles())) {
                            return "redirect:/investor/";
                        }
                    }
                }
            }
        }
        model.addAttribute("message", "Username or password is incorrect!");
        return "register";
    }

    @GetMapping("/startup/updateProfile")
    public String getUpdateProfile(Model model, HttpSession session){
        Users user = (Users) session.getAttribute("user");
        if(("").equals(user) || user == null){
            return "redirect:/login";
        }
        else {
            model.addAttribute("updateForm", new UserForm(user.getId(), user.getFullname(),
                    user.getEmail(), user.getPhone(), user.getCccd(), user.getBirthday().toString(),
                    user.getProvince(), user.getDistrict(), user.getSubdistrict(), user.getHouseno(), user.getJob(), user.getAvataruser()));
            model.addAttribute("provinces", provinceService.getAllProvinces());
            return "startup/updateProfile";
        }
    }

    @PostMapping("/startup/updateProfile")
    public String postUpdateProfile (Model model,  @Valid @ModelAttribute("updateForm") UserForm userForm, BindingResult bindingResult
    , @RequestParam("avatarUser") MultipartFile avatarUser) throws IOException {
        model.addAttribute("provinces", provinceService.getAllProvinces());
        if(bindingResult.hasErrors()){
            model.addAttribute("error");
        }else{
            if(userForm.getBirthday() == null || userForm.getBirthday().equals("")){
                bindingResult.rejectValue("birthday", "error.user", "Vui lòng chọn ngày sinh" );
            }else{
                Date tgiansd = Date.valueOf(userForm.getBirthday());
                java.util.Date date = new java.util.Date();
                if(tgiansd.after(date)) {
                    bindingResult.rejectValue("birthday", "error.user", "Hãy chọn ngày sinh nhỏ hơn!");
                }else {
                    String filename = userForm.getCccd().trim() + avatarUser.getOriginalFilename();
                    Path imgPresentPath = Paths.get("src/main/resources/static/images/userImages/" + filename);
                    Files.write(imgPresentPath, avatarUser.getBytes());
                    userService.updateProfile(userForm.getId(), userForm.getFullname(), userForm.getGender(),
                            userForm.getEmail(), userForm.getPhone(), userForm.getCccd(), Date.valueOf(userForm.getBirthday()),
                            provinceService.findProvinceNameById(userForm.getProvince()), districtService.findDistrictNameById(userForm.getDistrict()),
                            subDistrictService.findSubDistrictNameById(userForm.getSubdistrict()), userForm.getHouseno(), userForm.getJob(), filename );
                    return "startup/userProfile";
                }
            }
        }
        return "startup/updateProfile";
    }
}
