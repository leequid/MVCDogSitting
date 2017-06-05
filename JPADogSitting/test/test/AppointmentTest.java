package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Appointment;

public class AppointmentTest {
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
    public void check_if_appointment_has_dog_object_mapped_correctly() {
    	String expectedDogName = "c";
    	assertEquals(em.find(Appointment.class, 1).getDog().getName(), expectedDogName);
    }
     @Test
     public void check_if_appointment_has_sitter_object_mapped() {
    	 int expectedSitterid = 1;
    	 assertEquals(em.find(Appointment.class,  1).getSitter().getId(), expectedSitterid);
     }
}
