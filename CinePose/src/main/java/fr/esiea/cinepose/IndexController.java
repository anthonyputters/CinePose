package fr.esiea.cinepose;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.esiea.cinepose.data.Persistence;
import fr.esiea.cinepose.metier.model.Cinema;
import fr.esiea.cinepose.metier.service.ServiceAvis;
import fr.esiea.cinepose.metier.service.ServiceCinema;

@Controller
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome to CinePose !", locale);
		if(Persistence.isDataWrited()) {
			Persistence.readData();
		}
		else {
			// Ajout de quelques cinémas et avis pour tester le site
			Cinema grand_rex = ServiceCinema.createCinema("Le Grand Rex", "1 Boulevard Poissonnière, Paris, France", "Entre 5 et 10", 48.870564f, 2.3474872f);
			Cinema gaumont_gobelin = ServiceCinema.createCinema("Gaumont Gobelins", "58 Avenue des Gobelins, Paris, France", "Moins de 5", 48.83355f, 2.353861f);
			Cinema arlequin = ServiceCinema.createCinema("L'Arlequin", "76 Rue de Rennes, Paris, France", "Entre 10 et 20", 48.851105f, 2.3306463f);
			Cinema ugc_montparnasse = ServiceCinema.createCinema("UGC Montparnasse", "83 Boulevard du Montparnasse, Paris, France", "Entre 10 et 20", 48.84342f, 2.3253179f);
			Cinema mk2_bibliotheque = ServiceCinema.createCinema("MK2 Bibliothèque", "128 Avenue de France, Paris, France", "Plus de 20", 48.8332f, 2.3745792f);

			ServiceAvis.addAvis(grand_rex, 5, 5, 4, 5, 4, "Très belle salle ! Les fauteuils sont hypers confortables.");
			ServiceAvis.addAvis(gaumont_gobelin, 3, 3, 4, 4, 4, "Très calme, mais pas beaucoup de choix.");
			ServiceAvis.addAvis(arlequin, 3, 5, 4, 4, 3, "Facile d'accès en métro. Plutôt porté sur les films d'art et d'essais mais la selection est très bien faite.");
			ServiceAvis.addAvis(ugc_montparnasse, 4, 3, 3, 5, 4, "Un cinéma acceuillant, dans un très belle endroit !");
			ServiceAvis.addAvis(mk2_bibliotheque, 4, 5, 3, 4, 5, "Beaucoup de choix et de Salles. Tarifs très intéressants.");
			ServiceAvis.addAvis(mk2_bibliotheque, 5, 5, 3, 4, 4, "Salles très confortables.");
		}
		
		return "index";
	}
}
