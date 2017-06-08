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
import entities.Sitter;
import entities.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/test-context.xml" })
@WebAppConfiguration
@Transactional                               
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
    @Test
    public void test_get_show_sitter_returns_sitter_view_and_model() {
    	try {
    		MvcResult response = mockMvc.perform(get("/showSitter.do?id=1")).andExpect(status().isOk()).andReturn();
    		ModelAndView mv = response.getModelAndView();
    		ModelMap map = mv.getModelMap();
    		Sitter s = (Sitter) map.get("sitter");
    		assertEquals("profile.jsp", mv.getViewName());
    		assertEquals(1, s.getId());
    	} catch (Exception e) {
    		fail(e.toString());
    	}
    }
    @Test
    public void test_get_show_user_returns_user_view_and_model() {
    	try {
    		MvcResult response = mockMvc.perform(get("/showUser.do?id=1")).andExpect(status().isOk()).andReturn();
    		ModelAndView mv = response.getModelAndView();
    		ModelMap map = mv.getModelMap();
    		User u = (User) map.get("user");
    		assertEquals("profile.jsp", mv.getViewName());
    		assertEquals("Eric", u.getUserName());
    	} catch (Exception e) {
    		fail(e.toString());
    	}
    }
//    @Test
//    public void test_delete_dog_returns_profile_view_and_model() {
//    	try {
//    		MvcResult response = mockMvc.perform(get("/showDog.do?id=1")).andExpect(status().isOk()).andReturn();
//    		ModelAndView mv = response.getModelAndView();
//    		ModelMap map = mv.getModelMap();
//    		Dog d = (Dog) map.get("dog");
//    
//    		//User u = (User) map.get("user");
//    		assertEquals("profile.jsp", mv.getViewName());
//    		assertEquals("Eric", dao.deleteDog(1));
//    	} catch (Exception e) {
//    		fail(e.toString());
//    	}
//    }
}
