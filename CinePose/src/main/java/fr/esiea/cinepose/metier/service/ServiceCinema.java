package fr.esiea.cinepose.metier.service;

import java.util.Date;
import java.util.Set;

import fr.esiea.cinepose.data.DataBase;
import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;

public class ServiceCinema {
	public static void createCinema(String name, String address, String salleNb) {
		Cinema cinema = new Cinema(name, address, salleNb);
		DataBase.addCinema(cinema);
	}
	
	public static Set<Avis> getAllAvis(Cinema cinema) {
		return cinema.getAvis();
	}

	public static Set<Cinema> search(String nom) {
		return DataBase.search(nom);
	}

	public static void addAvisToCinema(Cinema cinema, Avis avis) {
		cinema.addAvis(avis);		
	}
}
