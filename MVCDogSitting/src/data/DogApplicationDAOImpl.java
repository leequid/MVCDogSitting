package data;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.Sitter;
import entities.User;
@Transactional
@Repository
public class DogApplicationDAOImpl implements DogApplicationDAO {
    @PersistenceContext
    private EntityManager em;
    @Override
    public Dog createDog(Dog dog) {
      //  dog.setUser(em.find(User.class, 1));//hard coded until session is added
    	em.persist(dog);
        em.flush();
        return dog;
    }
    @Override
    public boolean deleteDog(int id) {
        Dog d = em.find(Dog.class, id);
        if (d == null) {
            return false;
        } else {
            em.remove(d);
            return true;
        }
    }
    @Override
    public Dog updateDog(int id, Dog dog) {
        Dog d = em.find(Dog.class, id);
        d.setAppointments(dog.getAppointments());
        d.setImageUrl(dog.getImageUrl());
        d.setWeight(dog.getWeight());
        d.setName(dog.getName());
        d.setUser(dog.getUser());
        return dog;
    }
    @Override
    public User createUser(User user) {
    	Contact c = new Contact();
    	user.setContact(c);
        em.persist(user);
        em.flush();
        return user;
    }
    @Override
    public boolean deleteUser(int id) {
        User u = em.find(User.class, id);
        if (u == null) {
            return false;
        } else {
            em.remove(u);
            return true;
        }
    }
    @Override
    public User updateUser(int id, User user) {
        User u = em.find(User.class, id);
        u.setContact(user.getContact());
        u.setDogs(user.getDogs());
        u.setPassword(user.getPassword());
        u.setSitter(user.getSitter());
        u.setActiveSitter(user.getActiveSitter());
        return user;
        
    }
    @Override
    public Appointment createAppointment(Appointment a) {
        em.persist(a);
        em.flush();
        return a;
    }
    @Override
    public boolean cancelAppointment(int id) {
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
//        appointment.setDate(a.getDate()); 
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
        
        c.setFirstName(contact.getFirstName());
        c.setLastName(contact.getLastName());
        c.setEmail(contact.getEmail());
        c.setPhone(contact.getPhone());
        c.setState(contact.getState());
        c.setStreet(contact.getStreet());
        c.setZipCode(contact.getZipCode());
        c.setCity(contact.getCity());
    
        return c;
    }
    @Override
    public User showUser(int id) {
        return em.find(User.class, id);
    }
	@Override
	public Dog showDog(int id) {
		return em.find(Dog.class, id);
	}
	@Override
	public List<Sitter> indexOfSitters(User user) {
		
		String query = "SELECT s FROM Sitter s WHERE s.user.id != :userId";
		List<Sitter> sitters = em.createQuery(query, Sitter.class).setParameter("userId", user.getId()).getResultList();
		return sitters;
	}
	@Override
	public Sitter showSitter(int id) {
		String query = "SELECT s FROM Sitter s WHERE s.id = :sitterId";
		Sitter s = em.createQuery(query, Sitter.class).setParameter("sitterId", id).getSingleResult();
		return s;
	}
}