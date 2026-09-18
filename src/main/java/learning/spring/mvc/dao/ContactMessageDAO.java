package learning.spring.mvc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import learning.spring.mvc.model.ContactMessage;

@Repository
public class ContactMessageDAO {

    @Autowired
    private SessionFactory sessionFactory;


    // =========================================================
    // SAVE CONTACT MESSAGE
    // =========================================================

    public void saveMessage(ContactMessage contactMessage) {

        Session session =
                sessionFactory.getCurrentSession();

        session.persist(contactMessage);
    }


    // =========================================================
    // GET ALL CONTACT MESSAGES
    // =========================================================

    public List<ContactMessage> getAllMessages() {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from ContactMessage " +
                "order by createdAt desc",
                ContactMessage.class)
                .getResultList();
    }


    // =========================================================
    // GET MESSAGE BY ID
    // =========================================================

    public ContactMessage getMessageById(int id) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.get(
                ContactMessage.class,
                id);
    }


    // =========================================================
    // GET MESSAGES BY USER EMAIL
    // =========================================================

    public List<ContactMessage> getMessagesByEmail(
            String email) {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from ContactMessage " +
                "where email = :email " +
                "order by createdAt desc",
                ContactMessage.class)
                .setParameter("email", email)
                .getResultList();
    }


    // =========================================================
    // GET PENDING MESSAGES
    // =========================================================

    public List<ContactMessage> getPendingMessages() {

        Session session =
                sessionFactory.getCurrentSession();

        return session.createQuery(
                "from ContactMessage " +
                "where status = :status " +
                "order by createdAt desc",
                ContactMessage.class)
                .setParameter("status", "PENDING")
                .getResultList();
    }


    // =========================================================
    // UPDATE MESSAGE
    // =========================================================

    public void updateMessage(
            ContactMessage contactMessage) {

        Session session =
                sessionFactory.getCurrentSession();

        session.merge(contactMessage);
    }
}