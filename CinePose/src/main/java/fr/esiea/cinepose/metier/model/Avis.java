package fr.esiea.cinepose.metier.model;

public class Avis {
	private int confort;
	private int choise;
	private int noise;
	private int clean;
	private int price;
	private String comment;
	
	public Avis(int confort, int choise, int noise, int clean, int price, String comment) {
		this.confort = confort;
		this.choise = choise;
		this.noise = noise;
		this.clean = clean;
		this.price = price;
		this.comment = comment;
	}

	public int getConfort() {
		return confort;
	}
	
	public void setConfort(int confort) {
		this.confort = confort;
	}
	
	public int getChoise() {
		return choise;
	}
	
	public void setChoise(int choise) {
		this.choise = choise;
	}
	
	public int getNoise() {
		return noise;
	}
	
	public void setNoise(int noise) {
		this.noise = noise;
	}
	
	public int getClean() {
		return clean;
	}
	
	public void setClean(int clean) {
		this.clean = clean;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
}
