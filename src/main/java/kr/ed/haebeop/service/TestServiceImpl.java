package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.persistence.TestMapper;
import kr.ed.haebeop.persistence.TestMapper2;
import kr.ed.haebeop.persistence.TestRepository;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestRepository testRepository;

    @Autowired
    private TestMapper testMapper;

    @Autowired
    private TestMapper2 testMapper2;

    @Override
    public List<Test> testList() throws Exception {
        return testRepository.testList();
    }

    @Override
    public List<Test> testList2() throws Exception {
        return testMapper.getTestList2();
    }

    @Override
    public List<Test> testList3() throws Exception {
        return testMapper2.getTestList3();
    }
}
