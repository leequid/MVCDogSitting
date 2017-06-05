package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.AuthenticationDAOImpl;
import entities.User;

@Controller
public class LoginController {
	@Autowired
	private AuthenticationDAOImpl authDao;

	@RequestMapping(path = "login", method = RequestMethod.GET)
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
			mv.addObject("error", "User Name is invalid!");
			mv.setViewName("login.do");
			return mv;
		} else {
			if (authDao.validPassword(existingUser, user.getPassword())) {
				mv.addObject("user", existingUser);
				mv.setViewName("profile.jsp"); // page name to be confirmed
				return mv;
			} else {
				mv.addObject("error", "Password is invalid!");
				mv.setViewName("login.do");
				return mv;
			}
		}

	}
}
