package com.doanTN.startupDN.controllers.User;



import com.doanTN.startupDN.entities.Users;
import com.doanTN.startupDN.forms.ProjectForm;
import com.doanTN.startupDN.forms.RegisForm;
import com.doanTN.startupDN.services.ProvinceService;
import com.doanTN.startupDN.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProvinceService provinceService;

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


}
