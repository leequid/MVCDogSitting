 package data;

import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.User;

public interface DogApplicationDAO {

public Dog createDog(Dog dog);
public Dog updateDog(int id, Dog dog);
public Dog showDog(int id);
public boolean deleteDog(int id);

public User showUser(int id);
public User createUser(User user);
public User updateUser(int id, User user);
public boolean deleteUser(int id);

public Appointment createAppointment(Appointment a);
public Appointment reschedule(int id, Appointment a);
public boolean cancelAppointment(int id);

public Contact createContact(Contact contact);
public Contact updateContact(int id, Contact contact);
}
