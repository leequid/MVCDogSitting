package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Dog {
		
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="dog_user_id")
	private User user;
	
	@ManyToMany(cascade={CascadeType.PERSIST, CascadeType.REMOVE})		//mapped many to many with appointment
	@JoinTable(name="dog_appointment",
		joinColumns=@JoinColumn(name="dog_id"),
		inverseJoinColumns=@JoinColumn(name="appointment_id")
	)
	private List<Appointment> appointments;  
	
	public List<Appointment> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	private String name;
	
	@Column(name="dog_user_id")
	private int dogUserId;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private int weight;
	
	@Column(name="img_url")
	private String imageUrl;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDogUserId() {
		return dogUserId;
	}

	public void setDogUserId(int dogUserId) {
		this.dogUserId = dogUserId;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Dog [id=" + id + ", name=" + name + ", dogUserId=" + dogUserId + ", weight=" + weight + ", imageUrl="
				+ imageUrl + "]";
	}
	
}
