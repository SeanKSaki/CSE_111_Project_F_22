package com.ucmerced.edu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix="embedded")
public class DBSettings {
    @Autowired
    Environment env;

    @Bean(name = "localDataSource")
    @Qualifier("localDataSource")
    DataSource localsDataSource() {

        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();

        dataSourceBuilder.url("jdbc:sqlite:tpch.sqlite");
        //System.out.println(env.getProperty("url"));
        DataSource source = dataSourceBuilder.build();
        return source;
    }

    @Bean(name = "localdatabase")
    JdbcTemplate localTemplate(@Qualifier("localDataSource") DataSource ds) {
        return new JdbcTemplate(ds);
    }
}