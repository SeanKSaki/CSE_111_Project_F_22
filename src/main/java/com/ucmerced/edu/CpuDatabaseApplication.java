package com.ucmerced.edu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CpuDatabaseApplication {

	public static void main(String[] args) {

		SpringApplication.run(CpuDatabaseApplication.class, args);



	}

	@Autowired
	DBService localservice;

}
