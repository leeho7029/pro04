package kr.co.haebop.repository;

import kr.co.haebop.domain.Test;

import java.util.List;

public interface TestRepository {
    public List<Test> testList() throws Exception;
}
