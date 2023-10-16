package kr.co.haebop.service;

import kr.co.haebop.domain.Register;

import java.util.List;

public interface RegisterService {
    public List<Register> registerList() throws Exception;
    public Register registerDetail(int regno) throws Exception;
    public void registerInsert(Register register) throws Exception;
    public void registerDelete(int regno) throws Exception;
    public Register registerSelect(String id) throws Exception;
}
