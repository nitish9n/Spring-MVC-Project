package learning.spring.mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import learning.spring.mvc.model.User;

@Service
public class UserService {
	
	Map<Integer,User> allUsers = new HashMap<>();
	
	public void addUser(User user) {
		
		allUsers.put(user.getId(), user);
		System.out.println("UserService.addUser()");
		
	}

	public User validateUser(int id) {
		return allUsers.get(id);
		
	}

	public Map<Integer, User> getAllUsers() {
		return allUsers;
	}
	
	
}
