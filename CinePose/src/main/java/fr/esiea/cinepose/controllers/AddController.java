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
public class AddController {
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Locale locale, Model model) {
		model.addAttribute("cinemas", DataBase.getCinemas());
		return "add";
	}	

	@RequestMapping(value = "/addCinema", method = RequestMethod.POST)
	public String addCinema(@ModelAttribute("cinema") Cinema cinema, ModelMap model) {
		DataBase.addCinema(cinema);
		return "redirect:";
	}

	@RequestMapping(value = "/addAvis", method = RequestMethod.POST)
	public String addAvis(@ModelAttribute("avis") Avis avis, HttpServletRequest request, ModelMap model) {
		String cinemaName = request.getParameter("cinema_name");
		Set<Cinema> correspondingCinemas = ServiceCinema.search(cinemaName);
		
		if(!correspondingCinemas.isEmpty()) {
			Cinema cinema = (Cinema) correspondingCinemas.toArray()[0];
			ServiceCinema.addAvisToCinema(cinema, avis);
		}
		
		return "redirect:";
	}
}
