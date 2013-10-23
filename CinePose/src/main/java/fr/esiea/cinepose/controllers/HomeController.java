package fr.esiea.cinepose.controllers;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.esiea.cinepose.data.DataBase;
import fr.esiea.cinepose.metier.service.ServiceCinema;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("rating", ServiceCinema.getRating());
		model.addAttribute("cinemas", DataBase.getCinemas());
		return "home";
	}	
}
