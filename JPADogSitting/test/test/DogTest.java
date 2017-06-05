package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Appointment;
import entities.Dog;

public class DogTest {
	private EntityManager em = null;
    
	
	@Before
    public void setup() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("DogSitting");
        em = emf.createEntityManager();
    }
    @After
    public void tearDown() {
        if (em != null) {
            em.close();
        }
    }
    @Test
    public void test() {
        boolean pass = true;
        assertEquals(pass, true);
    }
    @Test
    public void check_if_dog_has_user() {
   	  String expectedUserName = "Eric";
   	 assertEquals(em.find(Dog.class,  1).getUser().getUserName(), expectedUserName);
    }
    @Test
    public void check_if_dog_has_user_contactId() {
    	int expectedContactId = 1;
    	assertEquals(em.find(Dog.class,  1).getUser().getContact().getId(), expectedContactId);
    }
    @Test
    public void check_if_dog_has_user_contact_firstname() {
    	String expectedFirstName = "Eric";
    	assertEquals(em.find(Dog.class,  1).getUser().getContact().getFirstName(), expectedFirstName);
    }
}

