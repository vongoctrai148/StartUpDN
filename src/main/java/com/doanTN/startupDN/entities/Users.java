package com.doanTN.startupDN.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.persistence.*;


@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String passwords;
    private String fullname;
    private String gender;
    private String email;
    private String phone;
    private String cccd;
    private String birthday;
    private String country;
    private String province;
    private String district;
    private String subdistrict;
    private String houseno;
    private String roles;


}
