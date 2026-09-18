package learning.spring.mvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import learning.spring.mvc.model.Admin;

@Repository
public class AdminDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public Admin loginAdmin(String username, String password) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from Admin where username = :username and password = :password",
                Admin.class)
                .setParameter("username", username)
                .setParameter("password", password)
                .uniqueResult();
    }
}