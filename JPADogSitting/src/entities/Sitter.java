package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

	@OneToMany(mappedBy="sitter")		//mapped OneToMany to Appointment bi-directional
	private List<Appointment> appointments;

	public List<Appointment> getAppointments() {
		return appointments;
	}
	@OneToOne(mappedBy="sitter") //mapped OneToOne with user
	private User user;
	
	public User getUser() {
		return user;
	}

	@Enumerated(EnumType.STRING)
	@Column(name="size_pref")
	public SizePreference sizePreference;

	public void setUser(User user) {
		this.user = user;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public SizePreference getSizePreference() {
		return sizePreference;
	}

	public void setSizePreference(SizePreference sizePreference) {
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
