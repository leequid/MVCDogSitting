package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
public class Contact {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String street;
	
	@OneToOne(mappedBy="contact") //bi directional oneToOne with user
	private User user;
	
	private String state;
	
	@Column(name="first_name")
	@Size(min=2, max=50, message="Size.contact.firstName")
	private String firstName;
	
	@Column(name="last_name")
	@Size(min=2, max=50, message="Size.contact.lastName")
	private String lastName;
	
	private String city;
	
	@Column(name="zipcode")
	@Pattern(regexp="\\d{5}(-\\d{4})?", message="Pattern.contact.zipCode")
	private String zipCode;
	
	@Email
	private String email;
	
	@Pattern(regexp="(\\d{3})(-\\d{3})(-\\d{4})", message="Pattern.contact.phone")
	private String phone;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
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
		StringBuilder builder = new StringBuilder();
		builder.append("Contact [id=");
		builder.append(id);
		builder.append(", street=");
		builder.append(street);
		builder.append(", state=");
		builder.append(state);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", city=");
		builder.append(city);
		builder.append(", zipCode=");
		builder.append(zipCode);
		builder.append(", email=");
		builder.append(email);
		builder.append(", phone=");
		builder.append(phone);
		builder.append("]");
		return builder.toString();
	}

}
