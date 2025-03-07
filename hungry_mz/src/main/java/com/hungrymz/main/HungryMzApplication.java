package com.hungrymz.main;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data", "com.hungrymz", "com.naver.storage", "com.restaurant.controller", "com.restaurant.service" ,"com.menu.controller", "com.menu.service"})
@MapperScan("data.mapper")
public class HungryMzApplication {
	public static void main(String[] args) {
		SpringApplication.run(HungryMzApplication.class, args);
	}
}