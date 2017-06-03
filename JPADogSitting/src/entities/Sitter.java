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
	
//	@Column(name="size_pref")
//	@Enumerated(EnumType.STRING)
//	public SizePreference sizePreference;
	
	@Column(name="size_pref")
	private String sizePreference;

	public String getSizePreference() {
		return sizePreference;
	}

	public void setSizePreference(String sizePreference) {
		this.sizePreference = sizePreference;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Sitter [id=" + id + ", sizePreference=" + sizePreference + "]";
	}
	
	
}
