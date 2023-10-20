package com.expert.demo.configuration;

import com.expert.demo.repository.DBProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
@ComponentScan("com.expert.demo.repository")
public class AppConfig {
    @Bean("datasource")
    @Autowired
    public DataSource createDataSource(DBProperties dbProperties) {
        var dataSource = new DriverManagerDataSource();
        dataSource.setUrl(dbProperties.getUrl());
        dataSource.setUsername(dbProperties.getUser());
        dataSource.setPassword(dbProperties.getPassword());
        return dataSource;
    }

    @Bean("JdbcTemplate")
    @Autowired
    public JdbcTemplate createJdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
