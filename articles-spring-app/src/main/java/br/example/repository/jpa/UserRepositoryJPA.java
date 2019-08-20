package br.example.repository.jpa;

import br.example.model.User;
import br.example.repository.UserRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;

@Repository
public class UserRepositoryJPA implements UserRepository, Serializable {

    @PersistenceContext
    private EntityManager em;

    public void createUser(User user){
        try{
            this.em.persist(user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
