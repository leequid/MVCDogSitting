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
	
	@ManyToOne
	@JoinColumn(name="dog_id") // mapped many to one to dog
	private Dog dog;

	@ManyToOne
	@JoinColumn(name="sitter_id")		//mapped ManytoOne to sitter bi-directional
	private Sitter sitter;

	
	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	@Column(name="start_date")
	@Temporal(TemporalType.DATE)
	private Date startDate;

	@Column(name="end_date")
	@Temporal(TemporalType.DATE)
	private Date endDate;

	public Dog getDog() {
		return dog;
	}
	public int getId() {
		return id;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Appointment [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}
	
}
