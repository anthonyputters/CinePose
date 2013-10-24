package fr.esiea.cinepose.controllers;

import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.esiea.cinepose.data.DataBase;
import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;
import fr.esiea.cinepose.metier.service.ServiceCinema;

@Controller
public class SearchController {
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Locale locale, Model model) {
		return "search";
	}	

	@RequestMapping(value = "/searchCinema", method = RequestMethod.GET)
	public String searchResult(HttpServletRequest request, ModelMap model) {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
	
		Set<Cinema> correspondingCinemas = ServiceCinema.search(name, address);

		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("cinemas", correspondingCinemas);
		
		return "search";
	}
}
