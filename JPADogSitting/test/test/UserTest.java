package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.SizePreference;
import entities.User;

public class UserTest {
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
    public void check_if_user_has_sitter_object() {
   	 SizePreference expectedSizePreference = SizePreference.SMALL;
   	 assertEquals(em.find(User.class, 1).getSitter().getSizePreference(), expectedSizePreference);
    }
    @Test
    public void check_if_user_has_dog_object_access() {
    	String expectedDogName = "a";
    	assertEquals(em.find(User.class, 1).getDogs().get(0).getName(), expectedDogName);
    }
   
}
