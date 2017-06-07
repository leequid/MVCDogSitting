package entities;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.annotations.DynamicInsert;

@DynamicInsert
@Entity
public class Rating {

	@Column(name="num_stars")
	private double numStars;

	public double getNumStars() {
		return numStars;
	}

	public void setNumStars(double numStars) {
		this.numStars = numStars;
	}
	
	
	
	
}
