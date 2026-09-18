package learning.spring.mvc.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import learning.spring.mvc.dao.ContactMessageDAO;
import learning.spring.mvc.model.ContactMessage;

@Service
public class ContactMessageService {

    @Autowired
    private ContactMessageDAO contactMessageDAO;


    // =========================================================
    // SAVE NEW CONTACT MESSAGE
    // =========================================================

    @Transactional
    public void saveMessage(ContactMessage contactMessage) {

        // Set message creation time
        contactMessage.setCreatedAt(
                LocalDateTime.now());

        // New messages are waiting for admin reply
        contactMessage.setStatus("PENDING");

        contactMessageDAO.saveMessage(
                contactMessage);
    }


    // =========================================================
    // GET ALL MESSAGES
    // =========================================================

    @Transactional(readOnly = true)
    public List<ContactMessage> getAllMessages() {

        return contactMessageDAO.getAllMessages();
    }


    // =========================================================
    // GET MESSAGE BY ID
    // =========================================================

    @Transactional(readOnly = true)
    public ContactMessage getMessageById(int id) {

        return contactMessageDAO.getMessageById(id);
    }


    // =========================================================
    // GET MESSAGES BY USER EMAIL
    // =========================================================

    @Transactional(readOnly = true)
    public List<ContactMessage> getMessagesByEmail(
            String email) {

        return contactMessageDAO.getMessagesByEmail(
                email);
    }


    // =========================================================
    // GET PENDING MESSAGES
    // =========================================================

    @Transactional(readOnly = true)
    public List<ContactMessage> getPendingMessages() {

        return contactMessageDAO.getPendingMessages();
    }


    // =========================================================
    // ADMIN REPLY
    // =========================================================

    @Transactional
    public void replyToMessage(
            int id,
            String reply) {

        ContactMessage contactMessage =
                contactMessageDAO.getMessageById(id);

        if (contactMessage != null) {

            // Save admin's reply
            contactMessage.setReply(reply);

            // Change status
            contactMessage.setStatus("REPLIED");

            // Record reply time
            contactMessage.setRepliedAt(
                    LocalDateTime.now());

            contactMessageDAO.updateMessage(
                    contactMessage);
        }
    }


    // =========================================================
    // UPDATE MESSAGE
    // =========================================================

    @Transactional
    public void updateMessage(
            ContactMessage contactMessage) {

        contactMessageDAO.updateMessage(
                contactMessage);
    }
}