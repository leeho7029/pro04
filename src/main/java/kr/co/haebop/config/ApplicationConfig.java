package kr.co.haebop.config;

import kr.co.haebop.repository.*;
import kr.co.haebop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "kr.co.haebop")
public class ApplicationConfig {

    @Bean
    public TestService testService() {return new TestServiceImpl();}
    @Bean
    public TestRepository testRepository() { return new TestRepositoryImpl();}
    @Bean
    public NoticeService noticeService() {return new NoticeServiceImpl();}
    @Bean
    public NoticeRepository noticeRepository() { return new NoticeRepositoryImpl();}
    @Bean
    public UserService userService() {return new UserServiceImpl();}
    @Bean
    public UserRepository userRepository() { return new UserRepositoryImpl();}

}

