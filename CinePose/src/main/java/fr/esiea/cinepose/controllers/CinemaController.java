package fr.esiea.cinepose.controllers;

import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.esiea.cinepose.data.DataBase;
import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;
import fr.esiea.cinepose.metier.service.ServiceCinema;

@Controller
public class CinemaController {
	@RequestMapping(value = "/cinema", method = RequestMethod.GET)
	public String add(Locale locale, HttpServletRequest request, Model model) {
		Cinema cinema = new Cinema();
		String cinemaName = request.getParameter("cinema_name");

		Set<Cinema> correspondingCinemas = ServiceCinema.search(cinemaName);
		
		if(!correspondingCinemas.isEmpty())
			cinema = (Cinema) correspondingCinemas.toArray()[0];

		model.addAttribute("cinema", cinema);
		return "cinema";
	}	
}
