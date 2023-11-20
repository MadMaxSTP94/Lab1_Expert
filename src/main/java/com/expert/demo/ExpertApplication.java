package com.expert.demo;

import com.expert.demo.configuration.AppConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@Import(AppConfig.class)
@PropertySource("classpath:application.properties")
public class ExpertApplication {
	@Value("${db.url}")
	private String vlaue;
	public static void main(String[] args) {
		SpringApplication.run(ExpertApplication.class, args);
	}

}
