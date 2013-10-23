package fr.esiea.cinepose.metier.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
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
	
	public static List<Cinema> getRating() {
		List<Cinema> sortedCinema = new ArrayList<Cinema>(DataBase.getCinemas());
		Collections.sort(sortedCinema, new Comparator<Cinema>() {
		    public int compare(Cinema cinema1, Cinema cinema2) {
		        return (cinema1.getMark() > cinema2.getMark() ? -1 : (cinema1.getMark() == cinema2.getMark() ? 0 : 1));
		    }
		});
		
		return sortedCinema;
	}
}
