package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.UserDAO;
import com.doanTN.startupDN.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
