package kr.co.haebop.service;

import kr.co.haebop.domain.User;
import kr.co.haebop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
    @Override
    public List<User> UserList() throws Exception {
        return userRepository.UserList();
    }

    @Override
    public User getUser(String id) {
        return userRepository.getUser(id);
    }

    @Override
    public boolean idCheck(String id) {
        return userRepository.getUser(id) ==null ? true : false;
    }

    @Override
    public void UserInsert(User user) {
        userRepository.UserInsert(user);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        User user = userRepository.loginCheck(id);

        if(user!=null && pwEncoder.matches(pw, user.getPw())){
            comp = true;
        } else {
            comp = false;
        }
        return comp;
    }

    @Override
    public void updateVisited(String id) throws Exception {
        userRepository.updateVisited(id);
    }

    @Override
    public void UserEdit(User user) throws Exception {
        userRepository.UserEdit(user);
    }

    @Override
    public void UserDelete(String id) throws Exception {
        userRepository.UserDelete(id);
    }

    @Override
    public int UserCnt() throws Exception {
        return userRepository.UserCnt();
    }
}
