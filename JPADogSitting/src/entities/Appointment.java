package entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Appointment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
//	@Column(name="sitter_id")
//	private int sitterId;
//	
//	@Column(name="user_id")
//	private int userId;
	
	@ManyToMany(mappedBy="appointments")    // mapped many to many to dogs
	private List<Dog> dogs;
	
	public List<Dog> getDogs() {
		return dogs;
	}

	@ManyToOne
	@JoinColumn(name="user_id")		//mapped ManytoOne to user
	private User user;

	@ManyToOne
	@JoinColumn(name="sitter_id")		//mapped ManytoOne to sitter
	private Sitter sitter;
	
	public void setDogs(List<Dog> dogs) {
		this.dogs = dogs;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	@Temporal(TemporalType.DATE)
	private Date date;

//	public int getSitterId() {
//		return sitterId;
//	}
//
//	public void setSitterId(int sitterId) {
//		this.sitterId = sitterId;
//	}
//
//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

//	@Override
//	public String toString() {
//		return "Appointment [id=" + id + ", sitterId=" + sitterId + ", userId=" + userId + ", date=" + date + "]";
//	}
//	
}
