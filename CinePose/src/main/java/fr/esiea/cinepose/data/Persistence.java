package fr.esiea.cinepose.data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import fr.esiea.cinepose.metier.model.Avis;
import fr.esiea.cinepose.metier.model.Cinema;
import fr.esiea.cinepose.metier.service.ServiceAvis;
import fr.esiea.cinepose.metier.service.ServiceCinema;

public class Persistence {
	static String cinemaFile = "cinema_data.csv";
	static String avisFile = "avis_data.csv";
	
	public static void writeData() {
		StringBuilder cinemaStringBuilder = new StringBuilder();
		StringBuilder avisStringBuilder = new StringBuilder();

		cinemaStringBuilder.append("cinema_name;salle_number;address;latitude;longitude\n");
		avisStringBuilder.append("cinema;confort;choice;noise;clean;price;comment;\n");

		for(Cinema cinema : DataBase.getCinemas()) {
			cinemaStringBuilder.append(cinema.getName() + ";");
			cinemaStringBuilder.append(cinema.getSalleNb() + ";");
			cinemaStringBuilder.append(cinema.getAddress() + ";");
			cinemaStringBuilder.append(cinema.getLatitude() + ";");
			cinemaStringBuilder.append(cinema.getLongitude() + ";\n");
			for(Avis avis : cinema.getAvis()) {
				avisStringBuilder.append(cinema.getName() + ";");
				avisStringBuilder.append(avis.getConfort() + ";");
				avisStringBuilder.append(avis.getChoice() + ";");
				avisStringBuilder.append(avis.getNoise() + ";");
				avisStringBuilder.append(avis.getClean() + ";");
				avisStringBuilder.append(avis.getPrice() + ";");
				avisStringBuilder.append(avis.getComment() + ";\n");
			}
		}

		PrintWriter cinemaPrintWriter;
		PrintWriter avisPrintWriter;

		try
		{
			cinemaPrintWriter = new PrintWriter(new FileWriter(new File(cinemaFile)));
			cinemaPrintWriter.print(cinemaStringBuilder);
			cinemaPrintWriter.flush();
			cinemaPrintWriter.close();

			avisPrintWriter = new PrintWriter(new FileWriter(new File(avisFile)));
			avisPrintWriter.print(avisStringBuilder);
			avisPrintWriter.flush();
			avisPrintWriter.close();
		}
		catch (NullPointerException e) {
			System.out.println("Impossible de trouver les fichiers de sauvegarde");
		}
		catch (IOException e)
		{
			System.out.println("Impossible d'écrire dans les fichiers de sauvegarde");
		}
	}

	public static boolean isDataWrited() {
		try {
			InputStream inputStream = new FileInputStream(cinemaFile);
		} catch (FileNotFoundException e) {
			return false;
		} 

		return true;
	}
	
	public static void readData() {
		DataBase.removeAll();
		readCinemaData();
		readAvisData();
	}
	
	public static void readCinemaData() {
		List<String> lines = new ArrayList<String>();
		boolean isFirst = true;
		
		try{
			InputStream inputStream = new FileInputStream(cinemaFile); 
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String line;
			while ((line = bufferedReader.readLine())!=null){
				if (line.equals("")) { 
					continue; 
				} 
				if (line.startsWith("#")) {  
					continue; 
				} 
				if (isFirst) { 
					isFirst = false; 
					continue; 
				}
				lines.add(line);
			}
			bufferedReader.close(); 
		}		
		catch (Exception e){
			System.out.println(e.toString());
		}

		for (String line : lines) { 
			String[] data = line.split(";"); 
			ServiceCinema.createCinema(data[0], data[2], data[1], Float.parseFloat(data[3]), Float.parseFloat(data[4]));
		}
	}

	public static void readAvisData() {
		List<String> lines = new ArrayList<String>();
		boolean isFirst = true;
		
		try{
			InputStream inputStream = new FileInputStream(avisFile);
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String line;
			while ((line = bufferedReader.readLine())!=null){
				if (line.equals("")) { 
					continue; 
				} 
				if (line.startsWith("#")) {  
					continue; 
				} 
				if (isFirst) { 
					isFirst = false; 
					continue; 
				}
				lines.add(line);
			}
			bufferedReader.close(); 
		}		
		catch (Exception e){
			System.out.println(e.toString());
		}

		for (String line : lines) { 
			String[] data = line.split(";"); 
			Set<Cinema> correspondingCinemas = ServiceCinema.search(data[0]);
			
			if(!correspondingCinemas.isEmpty()) {
				Cinema cinema = (Cinema) correspondingCinemas.toArray()[0];
				ServiceAvis.addAvis(cinema, Integer.valueOf(data[1]), Integer.valueOf(data[2]), Integer.valueOf(data[3]), Integer.valueOf(data[4]), Integer.valueOf(data[5]), data[6]);
			}
		}
	}
}
