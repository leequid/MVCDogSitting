package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.AuthenticationDAOImpl;


@Controller
public class LoginController {
	@Autowired
	private AuthenticationDAOImpl authDao;
	
	@RequestMapping(path="login", method=RequestMethod.GET)
	public ModelAndView login() {
		User u = new User();
		ModelAndView mv = new ModelAndView("login.jsp", "user", u);
		return mv;
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = authDao.validEmail(user.getEmail());
		//TODO: Use the Errors object to reject the email, using the custom label found in
		//ValidationMessages.properties
		
		//TODO: Use the Errors object to reject the password, using the custom label found in
		//ValidationMessages.properties
		
		if (errors.getErrorCount() != 0) {
			mv.setViewName("login.jsp");
			return mv;
		}
		mv.addObject("user", loggedInUser);
		mv.setViewName("profile.jsp");
		return mv;
	}
}

