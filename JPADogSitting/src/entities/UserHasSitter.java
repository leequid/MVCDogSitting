package entities;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class UserHasSitter {

	@Column(name="user_id")
	private int userId;
	
	@Column(name="sitter_id")
	private int sitterId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSitterId() {
		return sitterId;
	}

	public void setSitterId(int sitterId) {
		this.sitterId = sitterId;
	}

	@Override
	public String toString() {
		return "UserHasSitter [userId=" + userId + ", sitterId=" + sitterId + "]";
	}
	
	
}
