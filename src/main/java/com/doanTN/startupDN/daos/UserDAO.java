package com.doanTN.startupDN.daos;

import com.doanTN.startupDN.entities.Users;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDAO extends JpaRepository<Users, Long> {
//    List<UserDto> getAllUsers();

}
