package fr.esiea.cinepose.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.esiea.cinepose.data.DataBase;
import fr.esiea.cinepose.metier.service.ServiceCinema;

@Controller
public class ContactController {	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "contact";
	}	
}
