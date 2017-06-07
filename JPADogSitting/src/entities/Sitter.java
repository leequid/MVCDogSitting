package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Sitter {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy="sitter")		//mapped OneToMany to Appointment bi-directional
	private List<Appointment> appointments;
	
	@OneToMany(mappedBy="sitter")	//mapped OneToMany to Appointment bi-directional
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Rating> ratings;
	

	public List<Appointment> getAppointments() {
		return appointments;
	}
	@OneToOne //mapped OneToOne with user
	@JoinColumn(name="user_id") 
	private User user;
	
	public User getUser() {
		return user;
	}
	public List<Dog> getDogs() {
		return dogs;
	}

	public void setDogs(List<Dog> dogs) {
		this.dogs = dogs;
	}
	@ManyToMany(mappedBy="sitters")
	private List<Dog> dogs;
	
	
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
	public List<Rating> getRatings() {
		return ratings;
	}
	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}
	
	
}
