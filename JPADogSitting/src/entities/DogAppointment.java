package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DogAppointment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="dog_id")
	private int dogId;
	
	@Column(name="appointment_id")
	private int appointmentId;

	public int getDogId() {
		return dogId;
	}

	public void setDogId(int dogId) {
		this.dogId = dogId;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "DogAppointment [id=" + id + ", dogId=" + dogId + ", appointmentId=" + appointmentId + "]";
	}
	
	
}
