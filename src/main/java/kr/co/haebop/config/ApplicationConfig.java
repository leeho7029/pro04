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
    @Bean
    public FileboardService fileboardService() {return new FileboardServiceImpl();}
    @Bean
    public FileboardRepository fileboardRepository() { return new FileboardRepositoryImpl();}
    @Bean
    public FileInfoService fileInfoService() {return new FileInfoServiceImpl();}
    @Bean
    public FileInfoRepository fileInfoRepository() { return new FileInfoRepositoryImpl();}
    @Bean
    public CommunityService communityService() {return new CommunityServiceImpl();}
    @Bean
    public CommunityRepository communityRepository() { return new CommunityRepositoryImpl();}
    @Bean
    public CommentService commentService() {return new CommentServiceImpl();}
    @Bean
    public CommentRepository commentRepository() { return new CommentRepositortyImpl();}

}

