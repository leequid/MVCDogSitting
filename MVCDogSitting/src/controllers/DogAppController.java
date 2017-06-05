package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.DogApplicationDAO;
import entities.Dog;
import entities.User;

@Controller
@SessionAttributes("User")
public class DogAppController {


	
	@Autowired
	private DogApplicationDAO dao;
	
	@ModelAttribute("newDog")
	Dog createDog() {
		return new Dog();
	}

//	@ModelAttribute("user")    <----- needs to be added to LoginController
//	User user() {
//		return new User();
//	}
	
	//still needs to be fixed
	@RequestMapping(path="CreateDog.do", method= RequestMethod.POST)
	public ModelAndView createNewDog(@ModelAttribute("newDog") Dog dog) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("profile.jsp");
		dao.createDog(dog);
		return mv;	
}

}
//@RequestMapping(path = "GetFilm.do", method = RequestMethod.GET)
//public String show(@RequestParam("id") Integer id, Model model) {
//  Film film = filmDAO.show(id);
//  model.addAttribute("film", film);
//  return "film.jsp";
//}
//String name, int weight, String imageUrl