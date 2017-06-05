package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.DogApplicationDAO;

@Controller
public class DogController {
	
	@Autowired
	private DogApplicationDAO dao;
	
}


