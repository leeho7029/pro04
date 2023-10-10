package kr.co.haebop.config;

import kr.co.haebop.repository.NoticeRepository;
import kr.co.haebop.repository.NoticeRepositoryImpl;
import kr.co.haebop.repository.TestRepository;
import kr.co.haebop.repository.TestRepositoryImpl;
import kr.co.haebop.service.NoticeService;
import kr.co.haebop.service.NoticeServiceImpl;
import kr.co.haebop.service.TestService;
import kr.co.haebop.service.TestServiceImpl;
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

}

