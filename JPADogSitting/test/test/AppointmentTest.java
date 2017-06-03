package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

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
    
}
