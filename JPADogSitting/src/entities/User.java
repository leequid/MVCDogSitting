package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
	
	@OneToMany(mappedBy="user")
	private List<Dog> dogs;

	@OneToMany(mappedBy="user")						//mapped oneToMany to appointments
	private List<Appointment> appointments;
	
	public Contact getContact() {
		return contact;
	}
	@OneToOne
	@JoinColumn(name="sitter_id")    // mapped OneToOne with sitter
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

	@Column(name="contact_id")
	private int contactId;
	
	public int getContactId() {
		return contactId;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
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

	public List<Appointment> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
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
		return "User [id=" + id + ", contact=" + contact + ", userName=" + userName + ", password=" + password
				+ ", contactId=" + contactId + ", activeSitter=" + activeSitter + "]";
	}
	
	
}
