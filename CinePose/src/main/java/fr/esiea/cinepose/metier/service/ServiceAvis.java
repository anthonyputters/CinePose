package fr.esiea.cinepose.metier.service;

import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;

public class ServiceAvis {
	public static void addAvis(Cinema cinema, int confort, int choise, int noise, int clean, int price, String comment) {
		Avis avis = new Avis(confort, choise, noise, clean, price, comment);
		ServiceCinema.addAvisToCinema(cinema, avis);
	}
}
