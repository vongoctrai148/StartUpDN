//package com.doanTN.startupDN.services;
//
//import com.doanTN.startupDN.daos.UserDAO;
//import com.doanTN.startupDN.entities.Users;
//import com.doanTN.startupDN.models.dto.UserDto;
//import com.doanTN.startupDN.models.mapper.UserMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.List;
//
//
//@Component
//public class UsersImpl implements UserDAO {
//
//    @Autowired
//    private UserDAO userDAO;
//
//
//
////    private static ArrayList<Users> users = new ArrayList<>();
////
////    static {
////        users.add(new Users(1L, "traivo", "123", "traivo148@gmail.com", "0987333434"));
////        users.add(new Users(2L, "chungtran123", "123", "chung123@gmail.com", "0922233434"));
////        users.add(new Users(3L, "nhanduong", "abc", "nhan336@gmail.com", "039323234"));
////    }
////
////
//    @Override
//    public List<UserDto> finAllUsers() {
//        List<UserDto> result = new ArrayList<>();
//        for (Users user : users){
//            result.add(UserMapper.getUserDto(user));
//        }
//        userDAO.findAll();
//        return result;
//    }
//}
