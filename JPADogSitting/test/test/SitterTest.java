package test;

import static org.junit.Assert.*;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Sitter;
import entities.SizePreference;
import entities.User;

public class SitterTest {
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
	public void check_if_sitter_has_appointment() {
		assertNotNull(em.find(Sitter.class, 1).getAppointments());
	}

	@Test
	public void check_if_sitter_has_appointment_id_accessible() {
		System.out.println(em.find(Sitter.class, 1).getSizePreference());
		assertEquals(em.find(Sitter.class, 1).getAppointments().get(0).getStartDate().toString(), "2016-02-12");
	}

	@Test
	public void check_if_sitter_has_user_mapped_correctly() {
		String expectedUserName = "Ryan";
		assertEquals(em.find(Sitter.class, 2).getUser().getUserName(), expectedUserName);
	}
}
