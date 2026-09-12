package learning.spring.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import learning.spring.mvc.dao.UserDAO;
import learning.spring.mvc.model.User;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    @Transactional
    public void addUser(User user) {

        userDAO.saveUser(user);

        System.out.println("User registered successfully: " + user);
    }

    @Transactional
    public User validateUser(int id) {

        return userDAO.getUserById(id);
    }

    @Transactional
    public List<User> getAllUsers() {

        return userDAO.getAllUsers();
    }
    @Transactional
    public User loginUser(String username, String password) {

        return userDAO.loginUser(username, password);
    }
}
