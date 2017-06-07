package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicInsert;

@DynamicInsert
@Entity
public class Rating {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "num_stars")
	private double numStars;

	private String comment;
	
	@ManyToOne
	@JoinColumn(name="sitter_id")		//mapped one to many with appointment
	private Sitter sitter;

	public double getNumStars() {
		return numStars;
	}

	public void setNumStars(double numStars) {
		this.numStars = numStars;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Sitter getSitter() {
		return sitter;
	}

	public void setSitter(Sitter sitter) {
		this.sitter = sitter;
	}

	public int getId() {
		return id;
	} 
	
	
}
