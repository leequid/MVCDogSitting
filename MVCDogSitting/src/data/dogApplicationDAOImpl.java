package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.User;

@Transactional
@Repository
public class dogApplicationDAOImpl implements dogApplicationDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Dog createDog(Dog dog) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteDog(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Dog updateDog(int id, Dog dog) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User updateUser(int id, User user) {
		User u = em.find(User.class, id);
		u.setContact(user.getContact());
		u.setContactId(user.getContactId());
		u.setDogs(user.getDogs());
		u.setPassword(user.getPassword());
		u.setSitter(user.getSitter());
		u.setActiveSitter(user.get)
	}

	@Override
	public Appointment createAppointment(Appointment a) {
		em.persist(a);
		em.flush();
		return a;
	}

	@Override
	public boolean cancleAppointment(int id) {
		Appointment a = em.find(Appointment.class, id);
		if (a == null) {
			return false;
		} else {
			em.remove(a);
			return true;
		}
	}

	@Override
	public Appointment reschedule(int id, Appointment a) {
		Appointment appointment = em.find(Appointment.class, id);
		appointment.setDate(a.getDate()); 
		return appointment;

	}

	@Override
	public Contact createContact(Contact contact) {
		em.persist(contact);
		em.flush();
		return contact;
	}

	@Override
	public Contact updateContact(int id, Contact contact) {
		Contact c = em.find(Contact.class, id);
		c.setEmail(contact.getEmail());
		c.setPhone(contact.getPhone());
		c.setState(contact.getState());
		c.setStreet(contact.getStreet());
		c.setZipCode(contact.getZipCode());
	
		return c;
	}

	@Override
	public User showUser(int id) {
		return em.find(User.class, id);
	}

}
