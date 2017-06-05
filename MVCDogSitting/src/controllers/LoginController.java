package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.AuthenticationDAO;
import entities.User;


@Controller
public class LoginController {
	@Autowired
	private AuthenticationDAO authDao;

	@RequestMapping(path = "start.do", method = RequestMethod.GET)
	public ModelAndView login() {
		User u = new User();
		ModelAndView mv = new ModelAndView("login.jsp", "user", u);
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User existingUser = authDao.validUserName(user);

		if (existingUser == null) {
			errors.rejectValue("userName", "login.userName", "Provided user name is not valid");
			mv.setViewName("login.jsp");
			return mv;
			
		} else {
			if (authDao.validPassword(existingUser, user.getPassword())) {
				mv.addObject("user", existingUser);
				mv.setViewName("profile.jsp"); // page name to be confirmed
				return mv;
			} else {
				errors.rejectValue("password", "login.password", "User name and password don't match");
				mv.setViewName("login.jsp");
				return mv;
			}
		}

	}
}
