package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
@Repository
public class AuthenticationDAOImpl implements AuthenticationDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User validUserName(User user) {
		
		String query = "SELECT u FROM User u WHERE u.userName = :uName";
		List<User> users = em.createQuery(query, User.class).setParameter("uName", user.getUserName()).getResultList();
		
		if (users.isEmpty()) {
			return null;
		}
		else {
			System.out.println(users.get(0));
			return users.get(0);
		}
		
	}

	@Override
	public boolean validPassword(User dbUser, String password) {
		
		if (dbUser.getPassword().equals(password)) {return true;}
		else {return false;}

	}


}
