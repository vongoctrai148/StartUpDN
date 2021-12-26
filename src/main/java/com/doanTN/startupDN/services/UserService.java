package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.UserDAO;
import com.doanTN.startupDN.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDAO userDAO;

    @Transactional
    public List<Users> getAllUser (){
        return userDAO.findAll();
    }
    @Transactional
    public int loginUser(String username, String password){
        return userDAO.findUsersByUsernameAndPassword(username, password);
    }
    @Transactional
    public Users getUserByUserName(String username){
        return userDAO.getUsersByUsername(username);
    }
    @Transactional
    public int checkUserExist(String username){
        return userDAO.checkUserExist(username);
    }

    @Transactional
    public void userRegister (String username, String password, String fullname, String  gender, String email, String phone,
                          String CCCD, Date birthDay, String country, String province, String district, String subDistrict,
                          String houseno, String role, String avatarUser){
        userDAO.save(new Users(username, password, fullname, gender, email, phone, CCCD, birthDay,
                country, province, district, subDistrict, houseno, role, avatarUser));
    }
}
