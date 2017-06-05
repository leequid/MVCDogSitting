package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Dog {
		
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne							//mapped ManyToOne to user
	@JoinColumn(name="dog_user_id")
	private User user;
	
	@OneToMany(mappedBy="dog")		//mapped one to many with appointment
	private List<Appointment> appointments;  
	
	public List<Appointment> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	private String name;
		
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
		return "Dog [id=" + id + ", name=" + name + ", weight=" + weight + ", imageUrl=" + imageUrl + "]";
	}
	
}
