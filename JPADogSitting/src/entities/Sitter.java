package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Sitter {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
//	@Column(name="size_pref")
//	@Enumerated(EnumType.STRING)
//	public SizePreference sizePreference;
	
	@Column(name="size_pref")
	private String sizePreference;

	public String getSizePreference() {
		return sizePreference;
	}
	@OneToMany(mappedBy="sitter")		//mapped OneToMany to Appointment
	private List<Appointment> appointments;

	public List<Appointment> getAppointments() {
		return appointments;
	}
	@OneToOne(mappedBy="sitter") //mapped OneToOne with user
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public void setSizePreference(String sizePreference) {
		this.sizePreference = sizePreference;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Sitter [id=" + id + ", sizePreference=" + sizePreference + "]";
	}
	
	
}
