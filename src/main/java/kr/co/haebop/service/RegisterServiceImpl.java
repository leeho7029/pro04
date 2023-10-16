package kr.co.haebop.service;

import kr.co.haebop.domain.Register;
import kr.co.haebop.repository.LectureRepository;
import kr.co.haebop.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService{
    @Autowired
    RegisterRepository registerRepository;
    @Autowired
    LectureRepository lectureRepository;

    @Override
    public List<Register> registerList() throws Exception {
        return registerRepository.registerList();
    }

    @Override
    public Register registerDetail(int regno) throws Exception {
        return registerRepository.registerDetail(regno);
    }

    @Override
    public void registerInsert(Register register) throws Exception {
        registerRepository.registerInsert(register);
    }

    @Override
    public void registerDelete(int regno) throws Exception {
        registerRepository.registerDelete(regno);
    }

    @Override
    public Register registerSelect(String id) throws Exception {
        return  registerRepository.registerSelect(id);
    }
}
