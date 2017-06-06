package ctrl;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import controllers.DogAppController;
import data.DogApplicationDAO;
import entities.Dog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/test-context.xml" })
@WebAppConfiguration
@Transactional                               // you will need this if you are using DAO methods with transactions
public class DogAppControllerTest {
    @Autowired
    private WebApplicationContext wac;
    private MockMvc mockMvc;
    @Autowired
    private DogAppController controller;
    private DogApplicationDAO dao;
    @Before
    public void setUp() throws Exception {
        dao = (DogApplicationDAO) wac.getBean("dogapplicationdao");
        controller.setDogAppDao(dao);
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }
    @After
    public void tearDown() throws Exception {
        controller = null;
        mockMvc = null;
        wac = null;
    }
    @Test
    public void test_get_show_dog_returns_dog_view_and_model() {
        try {
            MvcResult response = mockMvc.perform(get("/showDog.do?id=1")).andExpect(status().isOk()).andReturn();
            ModelAndView mv = response.getModelAndView();
            ModelMap map = mv.getModelMap();
            Dog d = (Dog) map.get("dog");
            assertEquals("profile.jsp", mv.getViewName());
            assertEquals("a", d.getName());
        } catch (Exception e) {
            fail(e.toString());
        }
    }
//    @Test
//    public void test_get_film_returns_film_view_and_model() {
//    	try {
//    		// Use MockMVC to create a request to the test servlet and get a
//    		// response
//    		MvcResult response = mockMvc.perform(get("/GetFilm.do?id=1")).andExpect(status().isOk()).andReturn();
//    		// Extract the returned ModelAndView from the response
//    		ModelAndView mv = response.getModelAndView();
//    		// Extract the Model from the ModelAndView
//    		ModelMap map = mv.getModelMap();
//    		// Cast the Object value paired to the "film" key to a Film object
//    		Film f = (Film) map.get("film");
//    		// Check the values with JUnit tests
//    		assertEquals("film.jsp", mv.getViewName());
//    		assertEquals("ACADEMY DINOSAUR", f.getTitle());
//    	} catch (Exception e) {
//    		fail(e.toString());
//    	}
//    }
}
