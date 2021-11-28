package com.doanTN.startupDN.forms;

import lombok.*;

import javax.validation.constraints.NotBlank;


@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoginForm {
    @NotBlank(message = "Please enter username")
    private String username;
    @NotBlank(message = "Please enter password")
    private String password;
}
