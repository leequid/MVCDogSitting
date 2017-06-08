package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
public class User {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
		
	@OneToOne(cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="contact_id") 
	private Contact contact;   			//maps one to one with contact table bi-directional
	
	@Column(name="user_name")
	@Size(min=2, max=100)
	private String userName;  
	
	@Pattern(regexp="^(?=.*\\d).{4,8}$", message="Pattern.user.password")
	private String password; //length 4~8 and must contain at least one number
	
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)		//maps bidirectional OneToMany to dogs
	private List<Dog> dogs;
	
	public Contact getContact() {
		return contact;
	}
	@OneToOne(mappedBy="user") // mapped OneToOne with sitter
	private Sitter sitter;

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public List<Dog> getDogs() {
		return dogs;
	}

	public void setDogs(List<Dog> dogs) {
		this.dogs = dogs;
	}

	@Column(name="sitter")
	private boolean activeSitter;

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

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public boolean getActiveSitter() {
		return activeSitter;
	}

	public void setActiveSitter(boolean activeSitter) {
		this.activeSitter = activeSitter;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", password=");
		builder.append(password);
		builder.append(", activeSitter=");
		builder.append(activeSitter);
		builder.append("]");
		return builder.toString();
	}

	
}
