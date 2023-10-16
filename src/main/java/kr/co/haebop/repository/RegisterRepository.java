package kr.co.haebop.repository;

import kr.co.haebop.domain.Register;
import kr.co.haebop.domain.Subject;

import java.util.List;

public interface RegisterRepository {
    public List<Register> registerList() throws Exception;
    public Register registerDetail(int regno) throws Exception;
    public void registerInsert(Register register) throws Exception;
    public void registerDelete(int regno) throws Exception;
    public Register registerSelect(String id) throws Exception;
}
