package learning.spring.mvc.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Service;
import learning.spring.mvc.model.User;

@Service
public class UserService {
	
	List<User> listOfUsers = new ArrayList<>();
	
	public void addUser(User user) {
		
		listOfUsers.add(user);
		System.out.println("UserService.addUser()");
		
	}

	public User validateUser(String username, String password) {
		boolean flag = false;
		for (User user: listOfUsers) {
			
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return user;
			}
			
		}System.out.println("UserService.validateuUser");
		return null;
		
	}
	
	
}
