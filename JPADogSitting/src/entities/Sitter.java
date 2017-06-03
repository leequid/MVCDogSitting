package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sitter {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="size_pref")
	@Enumerated(EnumType.STRING)
	public SizePreference sizePreference;
	
	private String email;
	
	private String phone;

	public SizePreference getSizePreference() {
		return sizePreference;
	}

	public void setSizePreference(SizePreference sizePreference) {
		this.sizePreference = sizePreference;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Sitter [id=" + id + ", sizePreference=" + sizePreference + ", email=" + email + ", phone=" + phone
				+ "]";
	}
	
	
}
