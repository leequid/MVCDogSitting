 package data;

import java.util.Date;
import java.util.List;

import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.Rating;
import entities.Sitter;
import entities.User;

public interface DogApplicationDAO {

public Dog createDog(Dog dog);
public Dog updateDog(int id, Dog dog);
public Dog showDog(int id);
public boolean deleteDog(int id);

public User createUser(User user);
public User updateUser(int id, User user);
public User showUser(int id);
public boolean deleteUser(int id);

public Appointment createAppointment(Appointment a);
public Appointment reschedule(int id, Appointment a);
public boolean cancelAppointment(int id);

public Contact createContact(Contact contact);
public Contact updateContact(int id, Contact contact);

public List<Sitter> indexOfSitters(User user);
public Sitter showSitter(int id);

public Date constructDate(String date, String time);

public Rating addRatingToDB(Integer userId, Double rating, Integer sitterId);
}
