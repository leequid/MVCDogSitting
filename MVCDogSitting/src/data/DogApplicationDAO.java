package data;

import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.User;

public interface DogApplicationDAO {
public Dog createDog(Dog dog);
public User showUser(int id);
public boolean deleteDog(int id);
public Dog updateDog(int id, Dog dog);
public User createUser(User user);
public boolean deleteUser(int id);
public User updateUser(int id, User user);
public Appointment createAppointment(Appointment a);
public boolean cancleAppointment(int id);
public Appointment reschedule(int id, Appointment a);
public Contact createContact(Contact contact);
public Contact updateContact(int id, Contact contact);
}
