package fr.esiea.cinepose.metier.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Cinema {
	private String name;
	private String address;
	private String salleNb;
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
}
