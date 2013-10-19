package fr.esiea.cinepose.controllers;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddController {
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "add";
	}	
}
