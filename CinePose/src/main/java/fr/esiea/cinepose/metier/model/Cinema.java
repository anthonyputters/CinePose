package fr.esiea.cinepose.metier.model;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Cinema {
	private String name;
	private String address;
	private String salleNb;
	private float latitude;
	private float longitude;
	private Set<Avis> avis;

	public Cinema() {
		avis = new HashSet<Avis>();
	}

	public Cinema(String name, String address, String salleNb) {
		this.name = name;
		this.address = address;
		this.salleNb = salleNb;
		avis = new HashSet<Avis>();
	}

	public double getMark() {
		double mark = 0.0;
		
		if(avis.isEmpty())
			return 0.0;
		
		for (Iterator<Avis> iterator = avis.iterator(); iterator.hasNext();)
			mark += ((Avis) iterator.next()).getMark();
		
		return mark / ((double) avis.size());
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSalleNb() {
		return salleNb;
	}

	public void setSalleNb(String salleNb) {
		this.salleNb = salleNb;
	}

	public Set<Avis> getAvis() {
		return avis;
	}

	public void setAvis(Set<Avis> avis) {
		this.avis = avis;
	}

	public void addAvis(Avis avis) {
		this.avis.add(avis);
	}
	
	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public String getLastComment() {
		if(avis.isEmpty())
			return "Pas encore d'avis";
		return ((Avis) avis.toArray()[avis.size()-1]).getComment();
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Cinema [name=");
		builder.append(name);
		builder.append(", address=");
		builder.append(address);
		builder.append(", salleNb=");
		builder.append(salleNb);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", avis=");
		builder.append(avis);
		builder.append("]");
		return builder.toString();
	}
}
