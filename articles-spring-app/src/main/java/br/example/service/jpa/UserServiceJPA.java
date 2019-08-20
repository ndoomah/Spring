package br.example.service.jpa;

import br.example.model.User;
import br.example.repository.UserRepository;
import br.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
public class UserServiceJPA implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public void createUser(User user){
         this.userRepository.createUser(user);
    }
}
