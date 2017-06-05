package data;

import entities.User;

public interface AuthenticationDAO {
	public User validUserName(User user);
	public boolean validPassword(User dbUser, String password);
}
