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
    @Bean
    public LecBoardKorService lecBoardKorService(){return new LecBoardKorServiceImpl();}
    @Bean
    public LecBoardKorRepository lecBoardKorRepository(){return new LecBoardKorRepositoryImpl();}
    @Bean
    public TeacherRepository teacherRepository(){return new TeacherRepositoryImpl();}
    @Bean
    public TeacherService teacherService(){return new TeacherServiceImpl();}

    @Bean
    public FileInfo2Service fileInfo2Service() {return new FileInfo2ServiceImpl();}
    @Bean
    public FileInfo2Repository fileInfo2Repository() { return new FileInfo2RepositoryImpl();}
    @Bean
    public SubjectService subjectService() {return new SubjectServiceImpl();}
    @Bean
    public SubjectRepository subjectRepository() { return new SubjectRepositoryImpl();}
    @Bean
    public BookService bookService() {return new BookServiceImpl();}
    @Bean
    public BookRepository bookRepository() { return new BookRepositoryImpl();}
    @Bean
    public FileInfo3Service fileInfo3Service() {return new FileInfo3ServiceImpl();}
    @Bean
    public FileInfo3Repository fileInfo3Repository() { return new FileInfo3RepositoryImpl();}
    @Bean
    public LectureService lectureService() {return new LectureServiceImpl();}
    @Bean
    public LectureRepository lectureRepository() { return new LectureRepositoryImpl();}
}

