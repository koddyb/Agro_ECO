package controleur;

import java.time.LocalDate;

public class EmpreinteCarbone {
	private int id, userId, type_emission;
	private float carbon_emission;
	private LocalDate date;
	
	public EmpreinteCarbone(int id, int userId, int type_emission, float carbon_emission, LocalDate date) {
		super();
		this.id = id;
		this.userId = userId;
		this.type_emission = type_emission;
		this.carbon_emission = carbon_emission;
		this.date = date;
	}

	public EmpreinteCarbone(int userId, int type_emission, float carbon_emission, LocalDate date) {
		super();
		this.id = 0;
		this.userId = userId;
		this.type_emission = type_emission;
		this.carbon_emission = carbon_emission;
		this.date = date;
	}

	//getter and setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getType_emission() {
		return type_emission;
	}

	public void setType_emission(int type_emission) {
		this.type_emission = type_emission;
	}

	public float getCarbon_emission() {
		return carbon_emission;
	}

	public void setCarbon_emission(float carbon_emission) {
		this.carbon_emission = carbon_emission;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}
}