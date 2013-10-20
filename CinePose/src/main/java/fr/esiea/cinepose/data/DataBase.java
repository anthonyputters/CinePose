package fr.esiea.cinepose.data;

import java.util.HashSet;
import java.util.Set;

import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;

public class DataBase {
	static Set<Cinema> cinemas = new HashSet<Cinema>();
	static Set<Avis> avis = new HashSet<Avis>();
	
	public static Set<Cinema> getCinemas() {
		return cinemas;
	}
	
	public static Set<Avis> getAvis() {
		return avis;
	}
	
	public static void addCinema(Cinema cinema) {
		cinemas.add(cinema);
	}
	
	public static Set<Cinema> search(String name) {
		Set<Cinema> result = new HashSet<Cinema>();
		
		for (Cinema cinema : cinemas) {
			if(!name.equals("")) {
				if(!name.equalsIgnoreCase(cinema.getName()))
					continue;
			}
			
			result.add(cinema);
		}
		return result;
	}
}
