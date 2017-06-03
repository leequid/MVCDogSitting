package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class User {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="contact_id")
	private Contact contact;   			//maps one to one with contact table
	
	@Column(name="user_name")
	private String userName;
	
	private String password;
	
	@Column(name="contact_id")
	private int contactId;
	
	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	private boolean sitter;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isSitter() {
		return sitter;
	}

	public void setSitter(boolean sitter) {
		this.sitter = sitter;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", contactId=" + contactId
				+ ", sitter=" + sitter + "]";
	}
	
	
}
