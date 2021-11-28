package com.doanTN.startupDN;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StartupDnApplication {

	public static void main(String[] args) {
		SpringApplication.run(StartupDnApplication.class, args);
		System.out.println("Đã load xong!");
	}

}
