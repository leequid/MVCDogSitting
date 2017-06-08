package data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Appointment;
import entities.Availability;
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
        if(user.getActiveSitter()) {
        		
        	Sitter s = new Sitter();
        	s.setUser(user);
        	em.persist(s);
        	em.flush();
        }
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
        u.setDogs(user.getDogs());
        u.setPassword(user.getPassword());
        u.setActiveSitter(user.getActiveSitter());
        Sitter s = new Sitter();
    		s.setUser(user);
    		u.setSitter(s);
    		em.persist(s);
    		em.flush();
        return user;
    }
    
    @Override
    public Appointment createAppointment(Appointment a) {
        em.persist(a);
        em.flush();
        
        return em.find(Appointment.class, a.getId());
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
	@Override
	public Date constructDate(String date, String time) {
		Date formattedDate = new Date();
		try {
		    SimpleDateFormat format =
		        new SimpleDateFormat("yyyy-MM-dd h:mm");
		    formattedDate = format.parse(date + " " + time);
		}
		catch(ParseException pe) {
		    throw new IllegalArgumentException();
		}
		return formattedDate;
	}
	@Override
	public Appointment showAppointment(int id) {
		String query = "SELECT a FROM Appointment a WHERE a.id = :apptId";
		Appointment a = em.createQuery(query, Appointment.class).setParameter("apptId", id).getSingleResult();
		return a;
	}
	@Override
	public void setRatingInDB(Appointment a) {
		Appointment temp = em.find(Appointment.class, a.getId());
		temp.setRating(a.getRating());
		Sitter s = em.find(Sitter.class, a.getSitter().getId());
		Double averageRating = calculateAverage(s.getAppointments());
		s.setAverageRating(averageRating);
	}
	
	public double calculateAverage(List<Appointment> appts) {
		int count = 0;
		double total = 0, average = 0;
		
		for (Appointment a : appts) {
			if(a.getRating() != 0) {
			total += a.getRating();
			count ++;
			}
		}
		if (count != 0) {
		average = total/count;
		}
		
		return average;
	}
	@Override
	public User updateSitter(Integer id, Availability a) {
		Sitter s = em.find(Sitter.class, id);
		s.setAvailability(a);
		User u = em.find(User.class, s.getUser().getId());
		return u;
	}

	
}