package kr.ed.haebeop.config;

import kr.ed.haebeop.persistence.TestRepository;
import kr.ed.haebeop.persistence.TestRepositoryImpl;
import kr.ed.haebeop.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

// 컨트롤러나 서비스, 맵퍼, 레포지토리에서 사용할 Bean을 등록
@Configuration
@ComponentScan(basePackages = "kr.ed.haebeop")
public class ApplicationConfig {

    @Bean
    public TestService testService() { return new TestServiceImpl(); }

    @Bean
    public TestRepository testRepository() { return new TestRepositoryImpl(); }

}
