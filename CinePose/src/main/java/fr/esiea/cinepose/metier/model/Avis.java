package fr.esiea.cinepose.metier.model;

public class Avis {
	private int confort;
	private int choice;
	private int noise;
	private int clean;
	private int price;
	private String comment;

	public Avis() {
	}

	public Avis(int confort, int choise, int noise, int clean, int price, String comment) {
		this.confort = confort;
		this.choice = choise;
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
	
	public int getChoice() {
		return choice;
	}
	
	public void setChoice(int choise) {
		this.choice = choise;
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

	public double getMark() {
		return (double) (confort + choice + noise + clean + price) / 5.0;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Avis [confort=");
		builder.append(confort);
		builder.append(", choice=");
		builder.append(choice);
		builder.append(", noise=");
		builder.append(noise);
		builder.append(", clean=");
		builder.append(clean);
		builder.append(", price=");
		builder.append(price);
		builder.append(", comment=");
		builder.append(comment);
		builder.append("]");
		return builder.toString();
	}
}
