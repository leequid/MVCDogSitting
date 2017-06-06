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
import entities.Sitter;
import entities.User;

@Controller
@SessionAttributes("user")
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

	 //still needs to be fixed
	@RequestMapping(path = "createDog.do", method = RequestMethod.POST)
	public ModelAndView createNewDog(Dog dog, @ModelAttribute("user") User user) {
		dog.setUser(user);
		dog.setImageUrl(null);
		dao.createDog(dog);
		System.out.println("********" + dog.getImageUrl());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("profile.jsp");
		User newUser = dao.showUser(user.getId());
		for (Dog d : newUser.getDogs()) {
			System.out.println(d);
		}
		mv.addObject("user", newUser);
		return mv;
	}

	@RequestMapping(path = "updateDog.do", method = RequestMethod.POST)
	public ModelAndView updateDog(Dog dog, int id) {
		ModelAndView mv = new ModelAndView("profile.jsp");
		mv.addObject("dogObject", dao.updateDog(id, dog)); // not complete
		return mv;
	}
	/// Testing
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
	//****Passed Junit Testing****
	@RequestMapping(path= "showSitter.do",  method = RequestMethod.GET)
	public String showSitter(@RequestParam("id") Integer id, Model model) {
		Sitter sitter = dao.showSitter(id);
		model.addAttribute("sitter", sitter);
		return "profile.jsp";
	}

//		*** Passed Junit Testing *****
	@RequestMapping(path= "showUser.do",  method = RequestMethod.GET)
	public String showUser(@RequestParam("id") Integer id, Model model) {
		User user = dao.showUser(id);
		model.addAttribute("user", user);
		return "profile.jsp";
		
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

}