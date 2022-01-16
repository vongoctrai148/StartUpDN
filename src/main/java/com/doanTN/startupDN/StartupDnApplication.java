package com.doanTN.startupDN;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.Date;

@SpringBootApplication
public class StartupDnApplication {

	public static void main(String[] args) {
		SpringApplication.run(StartupDnApplication.class, args);
		System.out.println("Đã load xong!");

//		Khi dùng security nên lưu ý về việc mật khẩu bị mã hoá :)
	}

}
