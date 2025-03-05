package com.hieupv.example;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Profile("dev")
@Configuration
public class ApplicationConfig {

    @Bean("bean1")
    public MyFirstClass myFirstBean() {
        return new MyFirstClass(" First bean 1");
    }

    @Bean
    public MyFirstClass mySecondBean() {
        return new MyFirstClass(" First bean 2");
    }

    @Bean
    public MyFirstClass myThirdBean() {
        return new MyFirstClass(" First bean 2");
    }
}
