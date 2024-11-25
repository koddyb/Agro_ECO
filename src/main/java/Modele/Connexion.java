package Modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {
	private String serveur, bdd, user, mdp;
	private Connection maConnexion ;
	
	public Connexion(String serveur, String bdd, String user, String mdp, Connection maConnexion) {
		super();
		this.serveur = serveur;
		this.bdd = bdd;
		this.user = user;
		this.mdp = mdp;
	}
	
	public void chargerPilote() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException exp){
			System.out.println("Absence de pilote");			
		}
	}
	public void seConnecter() {
		this.chargerPilote();
		String url="jdbc:mysql://"+this.serveur+"/"+this.bdd;
		try {
			this.maConnexion=DriverManager.getConnection(url, this.user,this.mdp);
		}
		catch(SQLException exp) {
			System.out.println("Erreur de connexion à la bdd.");
			exp.printStackTrace();
		}
	}
	public void deconnexion() {
		try {
			if(this.maConnexion !=null ) {
				this.maConnexion.close();
			}
		}
		catch(SQLException exp) {
			System.out.println("Erreur de déconnexion à la bdd.");
			
		}
	}
	public Connection getMaConnexion() {
		return this.maConnexion;
	}	
}
