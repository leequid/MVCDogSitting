package data;

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
		System.out.println("validUserName method");
		User u = em.createQuery(query, User.class).setParameter("uName", user.getUserName()).getSingleResult();
		
		if (u == null) {
			return null;
		}
		else {
			return u;
		}
		
	}

	@Override
	public boolean validPassword(User dbUser, String password) {
		
		if (dbUser.getPassword().equals(password)) {return true;}
		else {return false;}

	}


}
