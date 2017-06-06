package entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.DynamicInsert;

@DynamicInsert
@Entity
public class Dog {
		
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne							//mapped ManyToOne to user
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy="dog")		//mapped one to many with appointment
	private List<Appointment> appointments;  
	
	public List<Appointment> getAppointments() {
		return appointments;
	}
	
	@ManyToMany
	@JoinTable(name="appointment",			// Maps ManyToMany to sitter
		joinColumns=@JoinColumn(name="dog_id"),
		inverseJoinColumns=@JoinColumn(name="sitter_id")
	)
	private List<Sitter> sitters;

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	private String name;
		
	public User getUser() {
		return user;
	}

	public List<Sitter> getSitters() {
		return sitters;
	}

	public void setSitters(List<Sitter> sitters) {
		this.sitters = sitters;
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
	

	public Dog(String name, int weight, String imageUrl) {
		super();
		this.name = name;
		this.weight = weight;
		this.imageUrl = imageUrl;
	}

	public Dog() {
		super();
	}

	@Override
	public String toString() {
		return "Dog [id=" + id + ", name=" + name + ", weight=" + weight + ", imageUrl=" + imageUrl + "]";
	}
	
}
