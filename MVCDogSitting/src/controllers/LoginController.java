package controllers;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.AuthenticationDAO;
import data.DogApplicationDAO;
import entities.Appointment;
import entities.Contact;
import entities.Dog;
import entities.Sitter;
import entities.User;

@Controller
@SessionAttributes("user")
public class LoginController {
	
	@Autowired
	private AuthenticationDAO authDao;

	@Autowired
	private DogApplicationDAO dao;

	@ModelAttribute("user")
	public User initUser() {
		return new User();
	}

	@RequestMapping(path = "start.do", method = RequestMethod.GET)
	public ModelAndView login(@ModelAttribute("user") User user) {
		User u = new User();
		List<Sitter> sitters = dao.indexOfSitters(user);
		ModelAndView mv = new ModelAndView("welcome.jsp", "user", u);
		mv.addObject("sitters", sitters);
		return mv;
	}
	
	@RequestMapping(path = "goToLogin.do", method = RequestMethod.GET)
	public ModelAndView loginOnly(@RequestParam(name="sitterId") Integer sitterId) {
		User u = new User();
		ModelAndView mv = new ModelAndView("login.jsp", "user", u);
		mv.addObject("sitter", dao.showSitter(sitterId));
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors, 
			@RequestParam(name="sitterId", required=false) Integer sitterId) {
		ModelAndView mv = new ModelAndView();
		User existingUser = authDao.validUserName(user);

		if (existingUser == null) {
			errors.rejectValue("userName", "login.userName", "Provided user name is not valid");
			mv.setViewName("login.jsp");
			return mv;

		} else {
			if (authDao.validPassword(existingUser, user.getPassword())) {
				mv.addObject("user", existingUser);
				System.out.println(existingUser.getUserName());
				if (sitterId == null) {
					mv.setViewName("profile.jsp");
				}
				else {
					mv.addObject("sitter", dao.showSitter(sitterId));
					mv.setViewName("createAppointment.jsp");
				}
				return mv;
			} else {
				errors.rejectValue("password", "login.password", "User name and password don't match");
				mv.setViewName("login.jsp");
				return mv;
			}
		}

	}

	@RequestMapping(path = "goToCreateUser.do", method = RequestMethod.GET)
	public ModelAndView goToCreateUser() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser.jsp");
		return mv;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createNewUser(@Valid User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User u = authDao.validUserName(user);
		  if (errors.getErrorCount() != 0) {
			    mv.setViewName("createUser.jsp");
			    return mv;
			  }
		if (u != null) {
			errors.rejectValue("userName", "user.userName", "User name already taken; pick another");
			mv.setViewName("createUser.jsp");
			return mv;
		} else {
			User temp = dao.createUser(user);
			mv.addObject("contactId", temp.getContact().getId());
			mv.addObject("contact", new Contact());
			mv.addObject("user", temp);
			mv.setViewName("contact.jsp");
			return mv;
		}
	}

	@RequestMapping(path = "createContact.do", method = RequestMethod.POST)
	public ModelAndView createContact(@RequestParam(name = "id") Integer id, @Valid Contact contact, Errors errors) {
		ModelAndView mv = new ModelAndView();
		  if (errors.getErrorCount() != 0) {
			  mv.addObject("contactId", id);
			    mv.setViewName("contact.jsp");
			    return mv;
			  }
		  System.out.println(errors.getErrorCount());
		Contact temp = dao.updateContact(id, contact);
		mv.addObject("user", temp.getUser());
		System.out.println(temp.getUser().getId());
		mv.setViewName("profile.jsp");
		return mv;

	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public ModelAndView goToEditPage(@ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("user", dao.showUser(user.getId()));
		mv.setViewName("editProfile.jsp");
		return mv;

	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute("user") User user, Contact contact) {
		ModelAndView mv = new ModelAndView();
		System.out.println(user.getId());
		dao.updateContact(user.getContact().getId(), contact);
		mv.addObject("user", dao.showUser(user.getId()));
		mv.setViewName("profile.jsp");
		return mv;

	}

	@RequestMapping(path = "viewSitters.do", method = RequestMethod.GET)
	public ModelAndView viewSitters(@ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView();

		List<Sitter> sitters = dao.indexOfSitters(user);
		for (Sitter s : sitters) {
			System.out.println(s);
		}
		mv.addObject("sitters", sitters);
		mv.addObject("user", user);
		mv.setViewName("viewSitters.jsp");
		return mv;

	}

	@RequestMapping(path = "setAppointment.do", method = RequestMethod.GET)
	public ModelAndView goToSetAppointment(@RequestParam(name = "sitterId") Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sitter", dao.showSitter(id));
		mv.setViewName("createAppointment.jsp");
		return mv;
	}

	@RequestMapping(path = "makeAppointment.do", method = RequestMethod.POST)
	public ModelAndView makeAppointment(@ModelAttribute User user, @RequestParam(name = "dogId") Integer dogId,
			@RequestParam(name = "startDate") String startDate, @RequestParam(name = "startTime") String startTime,
			@RequestParam(name = "endDate") String endDate, @RequestParam(name = "endTime") String endTime,
			@RequestParam(name = "sitterId") Integer sitterId) {
		ModelAndView mv = new ModelAndView();

		Date start = dao.constructDate(startDate, startTime);
		Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
		String strStart = formatter.format(start);
		Date end = dao.constructDate(endDate, endTime);
		String strEnd = formatter.format(end);
		Appointment appt = new Appointment();
		Sitter s = dao.showSitter(sitterId);
		appt.setSitter(s);
		appt.setStartDate(start);
		appt.setEndDate(end);

		Dog dog = dao.showDog(dogId);

		appt.setDog(dog);
		
		mv.addObject("strStart", strStart);
		mv.addObject("strEnd", strEnd);
		mv.addObject("appointment", dao.createAppointment(appt));
		mv.setViewName("viewAppointment.jsp");
		return mv;
	}
	
	@RequestMapping(value="welcomePage.do", method = RequestMethod.GET)   
	public String showWelcomePage() {
		return "welcome.jsp";
	}
	@RequestMapping(value="loginPage.do", method = RequestMethod.GET)   
	public String showLoginPage() {
		return "login.jsp";
	}
	@RequestMapping(value="profilePage.do", method = RequestMethod.GET)   
	public ModelAndView showProfile(@ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView();
		if(user.getUserName() == null){
			mv.setViewName("login.jsp");
		}
		else{
			mv.setViewName("profile.jsp");
		}
		return mv;
	}
	@RequestMapping(value="logout.do", method = RequestMethod.GET)  // method to remove user session is in JSPs session.removeAttribute("user"); 
	public ModelAndView logoutUser() {
		User u = new User();
		ModelAndView mv = new ModelAndView("welcome.jsp", "user", u);
		mv.addObject("user", new User());
		List<Sitter> sitters = dao.indexOfSitters(u);
		mv.addObject("sitters", sitters);
		//mv.addObject("sitters", dao.indexOfSitters(new User()));
		return mv;
	}

}
