package com.expert.demo.repository;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@PropertySource("classpath:application.properties")
public class DBProperties {
    @Value("${db.url}")
    private String url;

    @Value("${db.user}")
    private String user;

    @Value("${db.password}")
    private String password;

    /*
    @PostConstruct
    public void init() {
        var source = new ClassPathResource("application.properties");
        try {
            var props = PropertiesLoaderUtils.loadProperties(source);
            url = (String) props.get("db.url");
            user = (String) props.get("db.user");
            password = (String) props.get("db.password");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }*/

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }
}
