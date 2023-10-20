package com.expert.demo;

import com.expert.demo.configuration.AppConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@Import(AppConfig.class)
public class ExpertApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExpertApplication.class, args);
	}

}
