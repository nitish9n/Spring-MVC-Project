package learning.spring.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import learning.spring.mvc.model.User;

@Repository
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Save user
    public void saveUser(User user) {

        Session session = sessionFactory.getCurrentSession();

        session.persist(user);
    }

    // Get one user by ID
    public User getUserById(int id) {

        Session session = sessionFactory.getCurrentSession();

        return session.get(User.class, id);
    }

    // Get all users
    public List<User> getAllUsers() {

        Session session = sessionFactory.getCurrentSession();

        return session
                .createQuery("from User", User.class)
                .getResultList();
    }
    public User loginUser(String username, String password) {

        Session session = sessionFactory.getCurrentSession();

        return session.createQuery(
                "from User where username = :username and password = :password",
                User.class)
                .setParameter("username", username)
                .setParameter("password", password)
                .uniqueResult();
    }
}
