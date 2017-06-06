package controllers;

//import javax.enterprise.inject.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import data.DogApplicationDAO;
import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.User;

@Controller
@SessionAttributes("User")
public class DogAppController {

	@Autowired
	private DogApplicationDAO dao;
	
	public void setDogAppDao(DogApplicationDAO dao) {
		this.dao = dao;
	}
	@ModelAttribute("newDog")
	Dog createDog() {
		return new Dog();
	}

	// @ModelAttribute("user") <----- needs to be added to LoginController
	// User user() {
	// return new User();
	// }

	// still needs to be fixed
	@RequestMapping(path = "createDog.do", method = RequestMethod.POST)
	public ModelAndView createNewDog(@ModelAttribute("newDog") Dog dog) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("profile.jsp");
		dao.createDog(dog);
		return mv;
	}

	@RequestMapping(path = "updateDog.do", method = RequestMethod.POST)
	public ModelAndView updateDog(Dog dog, int id) {
		ModelAndView mv = new ModelAndView("profile.jsp");
		mv.addObject("dogObject", dao.updateDog(id, dog)); // not complete
		return mv;
	}

	@RequestMapping(path = "deleteDog.do", method = RequestMethod.POST)
	public ModelAndView deleteDog(int id) {
		ModelAndView mv = new ModelAndView("profile.jsp");
		dao.deleteDog(id); // not complete
		return mv;
	}

    //   ***Passed Junit Testing***
	@RequestMapping(path= "showDog.do",  method = RequestMethod.GET)
	public String show(@RequestParam("id") Integer id, Model model) {
		Dog dog = dao.showDog(id);
		model.addAttribute("dog", dog);
		return "profile.jsp";
		
	}

//	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
//	public ModelAndView createUser(@ModelAttribute("newUser") User user) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("register.jsp");
//		dao.createUser(user); // not complete. not sure which JSP to send to
//		return mv;
//	}
//
//	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
//	public ModelAndView updateUser(User user, int id) {
//		ModelAndView mv = new ModelAndView("profile.jsp");
//		mv.addObject("UserObject", dao.updateUser(id, user)); // not complete
//		return mv;
//	}

	@RequestMapping(path = "showUser.do", method = RequestMethod.GET)
	public ModelAndView showUser(int id) {
		ModelAndView mv = new ModelAndView("profile.jsp");
		dao.showUser(id); // not complete
		return mv;
	}

	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public ModelAndView deleteUser(int id) {
		ModelAndView mv = new ModelAndView("profile.jsp");
		dao.deleteUser(id); // not complete
		return mv;
	}

	@RequestMapping(path = "createAppointment.do", method = RequestMethod.POST)
	public ModelAndView createAppointment(@ModelAttribute("newAppointment") Appointment appointment) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("appointment.jsp");
		dao.createAppointment(appointment); // not complete
		return mv;
	}

	@RequestMapping(path = "reschedule.do", method = RequestMethod.POST)
	public ModelAndView reschedule(int id, Appointment appointment) {
		ModelAndView mv = new ModelAndView("appointment.jsp");
		mv.addObject("AppointmentObject", dao.reschedule(id, appointment)); // not
																			// complete
		return mv;
	}

	@RequestMapping(path = "cancelAppointment.do", method = RequestMethod.POST)
	public ModelAndView cancelAppointment(int id) {
		ModelAndView mv = new ModelAndView("Appointment.jsp");
		dao.cancelAppointment(id); // not complete
		return mv;
	}
//
//	@RequestMapping(path = "createContact.do", method = RequestMethod.POST)
//	public ModelAndView createContact(Contact contact) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("register.jsp");
//		dao.createContact(contact); // not complete. not sure which JSP to send
//									// to
//		return mv;
//	}
//
//	@RequestMapping(path = "updateContact.do", method = RequestMethod.POST)
//	public ModelAndView updateContact(int id, Contact contact) {
//		ModelAndView mv = new ModelAndView("profile.jsp");
//		mv.addObject("ContactObject", dao.updateContact(id, contact)); // not
//																		// complete
//		return mv;
//	}
}

// @ModelAttribute("user") <----- needs to be added to LoginController
// User user() {
// return new User();
// }

// still needs to be fixed

// @RequestMapping(path = "GetFilm.do", method = RequestMethod.GET)
// public String show(@RequestParam("id") Integer id, Model model) {
// Film film = filmDAO.show(id);
// model.addAttribute("film", film);
// return "film.jsp";
// }
// String name, int weight, String imageUrl