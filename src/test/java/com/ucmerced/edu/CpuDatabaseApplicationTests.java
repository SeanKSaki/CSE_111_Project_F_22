package com.ucmerced.edu;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CpuDatabaseApplicationTests {

	@Autowired
	DBService localservice;
	@Test
	void contextLoads() {
		System.out.println(localservice.allTable());
	}

	@Test
	void showdisplay(){
		System.out.println(localservice.getall());
	}

}
