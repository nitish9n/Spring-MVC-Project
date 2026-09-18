package learning.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import learning.spring.mvc.dao.AdminDAO;
import learning.spring.mvc.model.Admin;

@Service
public class AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Transactional(readOnly = true)
    public Admin loginAdmin(String username, String password) {

        return adminDAO.loginAdmin(username, password);
    }
}