package com.doanTN.startupDN.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private Long id;
    private String username;
    private String fullname;
    private String gender;
    private String email;
    private String phone;
    private String cccd;
    private String birthday;
    private String country;
    private String province;
    private String distric;
    private String subdistric;
    private String houseno;
    private String roles;
}
