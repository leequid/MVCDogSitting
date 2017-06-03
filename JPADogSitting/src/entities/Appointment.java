package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Appointment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="sitter_id")
	private int sitterId;
	
	@Column(name="user_id")
	private int userId;
	
	@Temporal(TemporalType.DATE)
	private Date date;

	public int getSitterId() {
		return sitterId;
	}

	public void setSitterId(int sitterId) {
		this.sitterId = sitterId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Appointment [id=" + id + ", sitterId=" + sitterId + ", userId=" + userId + ", date=" + date + "]";
	}
	
}
