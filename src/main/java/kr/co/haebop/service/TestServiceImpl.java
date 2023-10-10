package kr.co.haebop.service;

import kr.co.haebop.domain.Test;
import kr.co.haebop.repository.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService{

    @Autowired
    private TestRepository testRepository;

    @Override
    public List<Test> testList() throws Exception {
        return testRepository.testList();
    }
}
